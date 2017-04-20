package lcsw.domain;

public class Question {
	private Integer questionId;
	private Integer caseId;
	private String title;
	private String ftheme;
	private String stheme;
	private String answers;
	
	
	public Integer getQuestionId() {
		return questionId;
	}


	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}


	public Integer getCaseId() {
		return caseId;
	}


	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getFtheme() {
		return ftheme;
	}


	public void setFtheme(String ftheme) {
		this.ftheme = ftheme;
	}


	public String getStheme() {
		return stheme;
	}


	public void setStheme(String stheme) {
		this.stheme = stheme;
	}


	public String getAnswers() {
		return answers;
	}


	public void setAnswers(String answers) {
		this.answers = answers;
	}


	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", caseId=" + caseId + ", title=" + title + ", ftheme=" + ftheme
				+ ", stheme=" + stheme + ", answers=" + answers + "]";
	}
	
	
	
}
