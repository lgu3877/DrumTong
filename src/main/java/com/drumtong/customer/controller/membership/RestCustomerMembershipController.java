package com.drumtong.customer.controller.membership;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.customer.service.membership.RestCustomerMembershipService;
import com.drumtong.security.Login;

@RestController
@RequestMapping("customer/membership/")
public class RestCustomerMembershipController {
	
	// REST 회원가입, 로그인 서비스
	@Autowired RestCustomerMembershipService svc;
	
		
	// 아이디 중복 검사 
	@RequestMapping("customerSignUp/rest/useridDupl/{param}/")
	@GetMapping(produces="application/json; charset=utf8")	
	public String getMember(@PathVariable("param")String id) {
		int result = svc.useridDupl(id);
		System.out.println(result + " : result 값 입니다");
		return result == 0
				? "true"
				: "false";
	}
	
	// 로그인 비동기식 버전
	@RequestMapping("customerLogin/rest/login/")
	@PostMapping(produces="application/json; charset=utf8")
	public String login(HttpServletRequest req, HttpServletResponse resp, @RequestBody HashMap<String, String> param) {
		return svc.login(req, resp, param);
	}
	
	// 로그인 POST로 넘기기 전 체크[영경]
	@RequestMapping("customerLogin/rest/loginCheck/")
	@PostMapping(produces="application/json; charset=utf8")
	public String loginCheck(@RequestBody HashMap<String, String> param) {
		return Login.loginCheck(param);
	}
	
	//이메일 중복 검사 POST[영경]
	@RequestMapping("customerSignUp/rest/emailCheck/{param}/")
	@GetMapping(produces="application/json; charset=utf8")
	public String emailCheck(@PathVariable("param")String email) {
		return svc.emailCheck(email);
	}
	
}


