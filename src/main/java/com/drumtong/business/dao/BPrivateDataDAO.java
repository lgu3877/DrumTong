package com.drumtong.business.dao;

import com.drumtong.business.vo.BPrivateDataVO;

public interface BPrivateDataDAO {
	

	// 사업자 회원가입 
	int insertSignUp(BPrivateDataVO vo);
	
	// 로그인 
	BPrivateDataVO selectLogin(String securePassword);

	String selectID(String BPersonID);
	
	//	(REST) 아이디 중복 검사 
	int useridDupl(String id);
	
}
