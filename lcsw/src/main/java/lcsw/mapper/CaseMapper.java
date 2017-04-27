package lcsw.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import lcsw.domain.Case;

public interface CaseMapper extends BaseMapper<Case>{
	List<Case> selectCaseList(Pagination page, Integer state);
}
