package lcsw.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Case;
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
	public String selectFtheme(Integer id) {
		String oldFtheme = qusetionMapper.selectFtheme(id);
		return oldFtheme;
	}

	@Override
	public List<Question> selectByCase(Integer id) {
		return qusetionMapper.selectList(new EntityWrapper<Question>().eq("case_id", id));
	}

	@Override
	public Map<String,Integer> selectQuestionCountByCase(Integer id) {
		Integer count = 0;
		Map<String,Integer> map = new HashMap<String,Integer>();
		String ftheme[] = {"问诊","体格检查","初步诊断","辅助检查","确诊","治疗方案","病人管理"};
		for(int i = 0; i < ftheme.length; i++){
			count = qusetionMapper.selectCount(new EntityWrapper<Question>().eq("case_id", id).eq("ftheme", ftheme[i]));
			map.put(ftheme[i], count);
		}		
		return map;
	}

}
