package lcsw.service;

import lcsw.domain.Case;

public interface CaseService {
	
	public Case selectByPrimaryKey(Integer id);	
	
	public int updateByPrimaryKey(Case record);
	
	public int insert(Case record);
	
}
