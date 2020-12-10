package com.drumtong.customer.vo;

// 고객 쿠폰 리스트에 필요한 정보를 모아놓은 클래스[영경]
public class CouponList {
	private String brandnaming;	// 가게 이름
	private int discount;		// 할인 가격
	private String period;		// 사용 기간
	private int minimumprice;	// 최소 금액
	private char duplboolean;	// 사용 여부
	
	public String getBrandnaming() {
		return brandnaming;
	}
	public void setBrandnaming(String brandnaming) {
		this.brandnaming = brandnaming;
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
	public int getMinimumprice() {
		return minimumprice;
	}
	public void setMinimumprice(int minimumprice) {
		this.minimumprice = minimumprice;
	}
	public char getDuplboolean() {
		return duplboolean;
	}
	public void setDuplboolean(char duplboolean) {
		this.duplboolean = duplboolean;
	}
	
}
