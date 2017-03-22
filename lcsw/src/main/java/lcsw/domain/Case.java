package lcsw.domain;

import java.sql.Date;
public class Case {
	
	private Integer caseId;
	private String caseTitle;
	private String patientInfo;
	private String chiefComplain;
	private Date createTime;
	private String creater;
	private String caseType;

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
