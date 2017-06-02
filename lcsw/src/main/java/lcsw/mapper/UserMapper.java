package lcsw.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import lcsw.domain.User;

public interface UserMapper extends BaseMapper<User>{
	
	List<User> selectUserList(Pagination page,Integer id);
	
	List<String> selectPermsByUserId(Integer id);
	
}
