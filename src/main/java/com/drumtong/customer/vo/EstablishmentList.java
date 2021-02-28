package com.drumtong.customer.vo;

import com.drumtong.business.vo.BInformationVO;

public class EstablishmentList extends BInformationVO{
//	private String estid;			// 사업장 id
//	private String taxation;		// 과세구분
//	private String crn;				// 사업자등록번호
//	private String brandnaming;		// 상호명
//	private String representative;	// 대표자
//	private String mainlocation;	// 소재지
//	private String detaillocation;	// 상세 소재지
//	private String reportcard;		// 영업신고증
//	private String license;			// 사업자등록증
//	private String latitude;		// 위도
//	private String longitude;		// 경도
//	private String status;			// 메뉴, 일정관리 등록 시 SUCCESS/ FAIL
//	private String premiumboolean;	// 프리미엄 'Y', or 'N'
	private String mainimg;		// 가게 대표 사진
	private String defaultcategory;
	private String[] maincategory;	// 메인 카테고리 아이콘
	private double gpa;				// 좋아요 평균
	private char deliveryboolean;	// 배달 여부 'Y' or 'N'
	private int reviewnum;			// 리뷰 개수
	private char openboolean;		// 휴무 여부
	private String reason;		// 휴무 이유
	
	public char getOpenboolean() {
		return openboolean;
	}
	public void setOpenboolean(char openboolean) {
		this.openboolean = openboolean;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}
	public String getDefaultcategory() {
		return defaultcategory;
	}
	public void setDefaultcategory(String defaultcategory) {
		maincategory = defaultcategory.split("/");
		this.defaultcategory = defaultcategory;
	}
	public String getMainimg() {
		return mainimg;
	}
	public void setMainimg(String mainimg) {
		this.mainimg = mainimg;
	}
	public String[] getMaincategory() {
		return maincategory;
	}
	public void setMaincategory(String[] maincategory) {
		this.maincategory = maincategory;
	}
	public double getGpa() {
		return gpa;
	}
	public void setGpa(double gpa) {
//		// 1. 소수 첫째자리까지 끊어준 후 2를 곱한다
//		gpa = Math.round((gpa * 1.0) / 1.0) * 2.0;
//		// 2. 1의 자리를 반올림 해준다.
//		double tmp = gpa % 10;
//		gpa = gpa + -tmp + (tmp < 5 ? 0 : (10));
//		this.gpa = gpa / 2.0;
		this.gpa  = Double.parseDouble((String.format("%.2f",gpa)));
	}
	public char getDeliveryboolean() {
		return deliveryboolean;
	}
	public void setDeliveryboolean(char deliveryboolean) {
		this.deliveryboolean = deliveryboolean;
	}
	
	
}
