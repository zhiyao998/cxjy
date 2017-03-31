package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lcsw.domain.PatientManagement;
import lcsw.mapper.PatientManagementMapper;
import lcsw.service.PatientManagementService;

@Service
public class PatientManagementServiceImpl implements PatientManagementService {
	
	@Resource
	private PatientManagementMapper patientManagementMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return patientManagementMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByCaseId(List<Integer> id) {
		return patientManagementMapper.deleteByCaseId(id);
	}

	@Override
	public int insert(PatientManagement record) {
		return patientManagementMapper.insert(record);
	}

	@Override
	public PatientManagement selectByPrimaryKey(Integer id) {
		return patientManagementMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<PatientManagement> selectByCaseId(Integer id) {
		return patientManagementMapper.selectByCaseId(id);
	}

	@Override
	public int updateByPrimaryKey(PatientManagement record) {
		return patientManagementMapper.updateByPrimaryKey(record);
	}

}
