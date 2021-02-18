package com.drumtong.business.vo;

public class ReviewList extends BReviewVO{
//	private String memberid;
//	private String estid;
//	private String salecode;
//	private double gpa;			// 평점
//	private int mgood;			// 좋아요
//	private int reportcount;	// 신고횟수
//	private char secreatbolean;
//	private char deleteboolean;
//	private String deletedate;
//	private String reviewimg;	// 리뷰 사진	
//	private char replyboolean;	// 사장님 답글 여부
//	private char blockboolean;	// 사장님 신고 여부
	private String ccontent;	// 고객 리뷰
	private String cregistdate;	// 고객 리뷰 생성 날짜
	private String bcontent;	// 사업자 답글
	private String bregistdate;	// 사업자 답글 날짜
	private String customerName;	// 고객 이름(앞에 두 글자 나오고, 무조건 별 3개 붙이도록 설정 EX 이름: 이영경 -> 이영***)
	private String profileimg;		// 고객 프로필 사진 주소(없으면 null값이 들어가 있음)
	private String orderList;	// 주문 목록
	private int amount;	// 총 주문 개수
	private int visits; // 방문 수
	private String orderListMsg; // 주문현황 메세지
	
	
	public String getOrderListMsg() {
		return orderListMsg;
	}
	public void setOrderListMsg(String orderListMsg) {
		this.orderListMsg = orderListMsg;
	}
	public int getVisits() {
		return visits;
	}
	public void setVisits(int visits) {
		this.visits = visits;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getOrderList() {
		return orderList;
	}
	public void setOrderList(String orderList) {
		this.orderList = orderList;
	}
	public String getProfileimg() {
		return profileimg;
	}
	public void setProfileimg(String profileimg) {
		this.profileimg = profileimg;
	}
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
