package com.drumtong.business.vo;

public class ReviewList extends BReviewVO{
//	private String memberid;
//	private String estid;
//	private String salecode;
//	private int gpa;
//	private int mgood;
//	private int reportcount;
//	private char secreatbolean;
//	private char deleteboolean;
//	private String deletedate;
//	private String reviewimg;
//	private char replyboolean;
//	private char blockboolean;
	private String ccontent;	// 고객 리뷰
	private String cregistdate;	// 고객 리뷰 생성 날짜
	private String bcontent;	// 사업자 답글
	private String bregistdate;	// 사업자 답글 날짜
	private String customerName;	// 고객 이름
	public String getCcontent() {
		return ccontent;
	}
	public String getCregistdate() {
		return cregistdate;
	}
	public void setCregistdate(String cregistdate) {
		this.cregistdate = cregistdate;
	}
	public String getBregistdate() {
		return bregistdate;
	}
	public void setBregistdate(String bregistdate) {
		this.bregistdate = bregistdate;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
}
