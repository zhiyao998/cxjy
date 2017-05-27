package lcsw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import lcsw.domain.Case;

public interface CaseMapper extends BaseMapper<Case>{
	List<Case> selectCaseList(Pagination page, Integer state);
	Integer selectAverageCount(@Param("caseType") String caseType);
	List<Case> selectCaseByRandom(@Param("caseType") String caseType,@Param("num") Integer num);
}
