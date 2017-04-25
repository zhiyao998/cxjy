package lcsw.mapper;

import java.util.List;

import lcsw.domain.Case;

public interface CaseMapper {

    int deleteByPrimaryKey(List<Integer> ids);

    int insert(Case record);

    Case selectByPrimaryKey(Integer id);
    
    List<Case> selectAll();

    int updateByPrimaryKey(Case record);
	
    
	
}
