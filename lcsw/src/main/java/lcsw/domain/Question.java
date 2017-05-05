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
	
	@TableField(value="answers")
	private String answers;
	
	@TableField(value="pscore_count")
	private Integer pscoreCount;
	
	@TableField(value="pscore_total")
	private Integer pscoreTotal;
	
	@TableField(value="nscore_count")
	private Integer nscoreCount;
	
	@TableField(value="nscore_total")
	private Integer nscoreTotal;
	
	@TableField(value="zscore_count")
	private Integer zscoreCount;
	
	@TableField(value="answers_total")
	private Integer answersTotal;
	
	
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


	public String getAnswers() {
		return answers;
	}


	public void setAnswers(String answers) {
		this.answers = answers;
	}


	public Integer getPscoreCount() {
		return pscoreCount;
	}


	public void setPscoreCount(Integer pscoreCount) {
		this.pscoreCount = pscoreCount;
	}


	public Integer getPscoreTotal() {
		return pscoreTotal;
	}


	public void setPscoreTotal(Integer pscoreTotal) {
		this.pscoreTotal = pscoreTotal;
	}


	public Integer getNscoreCount() {
		return nscoreCount;
	}


	public void setNscoreCount(Integer nscoreCount) {
		this.nscoreCount = nscoreCount;
	}


	public Integer getNscoreTotal() {
		return nscoreTotal;
	}


	public void setNscoreTotal(Integer nscoreTotal) {
		this.nscoreTotal = nscoreTotal;
	}

	public Integer getZscoreCount() {
		return zscoreCount;
	}


	public void setZscoreCount(Integer zscoreCount) {
		this.zscoreCount = zscoreCount;
	}


	public Integer getAnswersTotal() {
		return answersTotal;
	}


	public void setAnswersTotal(Integer answersTotal) {
		this.answersTotal = answersTotal;
	}


	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", caseId=" + caseId + ", title=" + title + ", ftheme=" + ftheme
				+ ", answers=" + answers + ", pscoreCount=" + pscoreCount + ", pscoreTotal=" + pscoreTotal
				+ ", nscoreCount=" + nscoreCount + ", nscoreTotal=" + nscoreTotal + ", zscoreCount=" + zscoreCount
				+ ", answersTotal=" + answersTotal + "]";
	}

	
	
	
	
}
