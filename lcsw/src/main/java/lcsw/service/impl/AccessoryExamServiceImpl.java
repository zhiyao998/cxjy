package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.AccessoryExam;
import lcsw.mapper.AccessoryExamMapper;
import lcsw.service.AccessoryExamService;

@Service
public class AccessoryExamServiceImpl implements AccessoryExamService {
	
	@Resource
	private AccessoryExamMapper accessoryExamMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return accessoryExamMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByCaseId(List<Integer> id) {
		return accessoryExamMapper.deleteByCaseId(id);
	}

	@Override
	public int insert(AccessoryExam record) {
		return accessoryExamMapper.insert(record);
	}

	@Override
	public AccessoryExam selectByPrimaryKey(Integer id) {
		return accessoryExamMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<AccessoryExam> selectByCaseId(Integer id) {
		return accessoryExamMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(AccessoryExam record) {
		return accessoryExamMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Integer> selectAccessoryExamTypeByResultType(Integer id) {
		return accessoryExamMapper.selectAccessoryExamTypeByResultType(id);
	}

	@Override
	public List<AccessoryExam> selectByAccessoryExamType(Integer id) {
		return accessoryExamMapper.selectByAccessoryExamType(id);
	}

}
