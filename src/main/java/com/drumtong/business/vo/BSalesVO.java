package com.drumtong.business.vo;

public class BSalesVO {
	private String memberid;			// 고객 고유 ID
	private String estid;				// 매장 고유 ID
	private String salecode;			// 구매 코드
	private String purchasedate;		// 구매 일자
	private int totalamount;			// 총 개수
	private int originalprice;			// 원래 금액
	private int discountprice;			// 세일 금액
	private int totalprice;				// 총 금액
	private String status;				// 현재 상태	[REQUEST] 요청  , [PROCESSING] 처리중 , [SUCCESS] 완료
	private String deliverydate;		// 배송 날짜
	private String collectiondate;		// 수거 날짜
	private String laundrystatus;		// 현재 세탁물 위치('COLLECTING','WASHING','SENDING')
	private String collectionboolean;	// 수거 요청 타입('VISIT', 'COLLECTION')
	private String deliveryboolean;		// 배달 요청 타입('VISIT','DELIVERY')
	private String collectionrequests;	// 수거 요청 사항
	private String laundryrequests;		// 세탁 요청 사항
	private String deliveryrequests;	// 배송 요청 사항
	
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
	public int getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDeliverydate() {
		return deliverydate;
	}
	public void setDeliverydate(String deliverydate) {
		this.deliverydate = deliverydate;
	}
	public String getCollectiondate() {
		return collectiondate;
	}
	public void setCollectiondate(String collectiondate) {
		this.collectiondate = collectiondate;
	}
	public String getLaundrystatus() {
		return laundrystatus;
	}
	public void setLaundrystatus(String laundrystatus) {
		this.laundrystatus = laundrystatus;
	}
	public String getCollectionboolean() {
		return collectionboolean;
	}
	public void setCollectionboolean(String collectionboolean) {
		this.collectionboolean = collectionboolean;
	}
	public String getDeliveryboolean() {
		return deliveryboolean;
	}
	public void setDeliveryboolean(String deliveryboolean) {
		this.deliveryboolean = deliveryboolean;
	}
	public String getCollectionrequests() {
		return collectionrequests;
	}
	public void setCollectionrequests(String collectionrequests) {
		this.collectionrequests = collectionrequests;
	}
	public String getLaundryrequests() {
		return laundryrequests;
	}
	public void setLaundryrequests(String laundryrequests) {
		this.laundryrequests = laundryrequests;
	}
	public String getDeliveryrequests() {
		return deliveryrequests;
	}
	public void setDeliveryrequests(String deliveryrequests) {
		this.deliveryrequests = deliveryrequests;
	}
	
}
