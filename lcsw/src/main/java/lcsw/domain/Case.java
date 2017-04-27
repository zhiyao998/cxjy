package lcsw.domain;

import java.io.Serializable;
import java.sql.Date;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;

@TableName(value="tbl_case")
public class Case implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@TableId(value="case_id")
	private Integer caseId;
	
	@TableField(value="chief_complain")
	private String chiefComplain;
	
	@TableField(value="create_time")
	private Date createTime;
	
	@TableField(value="creater")
	private String creater;
	
	@TableField(value="case_type")
	private Integer caseType;
	
	@TableField(value="title_type")
	private String titleType;

	public Integer getCaseId() {
		return caseId;
	}

	public void setCaseId(Integer caseId) {
		this.caseId = caseId;
	}

	public String getChiefComplain() {
		return chiefComplain;
	}

	public void setChiefComplain(String chiefComplain) {
		this.chiefComplain = chiefComplain;
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

	public Integer getCaseType() {
		return caseType;
	}

	public void setCaseType(Integer caseType) {
		this.caseType = caseType;
	}

	public String getTitleType() {
		return titleType;
	}

	public void setTitleType(String titleType) {
		this.titleType = titleType;
	}

	@Override
	public String toString() {
		return "Case [caseId=" + caseId + ", chiefComplain=" + chiefComplain + ", createTime=" + createTime
				+ ", creater=" + creater + ", caseType=" + caseType + ", titleType=" + titleType + "]";
	}
	
}
