package com.drumtong.business.vo;

//[ 건욱 ] 
public class BMenuUpdateVO extends BMenuVO{
	// 바꾸어지는 새로운 데이터
	private String previousmaincategory;
	private String previoussubcategory;
	private String previousname;
	
	public String getPreviousmaincategory() {
		return previousmaincategory;
	}
	public void setPreviousmaincategory(String previousmaincategory) {
		this.previousmaincategory = previousmaincategory;
	}
	public String getPrevioussubcategory() {
		return previoussubcategory;
	}
	public void setPrevioussubcategory(String previoussubcategory) {
		this.previoussubcategory = previoussubcategory;
	}
	public String getPreviousname() {
		return previousname;
	}
	public void setPreviousname(String previousname) {
		this.previousname = previousname;
	}
	
	
	
	
}
