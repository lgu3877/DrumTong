package com.drumtong.business.dao;

import com.drumtong.business.vo.BManagementVO;

public interface BManagementDAO {

	BManagementVO selectCustomerDetail(String estid);

	// 신규 데이터 등록
	int insertSignUp(BManagementVO bManagementVO);

	
	// 매장관리 테이블에  {소개글,배달여부}를 업데이트 시켜준다. 
	int updateConstract(BManagementVO bManagementVO);

	// 매장 관리의 기본 템플릿을 제공해주는데 사용하는 Deafaultcategory입니다.
	String selectDefaultCategory(String estid);
	
	
	
	
	
	// =========================== REST ================================================

	// 매장 관리에 매장 소개글을 비동기식으로 수정해주는 메서드입니다. [REST]
	int updateIntroduction(BManagementVO bManagementVO);


	// 매장 관리에 배달유무를 비둥기식으로 수정해주는 메서드입니다.	[REST]
	int updateDeliveryBoolean(BManagementVO bManagementVO);


	// 매장 관리에 기본 카테고리를 비둥기식으로 수정해주는 메서드입니다.	[REST]
	int updateDefaultCategory(BManagementVO bManagementVO);

	
	

}
