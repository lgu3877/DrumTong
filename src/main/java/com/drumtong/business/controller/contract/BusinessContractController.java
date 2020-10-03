package com.drumtong.business.controller.contract;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.contract.BusinessContractService;

@Controller
@RequestMapping("business/contract/")
public class BusinessContractController {

	@Autowired BusinessContractService svc;
	
	// 비즈니스 온라인 계약 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessContract/", method = RequestMethod.GET)
		public ModelAndView contract() {
		return svc.contract();
	}	
	
	// 비즈니스 온라인 계약 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessPremiumAd/", method = RequestMethod.GET)
		public ModelAndView premiumAd() {
		return svc.premiumAd();
	}		
	
}
