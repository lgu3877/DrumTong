package com.drumtong.business.service.submanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.vo.BPaymentVO;

@Service
public class RestBusinessSubManagementService {
	
	@Autowired BPaymentDAO bPaymentDAO;
	
	
	// ========================= 대분류 [카드/계좌 관리] ================================ [건욱]
	
	
	// ===== 중분류 [BPAYMENT] 테이블 ==== 
	

	// === 소분류 [ CARD ] 필드 {CARDNUM, CARDBAMK, CARDYEAR, CARDMONTH, CVC} == [건욱]
	// 1. 카드를 비동기식으로 수정해주는 메서드입니다.
	public int updateCard(BPaymentVO bPaymentVO) {
		int RestUpdateCardReuslt = bPaymentDAO.updatePremiumPay(bPaymentVO);
		return RestUpdateCardReuslt;
	}


	// === 소분류 [ ACCOUNT ] 필드 {ACCOUNTBANK, ACCOUNTNUM, CARDYEAR, CARDMONTH, CVC} == [건욱]
	// 2. 계좌를 비동기식으로 수정해주는 메서드입니다. 계좌관리에 통장사본 수정할 수 있는 란을 추가적으로 생성해줘야합니다.
	public int updateAccount(BPaymentVO bPaymentVO) {
		int RestUpdateAccountReuslt = bPaymentDAO.updatePremiumPay(bPaymentVO);
		return RestUpdateAccountReuslt;
	}


	
}
