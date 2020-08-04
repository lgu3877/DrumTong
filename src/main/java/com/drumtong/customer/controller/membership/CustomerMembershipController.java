package com.drumtong.customer.controller.membership;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.drumtong.customer.service.membership.CustomerMembershipService;
import com.drumtong.customer.vo.CPrivateDataVO;

// 회원가입, 로그인 컨트롤러
@Controller
@RequestMapping("customer/membership/")
public class CustomerMembershipController {
	
	// 회원가입, 로그인 서비스
	@Autowired CustomerMembershipService svc;
	
	// 로그인 페이지로 이동[영경]
	@RequestMapping(value = "customerLogin/", method = RequestMethod.GET)
	public ModelAndView login() {
		return svc.login();
	}
	
	// 로그인[영경]
	@RequestMapping(value = "customerLogin/", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp, CPrivateDataVO cPrivateDatavo, String storeid) {
		return svc.login(req, resp, cPrivateDatavo, storeid);
	}
	
	// 고객 회원가입 (GET)
	@RequestMapping(value = "customerSignUp/", method = RequestMethod.GET)
	public ModelAndView signUp() {
		return svc.signUp();
	}
		
	// 고객 회원가입	(POST)
	@RequestMapping(value = "customerSignUp/", method = RequestMethod.POST)
	public ModelAndView signUp(CPrivateDataVO cPrivateDataVO) {
		System.out.println("실행");
		return svc.signUp(cPrivateDataVO);
	}
}




