package lcsw.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Question;
import lcsw.mapper.AnswerMapper;
import lcsw.mapper.QuestionMapper;
import lcsw.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Resource
	private QuestionMapper qusetionMapper;
	@Resource
	private AnswerMapper answerMapper;
	
	@Override
	public int deleteByPrimaryKey(List<Integer> ids) {
		for(Integer id:ids){
			Question question = selectByPrimaryKey(id);
			if(question.getAnswers() != null && question.getAnswers() != ""){
				String answers[] = question.getAnswers().split(",");
				List<Integer> a = new ArrayList<Integer>();
				for(int i = 0; i < answers.length; i++){
					a.add(Integer.parseInt(answers[i])); 
				}
				answerMapper.deleteByPrimaryKey(a);
			}
		}
		return qusetionMapper.deleteByPrimaryKey(ids);
	}

	@Override
	public int deleteByCaseId(List<Integer> ids) {
		int flag = 1;
		for(Integer i: ids){
			List<Question> questions = qusetionMapper.selectByCaseId(i);
			if(!questions.isEmpty()){
				List<Integer> quIntegersId = new ArrayList<Integer>();
				for(Question q : questions){
					quIntegersId.add(q.getQuestionId());
				}
				flag *= deleteByPrimaryKey(quIntegersId);
			}
		}
		return flag;
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