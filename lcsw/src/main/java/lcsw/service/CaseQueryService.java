package lcsw.service;

import java.util.List;

import lcsw.domain.CaseQuery;

public interface CaseQueryService {

	public CaseQuery selectByPrimaryKey(Integer id);	
	
	public List<CaseQuery> selectAll();
	
	public int updateByPrimaryKey(CaseQuery record);
	
	public int insert(CaseQuery record);
	
	public int deleteByPrimaryKey(List<Integer> ids);
	
}
