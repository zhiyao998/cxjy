package lcsw.domain;

public class QuestionCount {
	
	private String caseType;
	private Integer inquiryCount;
	private Integer phyExamCount;
	private Integer fstVisitCount;
	private Integer aryExamCount;
	private Integer diagnoseCount;
	private Integer treatmentCount;
	private Integer patManCount;
	private Integer total;
	
	
	public String getCaseType() {
		return caseType;
	}
	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}
	public Integer getInquiryCount() {
		return inquiryCount;
	}
	public void setInquiryCount(Integer inquiryCount) {
		this.inquiryCount = inquiryCount;
	}
	public Integer getPhyExamCount() {
		return phyExamCount;
	}
	public void setPhyExamCount(Integer phyExamCount) {
		this.phyExamCount = phyExamCount;
	}
	public Integer getFstVisitCount() {
		return fstVisitCount;
	}
	public void setFstVisitCount(Integer fstVisitCount) {
		this.fstVisitCount = fstVisitCount;
	}
	public Integer getAryExamCount() {
		return aryExamCount;
	}
	public void setAryExamCount(Integer aryExamCount) {
		this.aryExamCount = aryExamCount;
	}
	public Integer getDiagnoseCount() {
		return diagnoseCount;
	}
	public void setDiagnoseCount(Integer diagnoseCount) {
		this.diagnoseCount = diagnoseCount;
	}
	public Integer getTreatmentCount() {
		return treatmentCount;
	}
	public void setTreatmentCount(Integer treatmentCount) {
		this.treatmentCount = treatmentCount;
	}
	public Integer getPatManCount() {
		return patManCount;
	}
	public void setPatManCount(Integer patManCount) {
		this.patManCount = patManCount;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "QuestionCount [caseType=" + caseType + ", inquiryCount=" + inquiryCount + ", phyExamCount="
				+ phyExamCount + ", fstVisitCount=" + fstVisitCount + ", aryExamCount=" + aryExamCount
				+ ", diagnoseCount=" + diagnoseCount + ", treatmentCount=" + treatmentCount + ", patManCount="
				+ patManCount + ", total=" + total + ", getCaseType()=" + getCaseType() + ", getInquiryCount()="
				+ getInquiryCount() + ", getPhyExamCount()=" + getPhyExamCount() + ", getFstVisitCount()="
				+ getFstVisitCount() + ", getAryExamCount()=" + getAryExamCount() + ", getDiagnoseCount()="
				+ getDiagnoseCount() + ", getTreatmentCount()=" + getTreatmentCount() + ", getPatManCount()="
				+ getPatManCount() + ", getTotal()=" + getTotal() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
}
