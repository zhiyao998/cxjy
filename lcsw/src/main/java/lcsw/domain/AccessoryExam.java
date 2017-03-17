package lcsw.domain;

public class AccessoryExam {
	
	private Integer accessoryExamId;
	private String accessoryExamName;
	private String accessoryExamResult;
	private String accessoryExamType;
	private Integer accessoryExamOrder;
	private Double score;
	public Integer getAccessoryExamId() {
		return accessoryExamId;
	}
	public void setAccessoryExamId(Integer accessoryExamId) {
		this.accessoryExamId = accessoryExamId;
	}
	public String getAccessoryExamName() {
		return accessoryExamName;
	}
	public void setAccessoryExamName(String accessoryExamName) {
		this.accessoryExamName = accessoryExamName;
	}
	public String getAccessoryExamResult() {
		return accessoryExamResult;
	}
	public void setAccessoryExamResult(String accessoryExamResult) {
		this.accessoryExamResult = accessoryExamResult;
	}
	public String getAccessoryExamType() {
		return accessoryExamType;
	}
	public void setAccessoryExamType(String accessoryExamType) {
		this.accessoryExamType = accessoryExamType;
	}
	public Integer getAccessoryExamOrder() {
		return accessoryExamOrder;
	}
	public void setAccessoryExamOrder(Integer accessoryExamOrder) {
		this.accessoryExamOrder = accessoryExamOrder;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "AccessoryExam [accessoryExamId=" + accessoryExamId + ", accessoryExamName=" + accessoryExamName
				+ ", accessoryExamResult=" + accessoryExamResult + ", accessoryExamType=" + accessoryExamType
				+ ", accessoryExamOrder=" + accessoryExamOrder + ", score=" + score + "]";
	}
	
}
