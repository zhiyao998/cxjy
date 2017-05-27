package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;

import lcsw.domain.Case;
import lcsw.mapper.CaseMapper;
import lcsw.service.CaseService;

@Service
public class CaseServiceImpl implements CaseService {
	
	@Resource
	private CaseMapper caseMapper;

	@Override
	public Case selectByPrimaryKey(Integer id) {
		return caseMapper.selectById(id);
	}

	@Override
	public int updateByPrimaryKey(Case record) {
		return caseMapper.updateById(record);
	}

	@Override
	public int insert(Case record) {
		return caseMapper.insert(record);
	}

	@Override
	public Page<Case> selectCaseList(Page<Case> page, Integer state) {
		List<Case> cases = caseMapper.selectCaseList(page, state);
	    page.setRecords(cases);
	    return page;
	}
	
	@Override
	public int deleteByPrimaryKey(List<Integer> ids) {
		return caseMapper.deleteBatchIds(ids);
	}

	@Override
	public List<Case> selectAll() {
		return caseMapper.selectList(new EntityWrapper<Case>().eq("title_type", "A3"));
	}

	@Override
	public Integer selectAverageCount(String caseType) {
		return caseMapper.selectAverageCount(caseType);
	}

	@Override
	public List<Case> selectCaseByRandom(String caseType, Integer num) {
		return caseMapper.selectCaseByRandom(caseType, num);
	}

	@Override
	public List<Case> selectCaseByIds(List<Integer> ids) {
		return caseMapper.selectBatchIds(ids);
	}

}
