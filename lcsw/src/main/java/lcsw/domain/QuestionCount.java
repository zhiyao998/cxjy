package lcsw.domain;

public class QuestionCount {
	
	private String ftheme;
	private String stheme;
	private String type;
	private Integer count;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "QuestionCountType [ftheme=" + ftheme + ", stheme=" + stheme + ", count=" + count + "]";
	}
}
