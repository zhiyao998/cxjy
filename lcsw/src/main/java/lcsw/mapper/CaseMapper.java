package lcsw.mapper;

import lcsw.domain.Case;

public interface CaseMapper {

/*    int deleteByPrimaryKey(Integer id);*/

    int insert(Case record);

//    int insertSelective(Case record);

    Case selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Case record);
	
	
}
