package lcsw.service;

import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Case;

public interface CaseService {
	
	public Case selectByPrimaryKey(Integer id);	
	
	public Page<Case> selectCaseList(Page<Case> page, Integer state);
	
	public List<Case> selectCaseByIds(List<Integer> ids);
	
	public List<Case> selectAll();
	
	public int updateByPrimaryKey(Case record);
	
	public int insert(Case record);
	
	public int deleteByPrimaryKey(List<Integer> ids);
	
	public Integer selectAverageCount(String caseType);
	
	public List<Case> selectCaseByRandom(String caseType, Integer num);
	
}
