package com.drumtong.business.controller.membership;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.business.service.membership.RestBusinessMembershipService;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.Login;

@RestController
@RequestMapping("business/membership/")
public class RestBusinessMembershipController {

	@Autowired RestBusinessMembershipService svc;
	
	
	// 아이디 중복 검사 [건욱]
	@RequestMapping("businessSignUp/rest/useridDupl/{param}/")
	@GetMapping(produces="application/json; charset=utf8")	
	public String getMember(@PathVariable("param")String id) {
		int result = svc.useridDupl(id);
		System.out.println(result + " : result 값 입니다");
		return result == 0
				? "true"
				: "false";
	}
	
	// 로그인 비동기식 버전 [영경]
	@RequestMapping("businessLogin/rest/login/")
	@PostMapping(produces="application/json; charset=utf8")
	public String login(HttpServletRequest req, HttpServletResponse resp, @RequestBody HashMap<String, String> param) {
		return svc.login(req, resp, param);
	}
	
	// 로그인 POST로 넘기기 전 체크[영경]
	@RequestMapping("businessLogin/rest/loginCheck/")
	@PostMapping(produces="application/json; charset=utf8")
	public String loginCheck(@RequestBody HashMap<String, String> param) {
		return Login.loginCheck(param);
	}
	
	// 계정이 일치한다면 이메일 전송[영경]
	@RequestMapping("businessAccountFind/rest/userCheck/")
	@PostMapping(produces="application/json; charset=utf8")
	public String emailConfirm(BPrivateDataVO bprivatedatavo) {
		return svc.emailConfirm(bprivatedatavo);
	}
	
}
