package lcsw.service;

import java.util.List;

import lcsw.domain.PatientManagement;

public interface PatientManagementService {

    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(Integer id);

    int insert(PatientManagement record);

//    int insertSelective(Case record);

    PatientManagement selectByPrimaryKey(Integer id);
    
    List<PatientManagement> selectByCaseId(Integer id);

    int updateByPrimaryKey(PatientManagement record);
	
}
