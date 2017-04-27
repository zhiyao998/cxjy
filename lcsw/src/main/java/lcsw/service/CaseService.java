package lcsw.service;

import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Case;

public interface CaseService {
	
	public Case selectByPrimaryKey(Integer id);	
	
	public Page<Case> selectCaseList(Page<Case> page, Integer state);
	
	public int updateByPrimaryKey(Case record);
	
	public int insert(Case record);
	
	public int deleteByPrimaryKey(List<Integer> ids);
	
}
