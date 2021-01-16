package com.drumtong.business.vo;

public class BManagementVO {
	private String estid;
	private String introduction;
	private char deliveryboolean;
	private int hits;
	private String defaultcategory;
	
	public String getDefaultcategory() {
		return defaultcategory;
	}
	public void setDefaultcategory(String defaultcategory) {
		this.defaultcategory = defaultcategory;
	}
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public char getDeliveryboolean() {
		return deliveryboolean;
	}
	public void setDeliveryboolean(char deliveryboolean) {
		this.deliveryboolean = deliveryboolean;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
}
