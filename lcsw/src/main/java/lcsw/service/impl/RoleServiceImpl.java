package lcsw.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Role;
import lcsw.domain.Role_Menu;
import lcsw.mapper.RoleMapper;
import lcsw.mapper.Role_MenuMapper;
import lcsw.mapper.User_RoleMapper;
import lcsw.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Resource
	RoleMapper roleMapper;
	@Resource
	Role_MenuMapper role_MenuMapper;
	@Resource
	private User_RoleMapper user_RoleMapper;

	@Override
	public int insertRole(Role role) {
		return roleMapper.insert(role);
	}

	@Override
	public int update(Role role) {
		return roleMapper.updateById(role);
	}

	@Override
	public Page<Role> selectRoleList(Page<Role> role) {
		List<Role> roles = roleMapper.selectRoleList(role);
		for (int i = 0; i < roles.size(); i++) {
			int count = user_RoleMapper.getRoleCount(roles.get(i).getRoleId());
			roles.get(i).setRoleCount(count);
		}
		role.setRecords(roles);
		return role;
	}

	@Override
	public List<Role> selectByUserId(Integer id) {
		return roleMapper.selectByUserId(id);
	}

	@Override
	public Role selectRoleById(Integer id) {
		return roleMapper.selectById(id);
	}

	@Override
	public int deleteByIds(List<Integer> list) {
		return roleMapper.deleteBatchIds(list);
	}

	@Override
	public int insertPerms(List<Role_Menu> list) {
		return role_MenuMapper.insertByBatch(list);
	}

	@Override
	public int editRolePerms(Integer roleId, List<Integer> perms) {
		if(perms.size() == 0){
			return role_MenuMapper.delete(new EntityWrapper<Role_Menu>().eq("role_id", roleId));
		}
		role_MenuMapper.delete(new EntityWrapper<Role_Menu>().eq("role_id", roleId));
		List<Role_Menu> list = new ArrayList<Role_Menu>();
		for (Integer perm : perms) {
			Role_Menu rm = new Role_Menu();
			rm.setMenuId(perm);
			rm.setRoleId(roleId);
			list.add(rm);
		}
		return role_MenuMapper.insertByBatch(list);
	}

	@Override
	public List<Role> selectAllRoles() {
		return roleMapper.selectList(new EntityWrapper<Role>());
	}

}
