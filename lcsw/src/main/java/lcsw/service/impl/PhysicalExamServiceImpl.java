package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.PhysicalExam;
import lcsw.mapper.PhysicalExamMapper;

@Service
public class PhysicalExamServiceImpl implements lcsw.service.PhysicalExamService {

	@Resource
	private PhysicalExamMapper physicalExamMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return physicalExamMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByCaseId(List<Integer> id) {
		return physicalExamMapper.deleteByCaseId(id);
	}

	@Override
	public int insert(PhysicalExam record) {
		return physicalExamMapper.insert(record);
	}

	@Override
	public PhysicalExam selectByPrimaryKey(Integer id) {
		return physicalExamMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<PhysicalExam> selectByCaseId(Integer id) {
		return physicalExamMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(PhysicalExam record) {
		return physicalExamMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<PhysicalExam> selectByType(Integer type) {
		return physicalExamMapper.selectByType(type);
	}

}
