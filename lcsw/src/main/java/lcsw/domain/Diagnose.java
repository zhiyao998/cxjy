package lcsw.domain;

public class Diagnose {
	
	private Integer diagnoseId;
	private String diagnoseResultA;
	private String diagnoseResultB;
	private String diagnoseResultC;
	private String diagnoseResultD;
	private String diagnoseResultE;
	private String diagnoseAnswer;
	private Double score;
	
	public Integer getDiagnoseId() {
		return diagnoseId;
	}
	public void setDiagnoseId(Integer diagnoseId) {
		this.diagnoseId = diagnoseId;
	}
	public String getDiagnoseResultA() {
		return diagnoseResultA;
	}
	public void setDiagnoseResultA(String diagnoseResultA) {
		this.diagnoseResultA = diagnoseResultA;
	}
	public String getDiagnoseResultB() {
		return diagnoseResultB;
	}
	public void setDiagnoseResultB(String diagnoseResultB) {
		this.diagnoseResultB = diagnoseResultB;
	}
	public String getDiagnoseResultC() {
		return diagnoseResultC;
	}
	public void setDiagnoseResultC(String diagnoseResultC) {
		this.diagnoseResultC = diagnoseResultC;
	}
	public String getDiagnoseResultD() {
		return diagnoseResultD;
	}
	public void setDiagnoseResultD(String diagnoseResultD) {
		this.diagnoseResultD = diagnoseResultD;
	}
	public String getDiagnoseResultE() {
		return diagnoseResultE;
	}
	public void setDiagnoseResultE(String diagnoseResultE) {
		this.diagnoseResultE = diagnoseResultE;
	}
	public String getDiagnoseAnswer() {
		return diagnoseAnswer;
	}
	public void setDiagnoseAnswer(String diagnoseAnswer) {
		this.diagnoseAnswer = diagnoseAnswer;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "Diagnose [diagnoseId=" + diagnoseId + ", diagnoseResultA=" + diagnoseResultA + ", diagnoseResultB="
				+ diagnoseResultB + ", diagnoseResultC=" + diagnoseResultC + ", diagnoseResultD=" + diagnoseResultD
				+ ", diagnoseResultE=" + diagnoseResultE + ", diagnoseAnswer=" + diagnoseAnswer + ", score=" + score
				+ "]";
	} 
	
	
}
