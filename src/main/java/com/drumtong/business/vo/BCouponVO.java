package com.drumtong.business.vo;

public class BCouponVO {
	private String estid;
	private String couponid;
	private int issuenum;
	private int discount;
	private String period;
	private String minimumprice;
	private char duplboolean;
	private String registdate;
	private String updatedate;
	private char deleteboolean;
	private String deletedate;
	private int maxissuenum;
	
	public int getMaxissuenum() {
		return maxissuenum;
	}
	public void setMaxissuenum(int maxissuemnu) {
		this.maxissuenum = maxissuemnu;
	}
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getCouponid() {
		return couponid;
	}
	public void setCouponid(String couponid) {
		this.couponid = couponid;
	}
	public int getIssuenum() {
		return issuenum;
	}
	public void setIssuenum(int issuenum) {
		this.issuenum = issuenum;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getMinimumprice() {
		return minimumprice;
	}
	public void setMinimumprice(String minimumprice) {
		this.minimumprice = minimumprice;
	}
	public char getDuplboolean() {
		return duplboolean;
	}
	public void setDuplboolean(char duplboolean) {
		this.duplboolean = duplboolean;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public char getDeleteboolean() {
		return deleteboolean;
	}
	public void setDeleteboolean(char deleteboolean) {
		this.deleteboolean = deleteboolean;
	}
	public String getDeletedate() {
		return deletedate;
	}
	public void setDeletedate(String deletedate) {
		this.deletedate = deletedate;
	}
	
	
}
