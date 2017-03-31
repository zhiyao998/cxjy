package lcsw.mapper;

import java.util.List;

import lcsw.domain.FirstVisit;

public interface FirstVisitMapper {

    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(FirstVisit record);

//    int insertSelective(Case record);

    FirstVisit selectByPrimaryKey(Integer id);
    
    FirstVisit selectByCaseId(Integer id);

    int updateByPrimaryKey(FirstVisit record);
	
}
