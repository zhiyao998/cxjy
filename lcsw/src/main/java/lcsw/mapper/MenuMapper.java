package lcsw.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;

import lcsw.domain.Menu;

public interface MenuMapper extends BaseMapper<Menu>{
	
	public List<String> selectAllPerms(); 
	
}
