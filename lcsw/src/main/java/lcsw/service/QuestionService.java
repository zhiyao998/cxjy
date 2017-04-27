package lcsw.service;

import java.util.List;

import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Question;
import lcsw.domain.QuestionType;

public interface QuestionService {
	
    int deleteByPrimaryKey(List<Integer> ids);
    
    int deleteByCaseId(List<Integer> ids);

    int insert(Question record);

    Question selectByPrimaryKey(Integer id);
    
    Page<Question> selectByCaseId(Page<Question> page, Integer state,Integer id);
    
    List<QuestionType> selectCountByThemeAndType();

    int updateByPrimaryKey(Question record);
	
}
