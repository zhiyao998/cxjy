package lcsw.service;

import java.util.List;

import lcsw.domain.FirstVisit;

public interface FirstVisitService {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(Integer id);

    int insert(FirstVisit record);

//    int insertSelective(Case record);

    FirstVisit selectByPrimaryKey(Integer id);
    
    List<FirstVisit> selectByCaseId(Integer id);

    int updateByPrimaryKey(FirstVisit record);
}