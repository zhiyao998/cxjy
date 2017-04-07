package lcsw.mapper;

import java.util.List;

import lcsw.domain.PhysicalExam;

public interface PhysicalExamMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> id);

    int insert(PhysicalExam record);
    
    int insertByBatch(List<PhysicalExam> record);

//    int insertSelective(Case record);

    PhysicalExam selectByPrimaryKey(Integer id);
    
    List<PhysicalExam> selectByCaseId(Integer id);

    List<PhysicalExam> selectByType(String type);
    
    int updateByPrimaryKey(PhysicalExam record);
    
    int updateByBatch(List<PhysicalExam> record);
	
}
