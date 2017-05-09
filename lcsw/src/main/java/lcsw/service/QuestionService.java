package lcsw.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Question;

public interface QuestionService {
	
    int deleteByPrimaryKey(List<Integer> ids);
    
    int deleteByCaseId(List<Integer> ids);

    int insert(Question record);

    Question selectByPrimaryKey(Integer id);
    
    Page<Question> selectByCaseId(Page<Question> page, Integer state,Integer id);
    
    List<Question> selectByCase(Integer id);
    
    Map<String,Integer> selectQuestionCountByCase(Integer id);

    int updateByPrimaryKey(Question record);
	
    String selectFtheme(Integer id);
}
