package lcsw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Role;
import lcsw.domain.User;
import lcsw.service.RoleService;
import lcsw.service.UserService;
import lcsw.util.base.R;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Resource
	private UserService userService;
	@Resource
	private RoleService roleService;
	
	@RequestMapping("/toEditUserRoles")
	public String toEditUserPerms(HttpServletRequest request,String id){
		request.setAttribute("windowid", request.getParameter("windowid"));
		request.setAttribute("userId", id);
		return "/standard/editUserRoles";
	}
	
	@RequestMapping(value="/userList")
	@ResponseBody
	public Map listUser(HttpServletRequest request,HttpServletResponse response){
		String rows = request.getParameter("rows");
		String page = request.getParameter("page");
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		Map<String, Object> map = new HashMap<String, Object>();
		Page<User> users = new Page<User>(Integer.valueOf(page), Integer.valueOf(rows));
		users = userService.selectUserList(users,user.getId());
		map.put("total", users.getTotal());
		map.put("rows", users.getRecords());
		return map;
	}
	
	@RequestMapping(value="/userMagt")
	public String userMagt(){
		return "/user/userMagt";
	}
	
	@RequestMapping("/toEditPassword")
	public String editPasswordPage(){
		return "/user/editPassword";
	}
	
	@RequestMapping("/toAddUser")
	public String toAddUser(){
		return "/user/addUser";
	}
	
	@RequestMapping("/toEditUser")
	public String toEditUser(HttpServletRequest request,String id){
		User user = userService.selectUserById(Integer.parseInt(id));
		request.setAttribute("user", user);
		return "/user/editUser";
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public R addUser(User user){
		Subject subject = SecurityUtils.getSubject();
		User creator = (User) subject.getPrincipal();
		user.setCreatorId(creator.getId());
		userService.insert(user);
		return R.ok();
	}
	
	@RequestMapping("/editUser")
	@ResponseBody
	public R editUser(User user){
		userService.update(user);
		return R.ok();
	}
	
	@RequestMapping("/deleteUser")
	@ResponseBody
	public R deleteUser(String id){
		List<Integer> list = new ArrayList<Integer>();
		list.add(Integer.parseInt(id));
		userService.deleteByIds(list);
		return R.ok();
	}
	
	@RequestMapping("/editPassword")
	@ResponseBody
	public R editPassword(String oldPassword, String password){
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		int flag = userService.updatePassword(user.getId(), oldPassword, password);
		if(flag == 1){
			subject.logout();
			return R.ok();
		}else{
			return R.error("原密码错误");
		}
	}
	
	@RequestMapping("/getUserRoles")
	@ResponseBody
	public Map getUserRoles(HttpServletRequest request){
		Map map = new HashMap<String,Object>();
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		List<Role> all = roleService.selectAllRoles();
		List<Role> user = roleService.selectByUserId(userId);
		if(user != null){
			all.removeAll(user);
		}
		map.put("all", all);
		map.put("user", user);
		return map;
	}
	
	@RequestMapping("/editUserRoles")
	@ResponseBody
	public R editUserRoles(HttpServletRequest request){
		String ids[] = request.getParameter("ids").split(",");
		Integer userId = Integer.valueOf(request.getParameter("userId"));
		List<Integer> list = new ArrayList<Integer>();
		for (String id : ids) {
			list.add(Integer.valueOf(id));
		}
		userService.editUserRole(userId, list);
		return R.ok();
	}
}
