package lcsw.service;

import java.util.List;

import lcsw.domain.Question;

public interface QuestionService {
	
    int deleteByPrimaryKey(List<Integer> ids);
    
    int deleteByCaseId(List<Integer> ids);

    int insert(Question record);

    Question selectByPrimaryKey(Integer id);
    
    List<Question> selectByCaseId(Integer id);

    int updateByPrimaryKey(Question record);
	
}
