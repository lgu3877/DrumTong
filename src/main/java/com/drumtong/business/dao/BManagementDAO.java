package com.drumtong.business.dao;

import com.drumtong.business.vo.BManagementVO;

public interface BManagementDAO {

	BManagementVO selectCustomerDetail(String estid);

	// 신규 데이터 등록
	int insertSignUp(BManagementVO bManagementVO);

	
	// 매장관리 테이블에  {소개글,배달여부,퀵여부}를 업데이트 시켜준다. 
	int updateConstract(BManagementVO bManagementVO);

	
	
	
	
	
	
	// =========================== REST ================================================

	// 매장 관리에 매장 소개글을 비동기식으로 수정해주는 메서드입니다. [REST]
	int updateIntroduction(BManagementVO bManagementVO);


	// 매장 관리에 배달유무를 비둥기식으로 수정해주는 메서드입니다.
	int updateDeliveryBoolean(BManagementVO bManagementVO);


	// 매장 관리에 퀵여부를 비둥기식으로 수정해주는 메서드입니다.
	int updateQuickBoolean(BManagementVO bManagementVO);
	
	
	// 매장 관리에 기본 카테고리를 비둥기식으로 수정해주는 메서드입니다.
	int updateDefaultCategory(BManagementVO bManagementVO);

}
