package com.drumtong.customer.dao;

import com.drumtong.customer.vo.CPrivateDataVO;

public interface CPrivateDataDAO {

	// 고객 회원가입
	int insertSignUp(CPrivateDataVO vo);
	
	// 로그인
	CPrivateDataVO selectLogin(String securePassword);

	String selectID(String memberID);
	
//	(REST) 아이디 중복 검사 
	int useridDupl(String id);


	
}
