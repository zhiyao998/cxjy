package lcsw.domain;

public class QuestionType {
	
	private String ftheme;
	private String stheme;
	private String titleType;
	private int count;
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
	public String getTitleType() {
		return titleType;
	}
	public void setTitleType(String titleType) {
		this.titleType = titleType;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "QuestionType [ftheme=" + ftheme + ", stheme=" + stheme + ", titleType=" + titleType + ", count=" + count
				+ "]";
	}
	
	
}
