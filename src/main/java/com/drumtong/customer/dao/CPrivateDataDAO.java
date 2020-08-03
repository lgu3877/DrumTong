package com.drumtong.customer.dao;


import com.drumtong.customer.vo.CPrivateDataVO;

public interface CPrivateDataDAO {

	// 고객 회원가입
	int insertSignUp(CPrivateDataVO vo);
	
	// 아이디, 비밀번호 체크
	CPrivateDataVO selectUser(String securePassword);

	String selectID(String memberID);
	
}
