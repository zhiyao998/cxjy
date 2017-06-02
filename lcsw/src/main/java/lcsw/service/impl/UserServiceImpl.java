package lcsw.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.User;
import lcsw.domain.User_Role;
import lcsw.mapper.RoleMapper;
import lcsw.mapper.UserMapper;
import lcsw.mapper.User_RoleMapper;
import lcsw.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Resource
	private UserMapper userMapper;
	@Resource
	private User_RoleMapper user_RoleMapper;
	@Resource
	private RoleMapper roleMapper;
	
	@Override
	public int insert(User user) {
		return userMapper.insert(user);
	}

	@Override
	public int update(User user) {
		return userMapper.updateById(user);
	}

	@Override
	public int deleteByIds(List<Integer> list) {
		return userMapper.deleteBatchIds(list);
	}

	@Override
	public List<User> findByName(String name) {
		return userMapper.selectList(new EntityWrapper<User>().eq("name", name));
	}

	@Override
	public Page<User> selectUserList(Page<User> page, Integer id) {
		List<User> users = userMapper.selectUserList(page,id);
		page.setRecords(users);
		return page;
	}

	@Override
	public int updatePassword(int id, String oldPass, String newPass) {
		User user = (User) userMapper.selectById(id);
		if(!user.getPassword().equals(oldPass)){
			return 0;
		}else{
			user.setPassword(newPass);
			return userMapper.updateById(user);
		}
	}

	@Override
	public User selectUserById(Integer id) {
		return userMapper.selectById(id);
	}

	@Override
	public List<String> selectPermsByUserId(Integer id) {
		return userMapper.selectPermsByUserId(id);
	}

	@Override
	public int editUserRole(Integer userId, List<Integer> roleIds) {
		user_RoleMapper.delete(new EntityWrapper<User_Role>().eq("user_id", userId));
		List<User_Role> list = new ArrayList<User_Role>();
		for (Integer id : roleIds) {
			User_Role ur = new User_Role();
			ur.setRoleId(id);
			ur.setUserId(userId);
			list.add(ur);
		}
		return user_RoleMapper.insertByBatch(list);
	}

}
