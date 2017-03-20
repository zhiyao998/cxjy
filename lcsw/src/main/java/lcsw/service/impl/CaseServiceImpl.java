package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Case;
import lcsw.mapper.CaseMapper;
import lcsw.service.CaseService;

@Service
public class CaseServiceImpl implements CaseService {
	
	@Resource
	private CaseMapper caseMapper;

	@Override
	public Case selectByPrimaryKey(Integer id) {
		return caseMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKey(Case record) {
		return caseMapper.updateByPrimaryKey(record);
	}

	@Override
	public int insert(Case record) {
		return caseMapper.insert(record);
	}

	@Override
	public List<Case> selectAll() {
		return caseMapper.selectAll();
	}

}
