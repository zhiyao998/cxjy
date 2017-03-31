package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.Diagnose;
import lcsw.mapper.DiagnoseMapper;
import lcsw.service.DiagnoseService;

@Service
public class DiagnoseServiceImpl implements DiagnoseService {

	@Resource
	private DiagnoseMapper diagnoseMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return diagnoseMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByCaseId(List<Integer> id) {
		return diagnoseMapper.deleteByCaseId(id);
	}

	@Override
	public int insert(Diagnose record) {
		return diagnoseMapper.insert(record);
	}

	@Override
	public Diagnose selectByPrimaryKey(Integer id) {
		return diagnoseMapper.selectByPrimaryKey(id);
	}

	@Override
	public Diagnose selectByCaseId(Integer id) {
		return diagnoseMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(Diagnose record) {
		return diagnoseMapper.updateByPrimaryKey(record);
	}

}
