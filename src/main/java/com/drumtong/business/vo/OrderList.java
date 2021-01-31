package com.drumtong.business.vo;

import java.util.HashMap;
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
//	private String ableday;			// 완료예정 일자 (사장->고객)
//	private String status;			// 현재 상태	[REQUEST] 요청  , [PROCESSING] 처리중 , [SUCCESS] 완료
//	private String pickupdate;		// 받은 날짜
//	private String deliverydate;	// 배송 날짜
//	private String requesttype;		// 요청 타입 	[DELIVERY] 배달, [VISIT] 매장방문
//	private String requests;		// 요청 사항
	
	private String brandnaming; 	// BInformation 테이블의 매장명
	private HashMap<String, HashMap<String,List<BDetailSalesVO>>> maincategory;
		
	// 영경 추가 // 리뷰를 썼는지 안썼는지 체크하는 부분
	private String reviewCheck;
	
	
	public String getBrandnaming() {
		return brandnaming;
	}
	public void setBrandnaming(String brandnaming) {
		this.brandnaming = brandnaming;
	}
	
	public HashMap<String, HashMap<String, List<BDetailSalesVO>>> getMaincategory() {
		return maincategory;
	}
	public void setMaincategory(HashMap<String, HashMap<String, List<BDetailSalesVO>>> maincategory) {
		this.maincategory = maincategory;
	}
	
}
