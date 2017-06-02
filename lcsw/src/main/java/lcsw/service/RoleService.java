package lcsw.service;

import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Role;
import lcsw.domain.Role_Menu;

public interface RoleService{
	
	public int insertRole(Role role);
	
	public int insertPerms(List<Role_Menu> list);
	
	public int update(Role role);
	
	public Page<Role> selectRoleList(Page<Role> role);
	
	public List<Role> selectByUserId(Integer id);
	
	public Role selectRoleById(Integer id);
	
	public List<Role> selectAllRoles();
	
	public int deleteByIds(List<Integer> list);
	
	public int editRolePerms(Integer roleId, List<Integer> perms);
}
