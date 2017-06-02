package lcsw.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import lcsw.domain.User_Role;

public interface User_RoleMapper extends BaseMapper<User_Role>{
	
	int insertByBatch(List<User_Role> list);
	
	int getRoleCount(Integer id);
}
