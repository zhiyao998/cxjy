package lcsw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lcsw.domain.Menu;
import lcsw.service.MenuService;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Resource
	MenuService menuService;
	
	@RequestMapping("/toEditRolePerms")
	public String toEditPerms(HttpServletRequest request,String id){
		request.setAttribute("windowid", request.getParameter("windowid"));
		request.setAttribute("roleId", id);
		return "/standard/editRolePerms";
	}
	
	@RequestMapping("/getFirstMenu")
	@ResponseBody
	public List getFirstMenu(){
		List<Map> list = new ArrayList<Map>();
		List<Menu> menus = menuService.getFirstMenu();
		Map map = new HashMap<String,Object>();
		map.put("id", 0);
		map.put("text", "(全部)");
		map.put("selected", true);
		list.add(map);
		for (Menu menu : menus) {
			Map menuMap = new HashMap<String,Object>();
			menuMap.put("id", menu.getMenuId());
			menuMap.put("text", menu.getMenuName());
			list.add(menuMap);
		}
		return list;
	}
	
	@RequestMapping("/getSecondMenu")
	@ResponseBody
	public List getSecondMenu(String id){
		List<Map> list = new ArrayList<Map>();
		List<Menu> menus = menuService.getSecondMenu(Integer.valueOf(id));
		Map map = new HashMap<String,Object>();
		map.put("id", 0);
		map.put("text", "(全部)");
		map.put("selected", true);
		list.add(map);
		for (Menu menu : menus) {
			Map menuMap = new HashMap<String,Object>();
			menuMap.put("id", menu.getMenuId());
			menuMap.put("text", menu.getMenuName());
			list.add(menuMap);
		}
		return list;
	}
	
	@RequestMapping("/getRolePerms")
	@ResponseBody
	public Map getAllPerms(HttpServletRequest request){
		Map map = new HashMap<String,Object>();
		Integer fid = Integer.valueOf(request.getParameter("fid"));
		Integer sid = Integer.valueOf(request.getParameter("sid"));
		Integer roleId = Integer.valueOf(request.getParameter("roleId"));
		List<Menu> roleList = menuService.selectByRoleId(fid,sid,roleId);
		List<Menu> allperms = menuService.getAllMenus(fid, sid);
		if(roleList != null && allperms != null){
			allperms.removeAll(roleList);
		}
		map.put("all", allperms);
		map.put("role", roleList);
		return map;
	}
	
}
