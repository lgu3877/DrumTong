package com.drumtong.business.controller.membership;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.membership.BusinessMembershipService;
import com.drumtong.business.vo.BPrivateDataVO;

@Controller
@RequestMapping("business/membership/")
public class BusinessMembershipController {

	@Autowired BusinessMembershipService svc;
	
	// 로그인 페이지로 이동[건욱]
	@RequestMapping(value = "businessLogin/", method = RequestMethod.GET)
	public ModelAndView login() {
		return svc.login();
	}
	
//	// 로그인[건욱]
//	@RequestMapping(value = "businessLogin/", method = RequestMethod.POST)
//	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp, BPrivateDataVO bPrivateDatavo, String storeid) {
//		return svc.login(req, resp, bPrivateDatavo, storeid);
//	}
//	
//	// 로그아웃[건욱]
//	@RequestMapping(value = "businessLogOut/", method = RequestMethod.GET)
//	public ModelAndView logOut(HttpServletRequest req, HttpServletResponse resp) {
//		return svc.logOut(req,resp);
//	}
	
	
	// 고객 회원가입 (GET) [건욱]
	@RequestMapping(value = "businessSignUp/", method = RequestMethod.GET)
	public ModelAndView signUp() {
		return svc.signUp();
	}
		
	// 고객 회원가입	(POST) [건욱]
	@RequestMapping(value = "businessSignUp/", method = RequestMethod.POST)
	public ModelAndView signUp(BPrivateDataVO bPrivateDataVO) {
		System.out.println("실행");
		return svc.signUp(bPrivateDataVO);
	}

	
}
