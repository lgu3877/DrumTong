package com.drumtong.customer.vo;

public class CPaymentVO {
	private String memberid;
	private String accountbank;
	private String accountnum;
	private String card;
	private String cardbank;
	private int point;
	
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getAccountbank() {
		return accountbank;
	}
	public void setAccountbank(String accountbank) {
		this.accountbank = accountbank;
	}
	public String getCardbank() {
		return cardbank;
	}
	public void setCardbank(String cardbank) {
		this.cardbank = cardbank;
	}
	
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
	public String getAccountnum() {
		return accountnum;
	}
	public void setAccountnum(String accountnum) {
		this.accountnum = accountnum;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	
	
}
