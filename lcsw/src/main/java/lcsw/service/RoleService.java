package lcsw.service;

import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Role;

public interface RoleService{
	
	public int insertRole(Role role);
	
	public int update(Role role);
	
	public Page<Role> selectRoleList(Page<Role> role);
	
	public List<Role> selectByUserId(Integer id);
	
	public Role selectRoleById(Integer id);
	
	public int delectByIds(List<Integer> list);
}
