package com.drumtong.business.dao;

public interface BBusinessDAO {
	
	// 사업자 회원가입
	int insertSignUp(String BPersonID);
		

	// MemberID 중복 검사
	int confirm(String BPersonID);	
}
