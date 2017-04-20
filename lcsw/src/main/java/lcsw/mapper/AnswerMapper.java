package lcsw.mapper;

import java.util.List;

import lcsw.domain.Answer;

public interface AnswerMapper {
    int deleteByPrimaryKey(List<Integer> ids);

    int insert(Answer record);

    Answer selectByPrimaryKey(Integer id);
    
    List<Answer> selectByCaseId(Integer id);
    
    int updateByPrimaryKey(Answer record);
}
