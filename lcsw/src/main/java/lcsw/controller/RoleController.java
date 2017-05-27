package lcsw.controller;

import java.sql.Timestamp;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Role;
import lcsw.domain.User;
import lcsw.service.MenuService;
import lcsw.service.RoleService;
import lcsw.util.base.R;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	private MenuService menuService;
	@Resource
	private RoleService roleService;
	
	@RequestMapping("/roleSet")
	public String roleSet(){
		return "/role/roleList";
	}
	
	@RequestMapping("/roleList")
	@ResponseBody
	public Map roleList(HttpServletRequest request,HttpServletResponse response){
		String rows = request.getParameter("rows");
		String page = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		Page<Role> roles = new Page<Role>(Integer.valueOf(page), Integer.valueOf(rows));
		roles = roleService.selectRoleList(roles);
		map.put("total", roles.getSize());
		map.put("rows", roles.getRecords());
		return map;
	}
	
	@RequestMapping("/toAddRole")
	public String toAddRole(){
		return "/role/addRole";
	}
	
	@RequestMapping("/toEditRole")
	public String toEditRole(HttpServletRequest request,String id){
		Role role = roleService.selectRoleById(Integer.valueOf(id));
		request.setAttribute("role", role);
		return "/role/editRole";
	}
	
	@RequestMapping("/editRole")
	@ResponseBody
	public R editRole(Role role){
		roleService.update(role);
		return R.ok();
	}
	
	@RequestMapping("/deleteRole")
	@ResponseBody
	public R deleteUser(String id){
		List<Integer> list = new ArrayList<Integer>();
		list.add(Integer.parseInt(id));
		roleService.delectByIds(list);
		return R.ok();
	}
	
	@RequestMapping("/addRole")
	@ResponseBody
	public R addRole(Role role){
		Subject subject = SecurityUtils.getSubject();
		User user = (User) subject.getPrincipal();
		role.setCreatorId(user.getId());
		role.setCreateTime(new Timestamp(System.currentTimeMillis()));
		roleService.insertRole(role);
		return R.ok();
	}
}
