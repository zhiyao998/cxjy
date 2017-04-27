package lcsw.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName(value="tbl_question")
public class Question implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@TableId(value="question_id")
	private Integer questionId;
	
	@TableField(value="case_id")
	private Integer caseId;
	
	@TableField(value="title")
	private String title;
	
	@TableField(value="ftheme")
	private String ftheme;
	
	@TableField(value="stheme")
	private String stheme;
	
	@TableField(value="answers")
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
