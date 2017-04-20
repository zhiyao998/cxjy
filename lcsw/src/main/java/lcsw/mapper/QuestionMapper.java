package lcsw.mapper;

import java.util.List;

import lcsw.domain.Question;

public interface QuestionMapper {
    int deleteByPrimaryKey(List<Integer> ids);
    
    int deleteByCaseId(List<Integer> id);

    int insert(Question record);

    Question selectByPrimaryKey(Integer id);
    
    List<Question> selectByCaseId(Integer id);
    
    int updateByPrimaryKey(Question record);
}
