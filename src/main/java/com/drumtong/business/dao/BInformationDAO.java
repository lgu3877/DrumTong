package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BInformationVO;

public interface BInformationDAO {

	BInformationVO selectCustomerDetail(String estid);
	
	// 사업장의 위도와 경도를 받아온다.
	List<BInformationVO> selectBusinessMapInfo();

	
	List<BInformationVO> selectBookmark(String memberid);

	// 신규 데이터 생성 
	int insertSignUp(BInformationVO bInformationVO);

	// 프리미엄 광고 여부 업데이트
	int updatePremiumBoolean(BInformationVO bInformationVO);

	List<BInformationVO> selectInformationList(String bpersonid);

	// 매장 이름 출력
	BInformationVO selectEst(String estid);

	// 페이지 방문을 위해 계약 여부를 확인합니다.
	String selectPremiumBoolean(String estid);


}
