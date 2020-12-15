package com.drumtong.business.vo;

public class BDetailSalesVO {
	
	private String estid;			// 매장 고유 아이디
	private String salecode;		// 구매 코드
	private int num;				//
	private String maincategory;	// 메인 카테고리 	 ex) 일반 의류
	private String subcategory;		// 서브 카테고리   ex) 상의
	private String name;			// 메뉴 이름        ex) T-shirt
	private String amount;			// 요구한 개수
	
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getSalecode() {
		return salecode;
	}
	public void setSalecode(String salecode) {
		this.salecode = salecode;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMaincategory() {
		return maincategory;
	}
	public void setMaincategory(String maincategory) {
		this.maincategory = maincategory;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	
	
}
