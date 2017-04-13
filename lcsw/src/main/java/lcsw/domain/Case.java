package lcsw.domain;

import java.sql.Date;
public class Case {
	
	private Integer caseId;
	private String caseTitle;
	private String chiefComplain;
	private Date createTime;
	private String creater;
	private Integer caseType;
	private String caseStep;

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



	public Integer getCaseType() {
		return caseType;
	}



	public void setCaseType(Integer caseType) {
		this.caseType = caseType;
	}

	public String getCaseStep() {
		return caseStep;
	}



	public void setCaseStep(String caseStep) {
		this.caseStep = caseStep;
	}



	@Override
	public String toString() {
		return "Case [caseId=" + caseId + ", caseTitle=" + caseTitle + ", chiefComplain=" + chiefComplain
				+ ", createTime=" + createTime + ", creater=" + creater + ", caseType=" + caseType + ", caseStep="
				+ caseStep + "]";
	}



	
	
}
