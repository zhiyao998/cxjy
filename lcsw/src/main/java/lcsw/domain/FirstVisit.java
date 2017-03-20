package lcsw.domain;

public class FirstVisit {
	
	private Integer firstVisitId;
	private Integer caseId;
	private String fvResultA;
	private String fvResultB;
	private String fvResultC;
	private String fvResultD;
	private String fvResultE;
	private Double score;
	private String analysis;
	
	
	
	public Integer getCaseId() {
		return caseId;
	}
	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}
	public Integer getFirstVisitId() {
		return firstVisitId;
	}
	public void setFirstVisitId(Integer firstVisitId) {
		this.firstVisitId = firstVisitId;
	}
	public String getFvResultA() {
		return fvResultA;
	}
	public void setFvResultA(String fvResultA) {
		this.fvResultA = fvResultA;
	}
	public String getFvResultB() {
		return fvResultB;
	}
	public void setFvResultB(String fvResultB) {
		this.fvResultB = fvResultB;
	}
	public String getFvResultC() {
		return fvResultC;
	}
	public void setFvResultC(String fvResultC) {
		this.fvResultC = fvResultC;
	}
	public String getFvResultD() {
		return fvResultD;
	}
	public void setFvResultD(String fvResultD) {
		this.fvResultD = fvResultD;
	}
	public String getFvResultE() {
		return fvResultE;
	}
	public void setFvResultE(String fvResultE) {
		this.fvResultE = fvResultE;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}
	public String getAnalysis() {
		return analysis;
	}
	public void setAnalysis(String analysis) {
		this.analysis = analysis;
	}
	@Override
	public String toString() {
		return "FirstVisit [firstVisitId=" + firstVisitId + ", fvResultA=" + fvResultA + ", fvResultB=" + fvResultB
				+ ", fvResultC=" + fvResultC + ", fvResultD=" + fvResultD + ", fvResultE=" + fvResultE + ", score="
				+ score + ", analysis=" + analysis + "]";
	}
	
}
