package com.drumtong.customer.controller.account;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.service.account.CustomerAccountService;

@Controller
@RequestMapping("customer/account/")
public class CustomerAccountController {

	@Autowired CustomerAccountService svc;
	
	// 결제수단 및 쿠폰[영경]
	@RequestMapping(value = "customerPayAndCoupon/", method = RequestMethod.GET)
	public ModelAndView payAndCoupon(HttpServletRequest req) {
		return svc.payAndCoupon(req);
	}
	
	
	// 회원정보 수정[영경]
	@RequestMapping(value = "customerJoinChange/", method = RequestMethod.GET)
	public ModelAndView joinChange(HttpServletRequest req) {
		return svc.joinChange(req);
	}

	// 북마크[영경]
	@RequestMapping("customerBookmark/")
	public ModelAndView bookmark(HttpServletRequest req) {
		return svc.bookmark(req);
	}
	
	@RequestMapping("customerMenu/")
	public ModelAndView menu() {
		return new ModelAndView("customer/account/customerMenu");
	}
	
	@RequestMapping("customerOrderList/")
	public ModelAndView orderList() {
		return new ModelAndView("customer/account/customerOrderList");
	}
}

