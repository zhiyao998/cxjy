package lcsw.service.impl;

import java.util.ArrayList;
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
		Case newCase = caseQuery.getNewCase();
		String caseStep = newCase.getCaseStep();
		if(caseStep.contains("1")){
			caseQuery.setInquirys(InquiryMapper.selectByCaseId(id));
		}
		if(caseStep.contains("2")){
			caseQuery.setPhysicalExams(physicalExamMapper.selectByCaseId(id));
		}
		if(caseStep.contains("3")){
			caseQuery.setFirstVisit(firstVisitMapper.selectByCaseId(id));
		}
		if(caseStep.contains("4")){
			caseQuery.setAccessoryExams(accessoryExamMapper.selectByCaseId(id));
		}
		if(caseStep.contains("5")){
			caseQuery.setDiagnose(diagnoseMapper.selectByCaseId(id));
		}
		if(caseStep.contains("6")){
			caseQuery.setTreatments(treatmentMapper.selectByCaseId(id));
		}
		if(caseStep.contains("7")){
			caseQuery.setPatientManagements(patientManagementMapper.selectByCaseId(id));
		}	
		return caseQuery;
	}

	@Override
	public List<CaseQuery> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional
	public int updateByPrimaryKey(CaseQuery record) {
		
		Case c = record.getNewCase();
		Integer caseId = c.getCaseId();
		int flag = caseMapper.updateByPrimaryKey(c);
		
		
		List<AccessoryExam> accessoryExam = record.getAccessoryExams();
		if(!accessoryExam.isEmpty()){
			List<AccessoryExam> insertAccessoryExamList = new ArrayList<AccessoryExam>();
			List<AccessoryExam> updateAccessoryExamList = new ArrayList<AccessoryExam>();
			for(AccessoryExam a : accessoryExam){
				a.setCaseId(caseId);
				if(a.getAccessoryExamId() != null){
					updateAccessoryExamList.add(a);
				}else{
					insertAccessoryExamList.add(a);
				}
			}
			if(!insertAccessoryExamList.isEmpty())
				flag *= accessoryExamMapper.insertByBatch(insertAccessoryExamList);
			if(!updateAccessoryExamList.isEmpty())
				flag *= accessoryExamMapper.updateByBatch(updateAccessoryExamList);
		}
		
		Diagnose d = record.getDiagnose();
		if(d != null){
			d.setCaseId(caseId);
			if(d.getDiagnoseId() == null){
				flag *= diagnoseMapper.insert(d);
			}else{
				flag *= diagnoseMapper.updateByPrimaryKey(d);
			}
		}
		
		FirstVisit f = record.getFirstVisit();
		if(f != null){
			f.setCaseId(caseId);
			if(f.getFirstVisitId() == null){
				flag *= firstVisitMapper.insert(f);
			}else{
				flag *= firstVisitMapper.updateByPrimaryKey(f);
			}
		}

		List<Inquiry> inquiries = record.getInquirys();
		if(!inquiries.isEmpty()){
			List<Inquiry> insertInquiryList = new ArrayList<Inquiry>();
			List<Inquiry> updateInquiryList = new ArrayList<Inquiry>();
			for(Inquiry a : inquiries){
				a.setCaseId(caseId);
				if(a.getInquiryId() != null){
					updateInquiryList.add(a);
				}else{
					insertInquiryList.add(a);
				}
			}		
			if(!insertInquiryList.isEmpty())
				flag *= InquiryMapper.insertByBatch(insertInquiryList);
			if(!updateInquiryList.isEmpty())
				flag *= InquiryMapper.updateByBatch(updateInquiryList);
		}

		List<PatientManagement> managements = record.getPatientManagements();
		if(!managements.isEmpty()){
			List<PatientManagement> insertPatientManagementList = new ArrayList<PatientManagement>();
			List<PatientManagement> updatePatientManagementList = new ArrayList<PatientManagement>();
			for(PatientManagement a : managements){
				a.setCaseId(caseId);
				if(a.getPatientManagementId() != null){
					updatePatientManagementList.add(a);
				}else{
					insertPatientManagementList.add(a);
				}
			}
			if(!insertPatientManagementList.isEmpty())
			flag *= patientManagementMapper.insertByBatch(insertPatientManagementList);
			if(!updatePatientManagementList.isEmpty())
				flag *= patientManagementMapper.updateByBatch(updatePatientManagementList);
		}
	
		List<PhysicalExam> physicalExams = record.getPhysicalExams();
		if(!physicalExams.isEmpty()){
			List<PhysicalExam> insertPhysicalExamList = new ArrayList<PhysicalExam>();
			List<PhysicalExam> updatePhysicalExamList = new ArrayList<PhysicalExam>();
			for(PhysicalExam a : physicalExams){
				if(a.getPhysicalExamId() != null){
					a.setCaseId(caseId);
					updatePhysicalExamList.add(a);
				}else{
					insertPhysicalExamList.add(a);
				}
			}
			if(!insertPhysicalExamList.isEmpty())
				flag *= physicalExamMapper.insertByBatch(insertPhysicalExamList);
			if(!updatePhysicalExamList.isEmpty())
				flag *= physicalExamMapper.updateByBatch(updatePhysicalExamList);
		}
		
		List<Treatment> treatments = record.getTreatments();
		if(!treatments.isEmpty()){
			List<Treatment> insertTreatmentList = new ArrayList<Treatment>();
			List<Treatment> updateTreatmentList = new ArrayList<Treatment>();
			for(Treatment a : treatments){
				a.setCaseId(caseId);
				if(a.getTreatmentId() != null){
					updateTreatmentList.add(a);
				}else{
					insertTreatmentList.add(a);
				}
			}
			if(!insertTreatmentList.isEmpty())  
				flag *= treatmentMapper.insertByBatch(insertTreatmentList);
			if(!updateTreatmentList.isEmpty())
				flag *= treatmentMapper.updateByBatch(updateTreatmentList);
		}
		return flag;
	}

	@Override
	@Transactional
	public int insert(CaseQuery record) {
		
		Case c = record.getNewCase();
		int flag = caseMapper.insert(c);
		Integer caseId = c.getCaseId();
		
		
		List<AccessoryExam> accessoryExam = record.getAccessoryExams();
		if(!accessoryExam.isEmpty()){
			for(AccessoryExam a : accessoryExam){
				a.setCaseId(caseId);
			}
			flag *= accessoryExamMapper.insertByBatch(accessoryExam);
		}
		
		Diagnose d = record.getDiagnose();
		if(d != null){
			d.setCaseId(caseId);
			flag *= diagnoseMapper.insert(d);
		}
		
		FirstVisit f = record.getFirstVisit();
		if(f != null){
			f.setCaseId(caseId);
			flag *= firstVisitMapper.insert(f);
		}
		
		List<Inquiry> inquiries = record.getInquirys();
		if(!inquiries.isEmpty()){
			for(Inquiry a : inquiries){
				a.setCaseId(caseId);
			}
			flag *= InquiryMapper.insertByBatch(inquiries);
		}
		
		List<PatientManagement> managements = record.getPatientManagements();
		if(!managements.isEmpty()){
			for(PatientManagement a : managements){
				a.setCaseId(caseId);
			}
			flag *= patientManagementMapper.insertByBatch(managements);
		}
		
		List<PhysicalExam> physicalExams = record.getPhysicalExams();
		if(!physicalExams.isEmpty()){
			for(PhysicalExam a : physicalExams){
				a.setCaseId(caseId);
			}
			flag *= physicalExamMapper.insertByBatch(physicalExams);
		}
		
		List<Treatment> treatments = record.getTreatments();
		if(!treatments.isEmpty()){
			for(Treatment a : treatments){
				a.setCaseId(caseId);
			}
			flag *= treatmentMapper.insertByBatch(treatments);
		}
		
		return flag;
	}

	@Override
	@Transactional
	public int deleteByPrimaryKey(List<Integer> ids) {
		int flag;
		flag = caseMapper.deleteByPrimaryKey(ids);
		accessoryExamMapper.deleteByCaseId(ids);
		diagnoseMapper.deleteByCaseId(ids);
		firstVisitMapper.deleteByCaseId(ids);
		InquiryMapper.deleteByCaseId(ids);
		patientManagementMapper.deleteByCaseId(ids);
		treatmentMapper.deleteByCaseId(ids);
		physicalExamMapper.deleteByCaseId(ids);
		return flag;
	}

}
