package lcsw.domain;

public class QuestionCount {
	
	private String ftheme;
	private String type;
	private Integer count;
	public String getFtheme() {
		return ftheme;
	}
	public void setFtheme(String ftheme) {
		this.ftheme = ftheme;
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
		return "QuestionCountType [ftheme=" + ftheme +", count=" + count + "]";
	}
}
