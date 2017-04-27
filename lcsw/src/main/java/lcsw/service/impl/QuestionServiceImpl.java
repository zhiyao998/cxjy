package lcsw.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Case;
import lcsw.domain.Question;
import lcsw.domain.QuestionType;
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
				answerMapper.deleteBatchIds(a);
			}
		}
		return qusetionMapper.deleteBatchIds(ids);
	}

	@Override
	public int deleteByCaseId(List<Integer> ids) {
		int flag = 1;
		for(Integer i: ids){
			List<Question> questions = qusetionMapper.selectList(new EntityWrapper<Question>().eq("case_id", i));
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
		return qusetionMapper.selectById(id);
	}

	@Override
	public Page<Question> selectByCaseId(Page<Question> page, Integer state,Integer id) {
		page.setRecords(qusetionMapper.selectQuestionListByCaseId(page, state, id));
		return page;
	}

	@Override
	public int updateByPrimaryKey(Question record) {
		return qusetionMapper.updateById(record);
	}

	@Override
	public List<QuestionType> selectCountByThemeAndType() {
		List<QuestionType> questionTypes = new ArrayList<QuestionType>();
		QuestionType questionType = new QuestionType();
		String ftheme[] = {"问诊","体格检查","初步诊断","辅助检查","确诊","治疗方案","病人管理"};
		
		for(int i = 0 ; i < ftheme.length; i++){
			questionType.setFtheme(ftheme[i]);
			questionType.setTitleType("A2");
			questionType.setCount(qusetionMapper.selectCountByThemeAndType("A2", ftheme[i]));
			questionTypes.add(questionType);
			questionType.setTitleType("A4");
			questionType.setCount(qusetionMapper.selectCountByThemeAndType("A4", ftheme[i]));
			questionTypes.add(questionType);
		}
		return questionTypes;
	}

}
