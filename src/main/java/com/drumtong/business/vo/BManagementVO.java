package com.drumtong.business.vo;

public class BManagementVO {
	private String estid;
	private String introduction;
	private char deliveryboolean;
	private char quickboolean;
	private int hits;
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
	public char getQuickboolean() {
		return quickboolean;
	}
	public void setQuickboolean(char quickboolean) {
		this.quickboolean = quickboolean;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
}
