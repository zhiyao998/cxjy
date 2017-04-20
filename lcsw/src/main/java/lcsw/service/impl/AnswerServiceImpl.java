package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Answer;
import lcsw.mapper.AnswerMapper;
import lcsw.service.AnswerService;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Resource
	private AnswerMapper answerMapper; 

	@Override
	public int deleteByPrimaryKey(List<Integer> ids) {
		return answerMapper.deleteByPrimaryKey(ids);
	}

	@Override
	public int insert(Answer record) {
		return answerMapper.insert(record);
	}

	@Override
	public Answer selectByPrimaryKey(Integer id) {
		return answerMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Answer record) {
		return answerMapper.updateByPrimaryKey(record);
	}

}
