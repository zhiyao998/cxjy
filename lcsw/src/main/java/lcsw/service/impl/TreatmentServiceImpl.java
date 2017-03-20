package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Treatment;
import lcsw.mapper.TreatmentMapper;
import lcsw.service.TreatmentService;

@Service
public class TreatmentServiceImpl implements TreatmentService {
	
	@Resource
	private TreatmentMapper treatmentMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return treatmentMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByCaseId(Integer id) {
		return treatmentMapper.deleteByCaseId(id);
	}

	@Override
	public int insert(Treatment record) {
		return treatmentMapper.insert(record);
	}

	@Override
	public Treatment selectByPrimaryKey(Integer id) {
		return treatmentMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Treatment> selectByCaseId(Integer id) {
		return treatmentMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(Treatment record) {
		return treatmentMapper.updateByPrimaryKey(record);
	}

}
