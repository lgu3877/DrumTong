package com.drumtong.customer.controller.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.service.membership.CustomerMemberService;
import com.drumtong.customer.vo.CPrivateDataVO;

@Controller
@RequestMapping("customer/membership/")
public class CustomerMembershipController {
	
	@Autowired CustomerMemberService svc;
	// 로그인 페이지로 이동[영경]
	@RequestMapping(value = "customerLogin/", method = RequestMethod.GET)
	public ModelAndView login() {
		return svc.login();
	}
	
	// 로그인[영경]
	@RequestMapping(value = "customerLogin/", method = RequestMethod.POST)
	public ModelAndView login(CPrivateDataVO vo) {
		return svc.login(vo);
	}
	
	@RequestMapping(value = "customerSignUp/", method = RequestMethod.GET)
	public String join() {
		return "customer/membership/customerSignUp";
	}
}




