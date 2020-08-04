package com.drumtong.customer.controller.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.customer.service.membership.RestCustomerMembershipService;

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
	
	
}


