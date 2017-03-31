package lcsw.service;

import java.util.List;

import lcsw.domain.AccessoryExam;

public interface AccessoryExamService {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByCaseId(List<Integer> ids);

    int insert(AccessoryExam record);

//    int insertSelective(Case record);

    AccessoryExam selectByPrimaryKey(Integer id);
    
    List<AccessoryExam> selectByCaseId(Integer id);

    int updateByPrimaryKey(AccessoryExam record);
    
    List<Integer> selectAccessoryExamTypeByResultType(Integer id);
    
    List<AccessoryExam> selectByAccessoryExamType(Integer id);
}
