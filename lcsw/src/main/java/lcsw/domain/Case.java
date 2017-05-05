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
	
	@TableField(value="case_title")
	private String caseTitle;
	
	@TableField(value="chief_complain")
	private String chiefComplain;
	
	@TableField(value="create_time")
	private Date createTime;
	
	@TableField(value="creater")
	private String creater;
	
	@TableField(value="case_type")
	private String caseType;
	
	@TableField(value="title_type")
	private String titleType;
	
	@TableField(value="phy_exam_count")
	private Integer phyEaxmCount;
	
	@TableField(value="fst_visit_count")
	private Integer fstVisitCount;
	
	@TableField(value="ary_exam_count")
	private Integer aryEaxmCount;
	
	@TableField(value="diagnose_count")
	private Integer diagnoseCount;
	
	@TableField(value="treatment_count")
	private Integer treatmentCount;
	
	@TableField(value="pat_man_count")
	private Integer patManCount;
	
	@TableField(value="inquiry_count")
	private Integer inquiryCount;

	@TableField(value="panswer_total")
	private Integer panswerTotal;
	
	@TableField(value="nanswer_total")
	private Integer nanswerTotal;
	
	@TableField(value="zanswer_total")
	private Integer zanswerTotal;
	
	@TableField(value="answer_total")
	private Integer answerTotal;
	
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

	public String getCaseType() {
		return caseType;
	}

	public void setCaseType(String caseType) {
		this.caseType = caseType;
	}

	public String getTitleType() {
		return titleType;
	}

	public void setTitleType(String titleType) {
		this.titleType = titleType;
	}
	
	public String getCaseTitle() {
		return caseTitle;
	}

	public void setCaseTitle(String caseTitle) {
		this.caseTitle = caseTitle;
	}

	public Integer getPhyEaxmCount() {
		return phyEaxmCount;
	}

	public void setPhyEaxmCount(Integer phyEaxmCount) {
		this.phyEaxmCount = phyEaxmCount;
	}

	public Integer getFstVisitCount() {
		return fstVisitCount;
	}

	public void setFstVisitCount(Integer fstVisitCount) {
		this.fstVisitCount = fstVisitCount;
	}

	public Integer getAryEaxmCount() {
		return aryEaxmCount;
	}

	public void setAryEaxmCount(Integer aryEaxmCount) {
		this.aryEaxmCount = aryEaxmCount;
	}

	public Integer getDiagnoseCount() {
		return diagnoseCount;
	}

	public void setDiagnoseCount(Integer diagnoseCount) {
		this.diagnoseCount = diagnoseCount;
	}

	public Integer getTreatmentCount() {
		return treatmentCount;
	}

	public void setTreatmentCount(Integer treatmentCount) {
		this.treatmentCount = treatmentCount;
	}

	public Integer getPatManCount() {
		return patManCount;
	}

	public void setPatManCount(Integer patManCount) {
		this.patManCount = patManCount;
	}

	public Integer getInquiryCount() {
		return inquiryCount;
	}

	public void setInquiryCount(Integer inquiryCount) {
		this.inquiryCount = inquiryCount;
	}
	
	public Integer getPanswerTotal() {
		return panswerTotal;
	}

	public void setPanswerTotal(Integer panswerTotal) {
		this.panswerTotal = panswerTotal;
	}

	public Integer getNanswerTotal() {
		return nanswerTotal;
	}

	public void setNanswerTotal(Integer nanswerTotal) {
		this.nanswerTotal = nanswerTotal;
	}

	public Integer getZanswerTotal() {
		return zanswerTotal;
	}

	public void setZanswerTotal(Integer zanswerTotal) {
		this.zanswerTotal = zanswerTotal;
	}

	public Integer getAnswerTotal() {
		return answerTotal;
	}

	public void setAnswerTotal(Integer answerTotal) {
		this.answerTotal = answerTotal;
	}

	@Override
	public String toString() {
		return "Case [caseId=" + caseId + ", caseTitle=" + caseTitle + ", chiefComplain=" + chiefComplain
				+ ", createTime=" + createTime + ", creater=" + creater + ", caseType=" + caseType + ", titleType="
				+ titleType + ", phyEaxmCount=" + phyEaxmCount + ", fstVisitCount=" + fstVisitCount + ", aryEaxmCount="
				+ aryEaxmCount + ", diagnoseCount=" + diagnoseCount + ", treatmentCount=" + treatmentCount
				+ ", patManCount=" + patManCount + ", inquiryCount=" + inquiryCount + ", panswerTotal=" + panswerTotal
				+ ", nanswerTotal=" + nanswerTotal + ", zanswerTotal=" + zanswerTotal + ", answerTotal=" + answerTotal
				+ "]";
	}

	
}
