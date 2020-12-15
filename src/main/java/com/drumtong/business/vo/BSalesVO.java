package com.drumtong.business.vo;

public class BSalesVO {
	private String memberid;		// 고객 고유 ID
	private String estid;			// 매장 고유 ID
	private String salecode;		// 구매 코드
	private String purchasedate;	// 구매 일자
	private int totalamount;		// 총 개수
	private int originalprice;		// 원래 금액
	private int discountprice;		// 세일 금액
	private int totalprice;			// 총 금액
	private String ableday;			// 요청 일자
	private String status;			// 현재 상태	[REQUEST] 요청  , [PROCESSING] 처리중 , [SUCCESS] 완료
	private String pickupdate;		// 받은 날짜
	private String deliverydate;	// 배송 날짜
	private String requesttype;		// 요청 타입 	[DELIVERY] 배달, [VISIT] 매장방문
	private String requests;		// 요청 사항
	
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
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
	public String getPurchasedate() {
		return purchasedate;
	}
	public void setPurchasedate(String purchasedate) {
		this.purchasedate = purchasedate;
	}
	
	public int getOriginalprice() {
		return originalprice;
	}
	public void setOriginalprice(int originalprice) {
		this.originalprice = originalprice;
	}
	public int getDiscountprice() {
		return discountprice;
	}
	public void setDiscountprice(int discountprice) {
		this.discountprice = discountprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getAbleday() {
		return ableday;
	}
	public void setAbleday(String ableday) {
		this.ableday = ableday;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPickupdate() {
		return pickupdate;
	}
	public void setPickupdate(String pickupdate) {
		this.pickupdate = pickupdate;
	}
	public String getDeliverydate() {
		return deliverydate;
	}
	public void setDeliverydate(String deliverydate) {
		this.deliverydate = deliverydate;
	}
	public String getRequesttype() {
		return requesttype;
	}
	public void setRequesttype(String requesttype) {
		this.requesttype = requesttype;
	}
	public String getRequests() {
		return requests;
	}
	public void setRequests(String requests) {
		this.requests = requests;
	}
	public int getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
	}
	
	
	
}
