package lcsw.mapper;

import java.util.List;

import lcsw.domain.PatientManagement;

public interface PatientManagementMapper {
	
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(PatientManagement record);
    
    int insertByBatch(List<PatientManagement> record);

//    int insertSelective(Case record);

    PatientManagement selectByPrimaryKey(Integer id);
    
    List<PatientManagement> selectByCaseId(Integer id);

    int updateByPrimaryKey(PatientManagement record);
	
}
