package lcsw.service;

import java.util.List;

import lcsw.domain.Menu;

public interface MenuService {
	
	List<String> selectAllPerms();
	
	List<Menu> selectByRoleId(Integer fid, Integer sid,Integer roleId);
	
	List<Menu> getFirstMenu();
	
	List<Menu> getSecondMenu(Integer id);
	
	List<Menu> getAllMenus(Integer fid, Integer sid);
	
}
