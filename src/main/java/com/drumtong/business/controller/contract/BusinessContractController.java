package com.drumtong.business.controller.contract;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
	// BpersonID 값을 불러오기 위해 resp값도 가져와준다.
	// 이미지를 S3에 저장하기위해 Multipartrequest를 불러와준다.
	@RequestMapping(value = "businessContract/", method = RequestMethod.POST)
	public ModelAndView contract(BInformationVO bInformationVO, BPaymentVO bPaymentVO,
								BManagementVO bManagementVO, HttpServletRequest req, MultipartHttpServletRequest mpf) {
		System.out.println("Contract Controller 실행 ");
		return svc.contract(bInformationVO, bPaymentVO, bManagementVO, req, mpf);
	}
	
	
	// 비즈니스 프리미엄 광고 계약 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessPremiumAd/", method = RequestMethod.GET)
	public ModelAndView premiumAd(HttpServletRequest req) {
		return svc.premiumAd(req);
	}		
	
	// 비즈니스 프리미엄 광고 계약 (POST) [건욱]
	@RequestMapping(value = "businessPremiumAd/", method = RequestMethod.POST)
	public ModelAndView premiumAd(BInformationVO bInformationVO, BPaymentVO bPaymentVO, HttpServletRequest req) {
		return svc.premiumAd(bInformationVO, bPaymentVO, req);
	}
	
	
}
