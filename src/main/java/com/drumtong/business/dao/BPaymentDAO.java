package com.drumtong.business.dao;

import com.drumtong.business.vo.BPaymentVO;

public interface BPaymentDAO {

	// 신규 데이터 생성
	int insertSignUp(BPaymentVO bPaymentVO);


	// 프리미엄 광고 결제수단 업데이트
	int updatePremiumPay(BPaymentVO bPaymentVO);

}
