package lcsw.service;

import java.util.List;

import lcsw.domain.Answer;

public interface AnswerService {
	
    int deleteByPrimaryKey(List<Integer> ids);

    int insert(Answer record);

    Answer selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(Answer record);
}
