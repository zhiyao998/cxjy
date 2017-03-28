package lcsw.service;

import java.util.List;

import lcsw.domain.AccessoryExam;

public interface AccessoryExamService {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(Integer id);

    int insert(AccessoryExam record);

//    int insertSelective(Case record);

    AccessoryExam selectByPrimaryKey(Integer id);
    
    List<AccessoryExam> selectByCaseId(Integer id);

    int updateByPrimaryKey(AccessoryExam record);
    
    List<AccessoryExam> selectByResultType(Integer id);
    
    List<AccessoryExam> selectByAccessoryExamType(Integer id);
}
