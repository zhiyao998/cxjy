package lcsw.domain;

import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

public class CaseQuery {

	private Integer caseId;
	private String caseTitle;
	private String patientInfo;
	private String chiefComplain;
	private Date createTime;
	private String creater;
	private String caseType;
	private Set<Inquiry> inquirys = new HashSet<Inquiry>();
	private Set<PhysicalExam> physicalExams = new HashSet<PhysicalExam>();
	private FirstVisit firstVisit;
	private Set<AccessoryExam> accessoryExams = new HashSet<AccessoryExam>();
	private Diagnose diagnose;
	private Set<Treatment> treatments = new HashSet<Treatment>();
	private Set<PatientManagement> patientManagements = new HashSet<PatientManagement>();
	
	public Set<Inquiry> getInquirys() {
		return inquirys;
	}


	public void setInquirys(Set<Inquiry> inquirys) {
		this.inquirys = inquirys;
	}



	public Set<PhysicalExam> getPhysicalExams() {
		return physicalExams;
	}



	public void setPhysicalExams(Set<PhysicalExam> physicalExams) {
		this.physicalExams = physicalExams;
	}



	public FirstVisit getFirstVisit() {
		return firstVisit;
	}



	public void setFirstVisit(FirstVisit firstVisit) {
		this.firstVisit = firstVisit;
	}



	public Set<AccessoryExam> getAccessoryExams() {
		return accessoryExams;
	}



	public void setAccessoryExams(Set<AccessoryExam> accessoryExams) {
		this.accessoryExams = accessoryExams;
	}



	public Diagnose getDiagnose() {
		return diagnose;
	}



	public void setDiagnose(Diagnose diagnose) {
		this.diagnose = diagnose;
	}



	public Set<Treatment> getTreatments() {
		return treatments;
	}



	public void setTreatments(Set<Treatment> treatments) {
		this.treatments = treatments;
	}



	public Set<PatientManagement> getPatientManagements() {
		return patientManagements;
	}



	public void setPatientManagements(Set<PatientManagement> patientManagements) {
		this.patientManagements = patientManagements;
	}



	public Integer getCaseId() {
		return caseId;
	}



	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}



	public String getCaseTitle() {
		return caseTitle;
	}



	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}



	public String getPatientInfo() {
		return patientInfo;
	}



	public void setPatientInfo(String patientInfo) {
		this.patientInfo = patientInfo;
	}



	public String getChiefComplain() {
		return chiefComplain;
	}



	public void setChiefComplain(String chiefComplain) {
		this.chiefComplain = chiefComplain;
	}



	public Date getCreateTime() {
		return createTime;
	}



	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}



	public String getCreater() {
		return creater;
	}



	public void setCreater(String creater) {
		this.creater = creater;
	}



	public String getCaseType() {
		return caseType;
	}



	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}



	@Override
	public String toString() {
		return "Case [case_id=" + caseId + ", case_title=" + caseTitle + ", patientInfo=" + patientInfo
				+ ", chiefComplain=" + chiefComplain + ", createTime=" + createTime + ", creater=" + creater
				+ ", caseType=" + caseType + "]";
	}
	
}
