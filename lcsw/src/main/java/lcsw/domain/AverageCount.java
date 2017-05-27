package lcsw.domain;


public class AverageCount {
	private String caseType;
	private Integer average;
	public String getCaseType() {
		return caseType;
	}
	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}
	public Integer getAverage() {
		return average;
	}
	public void setAverage(Integer average) {
		this.average = average;
	}
	@Override
	public String toString() {
		return "AverageCount [caseType=" + caseType + ", average=" + average + "]";
	}
}
