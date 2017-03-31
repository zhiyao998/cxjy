package lcsw.service;

import java.util.List;

import lcsw.domain.Treatment;

public interface TreatmentService {
	
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(Treatment record);

//    int insertSelective(Case record);

    Treatment selectByPrimaryKey(Integer id);
    
    List<Treatment> selectByCaseId(Integer id);

    int updateByPrimaryKey(Treatment record);
	
	
}
