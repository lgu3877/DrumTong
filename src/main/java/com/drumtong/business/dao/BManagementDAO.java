package com.drumtong.business.dao;

import com.drumtong.business.vo.BManagementVO;

public interface BManagementDAO {

	BManagementVO selectCustomerDetail(String estid);

	// 신규 데이터 등록
	int insertSignUp(BManagementVO bManagementVO);

}
