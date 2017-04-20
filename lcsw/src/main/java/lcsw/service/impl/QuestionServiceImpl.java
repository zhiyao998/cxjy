package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Question;
import lcsw.mapper.QuestionMapper;
import lcsw.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	private QuestionMapper qusetionMapper;
	
	@Override
	public int deleteByPrimaryKey(List<Integer> ids) {
		return qusetionMapper.deleteByPrimaryKey(ids);
	}

	@Override
	public int deleteByCaseId(List<Integer> ids) {
		return qusetionMapper.deleteByCaseId(ids);
	}

	@Override
	public int insert(Question record) {
		return qusetionMapper.insert(record);
	}

	@Override
	public Question selectByPrimaryKey(Integer id) {
		return qusetionMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Question> selectByCaseId(Integer id) {
		return qusetionMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(Question record) {
		return qusetionMapper.updateByPrimaryKey(record);
	}

}
