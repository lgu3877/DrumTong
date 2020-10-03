package com.drumtong.business.controller.submanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.submanagement.BusinessSubManagementService;

@Controller
@RequestMapping("business/submanagement/")
public class BusinessSubManagementController {

	@Autowired BusinessSubManagementService svc;
	
	// 비즈니스 리뷰관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessReviewManagement/", method = RequestMethod.GET)
	public ModelAndView reviewManagement() {
		return svc.reviewManagement();
	}
	
	// 비즈니스 쿠폰관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessCouponManagement/", method = RequestMethod.GET)
	public ModelAndView couponManagement() {
		return svc.couponManagement();
	}

	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessCardAccountManagement/", method = RequestMethod.GET)
	public ModelAndView cardAccountManagement() {
		return svc.cardAccountManagement();
	}
	

	// 비즈니스 통계관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessStatisticsManagement/", method = RequestMethod.GET)
	public ModelAndView statisticsManagement() {
		return svc.statisticsManagement();
	}

	// 비즈니스 주문관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessOrderStatusManagement/", method = RequestMethod.GET)
	public ModelAndView orderStatusManagement() {
		return svc.orderStatusManagement();
	}
	
	
	



}
