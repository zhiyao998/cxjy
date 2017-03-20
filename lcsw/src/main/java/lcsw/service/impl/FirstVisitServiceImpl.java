package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.FirstVisit;
import lcsw.mapper.FirstVisitMapper;
import lcsw.service.FirstVisitService;

@Service
public class FirstVisitServiceImpl implements FirstVisitService {
	
	@Resource
	private FirstVisitMapper firstVisitMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return firstVisitMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByCaseId(Integer id) {
		return firstVisitMapper.deleteByCaseId(id);
	}

	@Override
	public int insert(FirstVisit record) {
		return firstVisitMapper.insert(record);
	}

	@Override
	public FirstVisit selectByPrimaryKey(Integer id) {
		return firstVisitMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<FirstVisit> selectByCaseId(Integer id) {
		return firstVisitMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(FirstVisit record) {
		return firstVisitMapper.updateByPrimaryKey(record);
	}

}
