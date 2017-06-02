package lcsw.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import lcsw.domain.Role_Menu;

public interface Role_MenuMapper extends BaseMapper<Role_Menu> {
	
	int insertByBatch(List<Role_Menu> role_Menus);
	
	List<Integer> selectByRoleId(Integer id);
}
