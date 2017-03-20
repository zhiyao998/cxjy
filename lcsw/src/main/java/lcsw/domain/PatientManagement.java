package lcsw.domain;

public class PatientManagement {
	
	private Integer patientManagementId;
	private Integer caseId;
	private String managementPlan;
	private String score;
	
	
	
	public Integer getCaseId() {
		return caseId;
	}
	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}
	public Integer getPatientManagementId() {
		return patientManagementId;
	}
	public void setPatientManagementId(Integer patientManagementId) {
		this.patientManagementId = patientManagementId;
	}
	public String getManagementPlan() {
		return managementPlan;
	}
	public void setManagementPlan(String managementPlan) {
		this.managementPlan = managementPlan;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "PatientManagement [patientManagementId=" + patientManagementId + ", managementPlan=" + managementPlan
				+ ", score=" + score + "]";
	}
}
