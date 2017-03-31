package lcsw.service;

import java.util.List;

import lcsw.domain.Diagnose;

public interface DiagnoseService {
	
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(Diagnose record);

//    int insertSelective(Case record);

    Diagnose selectByPrimaryKey(Integer id);
    
    Diagnose selectByCaseId(Integer id);

    int updateByPrimaryKey(Diagnose record);
	
}
