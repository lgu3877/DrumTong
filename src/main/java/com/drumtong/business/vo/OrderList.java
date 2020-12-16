package com.drumtong.business.vo;

import java.util.List;

public class OrderList extends BSalesVO{
//  @상속받은 BSalesVO의 부모 클래스 변수
//	private String memberid;		// 고객 고유 ID
//	private String estid;			// 매장 고유 ID
//	private String salecode;		// 구매 코드
//	private String purchasedate;	// 구매 일자
//	private int totalamount;		// 총 개수
//	private int originalprice;		// 원래 금액
//	private int discountprice;		// 세일 금액
//	private int totalprice;			// 총 금액
//	private String ableday;			// 요청 일자
//	private String status;			// 현재 상태	[REQUEST] 요청  , [PROCESSING] 처리중 , [SUCCESS] 완료
//	private String pickupdate;		// 받은 날짜
//	private String deliverydate;	// 배송 날짜
//	private String requesttype;		// 요청 타입 	[DELIVERY] 배달, [VISIT] 매장방문
//	private String requests;		// 요청 사항


	private String maincategory;	// 메인 카테고리 	 ex) 일반 의류
	private String subcategory;		// 서브 카테고리   ex) 상의
	private String name;			// 메뉴 이름        ex) T-shirt
	private int amount;				// 요구한 개수
	private int menuprice;			// 메뉴 가격 
	private int sumprice;			// 합계 가격
	
	private String brandnaming; 	// BInformation 테이블의 매장명
	
	private List<BDetailSalesVO> bDetailSalesVOList;
	
	
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
	public List<BDetailSalesVO> getbDetailSalesVOList() {
		return bDetailSalesVOList;
	}
	public void setbDetailSalesVOList(List<BDetailSalesVO> bDetailSalesVOList) {
		this.bDetailSalesVOList = bDetailSalesVOList;
	}
	
	
	
}
