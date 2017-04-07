package lcsw.domain;

public class PhysicalExam {
	
	private Integer physicalExamId;
	private Integer caseId;
	private String physicalExamName;
	private String physicalExamPart;
	private String physicalExamResult;
	private String physicalExamType;
	private String physicalExamOrder;
	private Double score;
	
	
	public Integer getCaseId() {
		return caseId;
	}
	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}
	public Integer getPhysicalExamId() {
		return physicalExamId;
	}
	public void setPhysicalExamId(Integer physicalExamId) {
		this.physicalExamId = physicalExamId;
	}
	public String getPhysicalExamName() {
		return physicalExamName;
	}
	public void setPhysicalExamName(String physicalExamName) {
		this.physicalExamName = physicalExamName;
	}
	public String getPhysicalExamPart() {
		return physicalExamPart;
	}
	public void setPhysicalExamPart(String physicalExamPart) {
		this.physicalExamPart = physicalExamPart;
	}
	public String getPhysicalExamResult() {
		return physicalExamResult;
	}
	public void setPhysicalExamResult(String physicalExamResult) {
		this.physicalExamResult = physicalExamResult;
	}
	public String getPhysicalExamType() {
		return physicalExamType;
	}
	public void setPhysicalExamType(String physicalExamType) {
		this.physicalExamType = physicalExamType;
	}
	public String getPhysicalExamOrder() {
		return physicalExamOrder;
	}
	public void setPhysicalExamOrder(String physicalExamOrder) {
		this.physicalExamOrder = physicalExamOrder;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "PhysicalExam [physicalExamId=" + physicalExamId + ", caseId=" + caseId + ", physicalExamName="
				+ physicalExamName + ", physicalExamPart=" + physicalExamPart + ", physicalExamResult="
				+ physicalExamResult + ", physicalExamType=" + physicalExamType + ", physicalExamOrder="
				+ physicalExamOrder + ", score=" + score + "]";
	}
	
	
	
	
	
}
