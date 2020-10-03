package com.drumtong.business.service.submanagement;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class BusinessSubManagementService {


	// 비즈니스 리뷰관리 페이지로 이동 (GET) [건욱]
	public ModelAndView reviewManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessReviewManagement");
		return mav;
	}


	// 비즈니스 쿠폰관리 페이지로 이동 (GET) [건욱]
	public ModelAndView couponManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessCouponManagement");
		return mav;
	}


	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	public ModelAndView cardAccountManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessCardAccountManagement");
		return mav;
	}



	// 비즈니스 통계관리 페이지로 이동 (GET) [건욱]
	public ModelAndView statisticsManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessStatisticsManagement");
		return mav;
	}


	// 비즈니스 주문현황 관리 페이지로 이동 (GET) [건욱]
	public ModelAndView orderStatusManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessOrderStatusManagement");
		return mav;
	}

	
}
