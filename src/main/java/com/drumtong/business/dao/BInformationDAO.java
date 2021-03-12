package com.drumtong.business.dao;

import java.util.HashMap;
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
	List<EstablishmentList> selectEstablishmentList(HashMap<String, String> param);

	// 온라인 계약의 절차 여부에 따라 status 값을 변경시켜준다.
	int updateStatus(HashMap<String, String> map);

	// 1.매장 정보에 [매장 주소]를 변경해주는 함수입니다.
	int updateLocation(BInformationVO bInformationVO);

	
	// 매장의 현재 상태를 가져와줍니다.
	String selectStatus(String estid);
	
	// 매장 좌표 Select REST 
	List<BInformationVO> selectBInformationCoord();

	//	EMDCODE 를 출력해주는 SQL문입니다.
	String selectEMDCode(String estid);

	// 검색어 자동완성
	List<BInformationVO> searchAutoComplete(String searchWord);


}
