package lcsw.domain;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName(value="tbl_answer")
public class Answer implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@TableId(value="answer_id")
	private Integer answerId;
	
	@TableField(value="answer_info")
	private String info;
	
	@TableField(value="answer_analysis")
	private String analysis;
	
	@TableField(value="score")
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
