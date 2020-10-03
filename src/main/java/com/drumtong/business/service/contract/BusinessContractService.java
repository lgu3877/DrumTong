package com.drumtong.business.service.contract;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class BusinessContractService {


	// 비즈니스 온라인 계약으로 이동 (GET) [건욱]
	public ModelAndView contract() {
		ModelAndView mav = new ModelAndView("business/contract/businessContract");
		return mav;
	}

	// 비즈니스 온라인 프리미엄 광고 계약으로 이동 (GET) [건욱]
	public ModelAndView premiumAd() {
		ModelAndView mav = new ModelAndView("business/contract/businessPremiumAd");
		return mav;
	}

	
	
}
