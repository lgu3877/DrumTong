package com.drumtong.business.vo;

public class OrderList extends BSalesVO{
	private String estid;			// 매장 고유 아이디
	private String salecode;		// 구매 코드
	private int num;				//
	private String maincategory;	// 메인 카테고리 	 ex) 일반 의류
	private String subcategory;		// 서브 카테고리   ex) 상의
	private String name;			// 메뉴 이름        ex) T-shirt
	private int amount;				// 요구한 개수
	
	private String brandnaming; 	// BInformation 테이블의 매장명
	
	
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getBrandnaming() {
		return brandnaming;
	}
	public void setBrandnaming(String brandnaming) {
		this.brandnaming = brandnaming;
	}
	
	
	
}
