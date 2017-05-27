package lcsw.service;

import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.User;

public interface UserService {
	
	int insert(User user);
	
	int update(User user);
	
	int deleteByIds(List<Integer> list);
	
	List<User> findByName(String name);
	
	Page<User> selectUserList(Page<User> page);
	
	int updatePassword(int id, String oldPass, String newPass);
	
	User selectUserById(Integer id);

	List<String> selectPermsByUserId(Integer id);
}
