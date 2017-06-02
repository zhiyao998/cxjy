package lcsw.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Role;

public interface RoleMapper extends BaseMapper<Role>{
	
	List<Role> selectRoleList(Page<Role> role);
	
	List<Role> selectByUserId(Integer id);
	
	
}
