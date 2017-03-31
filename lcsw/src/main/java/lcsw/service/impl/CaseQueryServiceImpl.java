package lcsw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lcsw.domain.AccessoryExam;
import lcsw.domain.Case;
import lcsw.domain.CaseQuery;
import lcsw.domain.Diagnose;
import lcsw.domain.FirstVisit;
import lcsw.domain.Inquiry;
import lcsw.domain.PatientManagement;
import lcsw.domain.PhysicalExam;
import lcsw.domain.Treatment;
import lcsw.mapper.AccessoryExamMapper;
import lcsw.mapper.CaseMapper;
import lcsw.mapper.DiagnoseMapper;
import lcsw.mapper.FirstVisitMapper;
import lcsw.mapper.InquiryMapper;
import lcsw.mapper.PatientManagementMapper;
import lcsw.mapper.PhysicalExamMapper;
import lcsw.mapper.TreatmentMapper;
import lcsw.service.CaseQueryService;

@Service
public class CaseQueryServiceImpl implements CaseQueryService {
	
	@Resource
	private CaseMapper caseMapper;
	@Resource
	private AccessoryExamMapper accessoryExamMapper;
	@Resource
	private DiagnoseMapper diagnoseMapper;
	@Resource
	private FirstVisitMapper firstVisitMapper;
	@Resource
	private InquiryMapper InquiryMapper;
	@Resource
	private PatientManagementMapper patientManagementMapper;
	@Resource
	private PhysicalExamMapper physicalExamMapper;
	@Resource
	private TreatmentMapper treatmentMapper;

	@Override
	@Transactional
	public CaseQuery selectByPrimaryKey(Integer id) {
		CaseQuery caseQuery = new CaseQuery();
		caseQuery.setNewCase(caseMapper.selectByPrimaryKey(id));
		caseQuery.setInquirys(InquiryMapper.selectByCaseId(id));
		caseQuery.setPhysicalExams(physicalExamMapper.selectByCaseId(id));
		caseQuery.setFirstVisit(firstVisitMapper.selectByCaseId(id));
		caseQuery.setAccessoryExams(accessoryExamMapper.selectByCaseId(id));
		caseQuery.setDiagnose(diagnoseMapper.selectByCaseId(id));
		caseQuery.setTreatments(treatmentMapper.selectByCaseId(id));
		caseQuery.setPatientManagements(patientManagementMapper.selectByCaseId(id));
		return caseQuery;
	}

	@Override
	public List<CaseQuery> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByPrimaryKey(CaseQuery record) {
		return 0;
	}

	@Override
	@Transactional
	public int insert(CaseQuery record) {
		
		Case c = record.getNewCase();
		int flag = caseMapper.insert(c);
		Integer caseId = c.getCaseId();
		
		
		List<AccessoryExam> accessoryExam = record.getAccessoryExams();
		for(AccessoryExam a : accessoryExam){
			a.setCaseId(caseId);
		}
		flag *= accessoryExamMapper.insertByBatch(accessoryExam);
		
		Diagnose d = record.getDiagnose();
		d.setCaseId(caseId);
		flag *= diagnoseMapper.insert(d);
		
		FirstVisit f = record.getFirstVisit();
		f.setCaseId(caseId);
		flag *= firstVisitMapper.insert(f);
		
		List<Inquiry> inquiries = record.getInquirys();
		for(Inquiry a : inquiries){
			a.setCaseId(caseId);
		}
		flag *= InquiryMapper.insertByBatch(inquiries);
		
		List<PatientManagement> managements = record.getPatientManagements();
		for(PatientManagement a : managements){
			a.setCaseId(caseId);
		}
		flag *= patientManagementMapper.insertByBatch(managements);
		
		List<PhysicalExam> physicalExams = record.getPhysicalExams();
		for(PhysicalExam a : physicalExams){
			a.setCaseId(caseId);
		}
		flag *= physicalExamMapper.insertByBatch(physicalExams);
		
		List<Treatment> treatments = record.getTreatments();
		for(Treatment a : treatments){
			a.setCaseId(caseId);
		}
		flag *= treatmentMapper.insertByBatch(treatments);
		
		return flag;
	}

	@Override
	@Transactional
	public int deleteByPrimaryKey(List<Integer> ids) {
		int flag;
		flag = caseMapper.deleteByPrimaryKey(ids);
		flag *= accessoryExamMapper.deleteByCaseId(ids);
		flag *= diagnoseMapper.deleteByCaseId(ids);
		flag *= firstVisitMapper.deleteByCaseId(ids);
		flag *= InquiryMapper.deleteByCaseId(ids);
		flag *= patientManagementMapper.deleteByCaseId(ids);
		flag *= treatmentMapper.deleteByCaseId(ids);
		flag *= physicalExamMapper.deleteByCaseId(ids);
		return flag;
	}

}
