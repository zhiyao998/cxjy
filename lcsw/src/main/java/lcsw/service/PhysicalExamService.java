package lcsw.service;

import java.util.List;

import lcsw.domain.PhysicalExam;

public interface PhysicalExamService {

    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(PhysicalExam record);

//    int insertSelective(Case record);

    PhysicalExam selectByPrimaryKey(Integer id);
    
    List<PhysicalExam> selectByCaseId(Integer id);
    
    List<PhysicalExam> selectByType(Integer type);

    int updateByPrimaryKey(PhysicalExam record);
	
}
