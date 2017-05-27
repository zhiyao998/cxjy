package lcsw.domain;


import java.io.Serializable;
import java.sql.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName(value="tbl_paper")
public class Paper implements Serializable{
	
	private static final long serialVersionUID = 2L;
	
	@TableId(value="paper_id")
	private Integer paperId;
	
	@TableField(value="create_time")
	private Date createTime;
	
	@TableField(value="creater")
	private String creater;
	
	@TableField(value="case_list")
	private String caseList;

	public Integer getPaperId() {
		return paperId;
	}

	public void setPaperId(Integer paperId) {
		this.paperId = paperId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	public String getCaseList() {
		return caseList;
	}

	public void setCaseList(String caseList) {
		this.caseList = caseList;
	}

	@Override
	public String toString() {
		return "Paper [paperId=" + paperId + ", createTime=" + createTime + ", creater=" + creater + ", caseList="
				+ caseList + "]";
	}
	
	
}
