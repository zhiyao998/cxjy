package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Role;
import lcsw.mapper.RoleMapper;
import lcsw.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	
	@Resource
	RoleMapper roleMapper;

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
	public int delectByIds(List<Integer> list) {
		return roleMapper.deleteBatchIds(list);
	}

}
