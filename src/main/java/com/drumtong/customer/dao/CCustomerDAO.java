package com.drumtong.customer.dao;

import com.drumtong.customer.vo.CCustomerVO;

public interface CCustomerDAO {

	// 고객 회원가입
	int insertSignUp(String MemberID);
	
	// MemberID 중복 검사
	int confirm(String MemberID);

	// 로그인 객체
	CCustomerVO selectLogin(String MemberID);
	
}
