package lcsw.mapper;

import java.util.List;

import lcsw.domain.Case;

public interface CaseMapper {

    int deleteByPrimaryKey(Integer id);

    int insert(Case record);

//    int insertSelective(Case record);

    Case selectByPrimaryKey(Integer id);
    
    List<Case> selectAll();

    int updateByPrimaryKey(Case record);
	
	
}
