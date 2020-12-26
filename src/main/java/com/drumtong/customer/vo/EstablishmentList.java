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
	private String mainimage;		// 가게 대표 사진
	private String defaultcategory;
	private String[] maincategory;	// 메인 카테고리 아이콘
	private double gpa;				// 좋아요 평균
	private char deliveryboolean;	// 배달 여부 'Y' or 'N'
	
	
	public String getDefaultcategory() {
		return defaultcategory;
	}
	public void setDefaultcategory(String defaultcategory) {
		maincategory = defaultcategory.split("/");
		this.defaultcategory = defaultcategory;
	}
	public String getMainimage() {
		return mainimage;
	}
	public void setMainimage(String mainimage) {
		this.mainimage = mainimage;
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
		this.gpa = gpa;
	}
	public char getDeliveryboolean() {
		return deliveryboolean;
	}
	public void setDeliveryboolean(char deliveryboolean) {
		this.deliveryboolean = deliveryboolean;
	}
	
	
}
