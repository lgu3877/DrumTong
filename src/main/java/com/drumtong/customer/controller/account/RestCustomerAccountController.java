package com.drumtong.customer.controller.account;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.drumtong.customer.service.account.RestCustomerAccountService;
import com.drumtong.customer.vo.CPointVO;

@RestController
@RequestMapping("customer/account/")
public class RestCustomerAccountController {
	
	@Autowired RestCustomerAccountService svc;
	
	// 비밀번호 수정하기 전 현재 비밀번호 체크[영경]
	@RequestMapping("customerJoinChange/rest/pwCheck/")
	@PostMapping(produces="application/json; charset=utf8")
	public String pwCheck(HttpServletRequest req, @RequestBody HashMap<String, String> param) {
		return svc.pwCheck(req, param.get("pw"));
	}
	
	// 개인정보 수정[영경]
	@RequestMapping("customerJoinChange/rest/Change/{type}/")
	@PostMapping(produces="application/json; charset=utf8")
	public String Change(HttpServletRequest req, @RequestBody HashMap<String, String> param,
			 @PathVariable("type")String type) {
		return svc.Change(req, type, param);
	}
	
	// 개인정보 중 고객 프로필 사진 업데이트[영경]
	@RequestMapping("customerJoinChange/rest/phontoID/")
	@PostMapping(produces="charset=utf-8", consumes = {"multipart/form-data"})
	public String changePhotoId(HttpServletRequest req, MultipartHttpServletRequest file) {
		return svc.changePhotoId(req, file);
	}
	
	// 개인정보 중 고객 프로필 사진 삭제[영경]
	@RequestMapping("customerJoinChange/rest/deletePhontoID/")
	@GetMapping(produces="application/json; charset=utf8")
	public String deletePhotoId(HttpServletRequest req) {
		return svc.deletePhotoId(req);
	}
	
	// 결제정보 변경[영경]
	@RequestMapping("customerPayAndCoupon/rest/paySave/")
	@PostMapping(produces="application/json; charset=utf8")
	public String paySave(HttpServletRequest req, @RequestBody HashMap<String, String> param) {
		return svc.paySave(req, param);
	}
	
	// 포인트 충전[영경]
	@RequestMapping("customerPayAndCoupon/rest/pointSave/")
	@PostMapping(produces="application/json; charset=utf8")
	public String pointSave(HttpServletRequest req, @RequestBody CPointVO newPoint) {
		return svc.pointSave(req, newPoint);
	}
}
