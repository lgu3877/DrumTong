package com.drumtong.customer.dao;

import java.util.HashMap;

import com.drumtong.customer.vo.CPaymentVO;

public interface CPaymentDAO {

	// 고객 회원가입
	int insertSignUp(String MemberID);

	// 결제 관리 정보 들고오기
	CPaymentVO select(String memberid);

	// 고객 결제관리 수정하기
	int updatePayment(HashMap<String, String> map);
	

	
}
