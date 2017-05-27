package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.mapper.MenuMapper;
import lcsw.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Resource
	private MenuMapper mapper;

	@Override
	public List<String> selectAllPerms() {
		return mapper.selectAllPerms();
	}

}
