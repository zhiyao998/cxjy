package lcsw.domain;

public class Answer {
	private Integer answerId;
	private String info;
	private String analysis;
	private Integer score;
	
	
	public Integer getAnswerId() {
		return answerId;
	}
	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Answer [answerId=" + answerId +", info=" + info + ", analysis="
				+ analysis + ", score=" + score + "]";
	}
	
	
	
}
