package lcsw.domain;

public class Treatment {
	
	private Integer treatmentId;
	private Integer caseId;
	private String treatmentType;
	private String treatmentPlan;
	private Double score;
	
	
	
	public Integer getCaseId() {
		return caseId;
	}
	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}
	public Integer getTreatmentId() {
		return treatmentId;
	}
	public void setTreatmentId(Integer treatmentId) {
		this.treatmentId = treatmentId;
	}
	public String getTreatmentType() {
		return treatmentType;
	}
	public void setTreatmentType(String treatmentType) {
		this.treatmentType = treatmentType;
	}
	public String getTreatmentPlan() {
		return treatmentPlan;
	}
	public void setTreatmentPlan(String treatmentPlan) {
		this.treatmentPlan = treatmentPlan;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Treatment [treatmentId=" + treatmentId + ", treatmentType=" + treatmentType + ", treatmentPlan="
				+ treatmentPlan + ", score=" + score + "]";
	}
}
