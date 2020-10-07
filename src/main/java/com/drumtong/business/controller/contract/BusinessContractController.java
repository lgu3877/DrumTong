package com.drumtong.business.controller.contract;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.contract.BusinessContractService;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.BPaymentVO;

@Controller
@RequestMapping("business/contract/")
public class BusinessContractController {

	@Autowired BusinessContractService svc;
	
	// 비즈니스 온라인 계약 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessContract/", method = RequestMethod.GET)
	public ModelAndView contract() {
		return svc.contract();
	}	
	
	// 온라인 계약 매장 생성 (POST) [건욱]  
	// ※ BManagementVO의 DefayktCategory(메뉴 카테고리)는 Javascript에서 "/"를 넣어준다
	// ex) 일반의류/신발/카페트/
	@RequestMapping(value = "businessContract/", method = RequestMethod.POST)
	public ModelAndView contract(BInformationVO bInformationVO, BPaymentVO bPaymentVO, BManagementVO bManagementVO) {
		return svc.contract(bInformationVO, bPaymentVO, bManagementVO);
	}
	
	
	// 비즈니스 프리미엄 광고 계약 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessPremiumAd/", method = RequestMethod.GET)
	public ModelAndView premiumAd() {
		return svc.premiumAd();
	}		
	
	// 비즈니스 프리미엄 광고 계약 (POST) [건욱]
	@RequestMapping(value = "businessPremiumAd/", method = RequestMethod.POST)
	public ModelAndView premiumAd(BInformationVO bInformationVO, BPaymentVO bPaymentVO) {
		return svc.premiumAd(bInformationVO, bPaymentVO);
	}
	
	
}
