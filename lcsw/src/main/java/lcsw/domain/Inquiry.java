package lcsw.domain;

public class Inquiry {
	
	private Integer inquiryId;
	private String inquiryTitle;
	private String patientAnswer;
	private Integer inquiryType;
	private Integer inquiryOrder;
	private Double score;
	
	public Integer getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(Integer inquiryId) {
		this.inquiryId = inquiryId;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getPatientAnswer() {
		return patientAnswer;
	}
	public void setPatientAnswer(String patientAnswer) {
		this.patientAnswer = patientAnswer;
	}
	public Integer getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(Integer inquiryType) {
		this.inquiryType = inquiryType;
	}
	public Integer getInquiryOrder() {
		return inquiryOrder;
	}
	public void setInquiryOrder(Integer inquiryOrder) {
		this.inquiryOrder = inquiryOrder;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Inquiry [inquiryId=" + inquiryId + ", inquiryTitle=" + inquiryTitle + ", patientAnswer=" + patientAnswer
				+ ", inquiryType=" + inquiryType + ", inquiryOrder=" + inquiryOrder + ", score=" + score + "]";
	}
	
}
