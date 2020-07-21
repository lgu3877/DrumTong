package com.drumtong.customer.controller.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.drumtong.customer.service.membership.CustomerMemberService;

@Controller
@RequestMapping("customer/membership/")
public class CustomerMembershipController {
	
	@Autowired CustomerMemberService svc;

	@RequestMapping(value = "customerLogin/", method = RequestMethod.GET)
	public String login() {
		return "customer/membership/customerLogin";
	}
	
	@RequestMapping(value = "customerSignUp/", method = RequestMethod.GET)
	public String join() {
		return "customer/membership/customerSignUp";
	}
}




