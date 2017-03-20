package lcsw.service;

import java.util.List;

import lcsw.domain.Case;

public interface CaseService {
	
	public Case selectByPrimaryKey(Integer id);	
	
	public List<Case> selectAll();
	
	public int updateByPrimaryKey(Case record);
	
	public int insert(Case record);
	
}
