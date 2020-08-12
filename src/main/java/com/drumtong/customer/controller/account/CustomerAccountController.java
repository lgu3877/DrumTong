package com.drumtong.customer.controller.account;

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
	

	@RequestMapping(value = "customerPayAndCopon/", method = RequestMethod.GET)
	public String pac() {
		return "customer/account/customerPayAndCopon";
	}
	
	@RequestMapping(value = "customerJoinChange/", method = RequestMethod.GET)
	public String jc() {
		return "customer/account/customerJoinChange";
	}


	@RequestMapping("customerBookmark/")
	public ModelAndView bookmark() {
		return new ModelAndView("customer/account/customerBookmark");
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

