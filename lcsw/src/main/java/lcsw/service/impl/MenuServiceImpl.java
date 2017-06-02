package lcsw.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import lcsw.domain.Menu;
import lcsw.domain.Role_Menu;
import lcsw.mapper.MenuMapper;
import lcsw.mapper.Role_MenuMapper;
import lcsw.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Resource
	private MenuMapper mapper;
	@Resource
	private Role_MenuMapper role_MenuMapper;

	@Override
	public List<String> selectAllPerms() {
		return mapper.selectAllPerms();
	}

	@Override
	public List<Menu> getFirstMenu() {
		return mapper.selectList(new EntityWrapper<Menu>().eq("type", 1));
	}

	@Override
	public List<Menu> getSecondMenu(Integer id) {
		if(id.equals(0)){
			return mapper.selectList(new EntityWrapper<Menu>().eq("type", 2));
		}else{
			return mapper.selectList(new EntityWrapper<Menu>().eq("parent_id", id));
		}
	}
	
	@Override
	public List<Menu> getAllMenus(Integer fid, Integer sid) {
		List<Menu> result = new ArrayList<Menu>();
		if(sid.equals(0)&&fid.equals(0)){
			return mapper.selectList(new EntityWrapper<Menu>().ge("type", 3));
		}else if(sid.equals(0) && !(fid.equals(0))){
			List<Menu> list = mapper.selectList(new EntityWrapper<Menu>().eq("parent_id", fid));
			if(list.size() > 0){
				for (Menu menu : list) {
					List<Menu> list1 = mapper.selectList(new EntityWrapper<Menu>().eq("parent_id", menu.getMenuId()));
					result.addAll(list1);
				}
			}
		}else if(!sid.equals(0)){
			return mapper.selectList(new EntityWrapper<Menu>().eq("parent_id", sid));
		}
		return result;
	}

	@Override
	public List<Menu> selectByRoleId(Integer fid, Integer sid,Integer roleId) {
		List<Integer> list = role_MenuMapper.selectByRoleId(roleId);
		List<Menu> result = new ArrayList<Menu>();
		if(list.size() == 0){
			return null;
		}
		List<Menu> roleList = mapper.selectBatchIds(list);
		if(fid.equals(0)&&sid.equals(0)){
			return roleList;
		}else if(sid.equals(0) && !(fid.equals(0))){
			for (Menu menu : roleList) {
				Menu parent = mapper.selectById(menu.getParentId());
				if(parent.getParentId().equals(fid)){
					result.add(menu);
				}
			}
		}else if(!sid.equals(0)){
			for (Menu menu : roleList) {
				if(menu.getParentId().equals(sid)){
					result.add(menu);
				}
			}
		}

		return result;
	}


}
