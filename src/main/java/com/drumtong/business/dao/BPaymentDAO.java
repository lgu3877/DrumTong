package com.drumtong.business.dao;

import com.drumtong.business.vo.BPaymentVO;

public interface BPaymentDAO {

	// 신규 데이터 생성
	int insertSignUp(BPaymentVO bPaymentVO);


	// 통장사본을 업데이트 시켜줍니다. S3에 사용
	int updateCopyOfBankBook(BPaymentVO vo);

	
	//	UUID 중복검사 aws S3에 들어가는 이미지입니다 
	int confirm(String SerialUUID);

	// Bpayment 테이블 데이터를 전부 불러옵니다.
	BPaymentVO selectList(String estid);

	
//================REST=============================
	
	// 프리미엄 광고 결제수단 업데이트 / REST일 시에도 사용
	int updatePremiumPay(BPaymentVO bPaymentVO);

	// 계좌 업데이트 (REST)
	int updateAccount(BPaymentVO bPaymentVO);



}
