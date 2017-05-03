package lcsw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import lcsw.domain.Question;

public interface QuestionMapper extends BaseMapper<Question>{
	List<Question> selectQuestionListByCaseId(Pagination page, @Param("state") Integer state, @Param("caseId") Integer caseId);
	Integer selectCountByThemeAndType(@Param("titleType") String titleType, @Param("ftheme") String ftheme);
	String selectFtheme(Integer id);
}
