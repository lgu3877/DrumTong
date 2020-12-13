package com.drumtong.customer.dao;

import com.drumtong.customer.vo.CPaymentVO;

public interface CPaymentDAO {

	// 고객 회원가입
	int insertSignUp(String MemberID);

	// 결제 관리 정보 들고오기
	CPaymentVO select(String memberid);
	

	
}
