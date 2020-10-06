package com.drumtong.business.service.contract;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BEstablishmentDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.dao.BScheduleDaysDAO;
import com.drumtong.business.dao.BScheduleTimeDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BPaymentVO;
import com.drumtong.security.SerialUUID;

@Service
public class BusinessContractService {

	@Autowired BEstablishmentDAO bEstablishmentDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BScheduleTimeDAO bScheduleTimeDAO;
	@Autowired BScheduleDaysDAO bScheduleDaysDAO;
	
	
	// 비즈니스 온라인 계약으로 이동 (GET) [건욱]
	public ModelAndView contract() {
		ModelAndView mav = new ModelAndView("business/contract/businessContract");
		return mav;
	}

	// 온라인 계약 매장 생성 (POST) [건욱]
	// 기본으로 생성해주어야할 테이블도 같이 생성해줍니다.
	// 현재 메서드에서 생성되는 테이블은 다음과 같습니다.
	// 1. BEstablishment #사업장 테이블
	// 2. BInformation #사업장 정보 테이블
	// 3. BPayment #결제 테이블
	// 4. BManagement #매장관리 테이블
	// 5. BScheduleTime #영업시간관리 테이블
	// 6. BScheduleDays #정기휴무일정관리 테이블
	public ModelAndView contract(BInformationVO bInformationVO, BPaymentVO bPaymentVO, BManagementVO bManagementVO) {
		
		ModelAndView mav = new ModelAndView("redirect:/");
		
		// ESTID UUID 생성
		String ESTID = SerialUUID.getSerialUUID("BEstablishment", "ESTID");
		
		
		// 1. 사업장 BEstablishment 테이블에 정보 입력
		int BEstablishmentResult = bEstablishmentDAO.insertSignUp(ESTID);
		
		// 2. 사업장 BInformation 테이블에 정보 입력
		bInformationVO.setEstid(ESTID);
		int BInformationResult = bInformationDAO.insertSignUp(bInformationVO);
		
		// 3. 사업장 BPayment 테이블에 정보 입력
		bPaymentVO.setEstid(ESTID);
		int BPaymentResult = bPaymentDAO.insertSignUp(bPaymentVO);
		
		// 4. 사업장 BManagement 테이블에 '기본 카테고리' 정보 입력
		bManagementVO.setEstid(ESTID);
		int BManagementResult = bManagementDAO.insertSignUp(bManagementVO);
		
		// 5. 사업장 BScheduletime 테이블 정보 입력
		int BScheduleTimeResult = bScheduleTimeDAO.insertSignUp(ESTID);
		
		// 6. 사업장 BScheduleDays 테이블 정보 입력
		int BScheduleDaysResult = bScheduleDaysDAO.insertSignUp(ESTID);
		
		
		
		return mav;
	}


	// 비즈니스 온라인 프리미엄 광고 계약으로 이동 (GET) [건욱]
	public ModelAndView premiumAd() {
		ModelAndView mav = new ModelAndView("business/contract/businessPremiumAd");
		return mav;
	}

	
	// 비즈니스 온라인 프리미엄 광고 계약 (POST)) [건욱]
	// BInformation(사업장정보 테이블)의 Premium Boolean 값은  매개변수 값으로 String을 가져온다.
	public ModelAndView premiumAd(BInformationVO bInformationVO, BPaymentVO bPaymentVO) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		// 1. 프리미엄 광고 여부를 업데이트 시켜준다.
		bInformationVO.setPremiumboolean("Y");
		int BInformationResult = bInformationDAO.updatePremiumBoolean(bInformationVO);
		
		
		// 2. 프리미엄 광고 결제 수단 정보를 업데이트 시켜준다.
		int BPaymentResult = bPaymentDAO.updatePremiumPay(bPaymentVO);
		
		
		return mav;
	}
	
	
	
	
}
