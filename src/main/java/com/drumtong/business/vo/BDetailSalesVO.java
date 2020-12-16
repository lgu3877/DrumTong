package com.drumtong.business.vo;

public class BDetailSalesVO {
	
	private String estid;			// 매장 고유 아이디			  [PK]
	private String salecode;		// 구매 코드		 	  	  [PK]
	private String maincategory;	// 메인 카테고리 	 ex) 일반 의류	  [PK]
	private String subcategory;		// 서브 카테고리   ex) 상의		  [PK]
	private String name;			// 메뉴 이름        ex) T-shirt	  [PK]
	private String amount;			// 요구한 개수
	private int menuprice;			// 메뉴 가격
	private int sumprice;			// 합계 가격
	
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
	public int getMenuprice() {
		return menuprice;
	}
	public void setMenuprice(int menuprice) {
		this.menuprice = menuprice;
	}
	public int getSumprice() {
		return sumprice;
	}
	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}
	
	
}
