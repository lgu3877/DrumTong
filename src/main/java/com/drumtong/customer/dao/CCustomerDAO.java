package com.drumtong.customer.dao;

public interface CCustomerDAO {

	// 고객 회원가입
	int insertSignUp(String MemberID);
	
	// MemberID 중복 검사
	int confirm(String MemberID);

	
}
