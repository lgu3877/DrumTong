package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.vo.EstablishmentList;

public interface BInformationDAO {

	BInformationVO selectCustomerDetail(String estid);
	
	// 사업장의 위도와 경도를 받아온다.
	List<BInformationVO> selectBusinessMapInfo();

	
	List<BInformationVO> selectBookmark(String memberid);

	// 신규 데이터 생성 
	int insertSignUp(BInformationVO bInformationVO);

	// 프리미엄 광고 여부 업데이트
	int updatePremiumBoolean(BInformationVO bInformationVO);

	// 사업자가 가지고 있는 모든 매장 리스트 출력
	List<BInformationVO> selectInformationList(String bpersonid);

	// 매장 이름 출력
	BInformationVO selectEst(String estid);

	// 페이지 방문을 위해 계약 여부를 확인합니다.
	String selectPremiumBoolean(String estid);


	//	UUID 중복검사 aws S3에 들어가는 이미지입니다 	
	int ReportCardconfirm(String SerialUUID);

	//	UUID 중복검사 aws S3에 들어가는 이미지입니다 	
	int Licenseconfirm(String SerialUUID);
	
	// 영업신고증을 업데이트 시켜줍니다. S3에 사용돕니다.
	int updateReportCard(BInformationVO vo);

	
	// 사업자등록증을 업데이트 시켜줍니다. S3에 사용됩니다.
	int updateLicense(BInformationVO vo);

	// 조건에 맞는 사업장 리스트를 들고온다.
	List<EstablishmentList> selectEstablishmentList(String MainAddress);



}
