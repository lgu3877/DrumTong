package com.drumtong.business.controller.submanagement;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.business.service.submanagement.RestBusinessSubManagementService;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.business.vo.BPaymentVO;
import com.drumtong.business.vo.ReviewList;


@RestController
@RequestMapping("business/subManagement/")
public class RestBusinessSubManagementController {


	@Autowired RestBusinessSubManagementService svc;

	// ========================= 대분류 [카드/계좌 관리] ================================ [건욱]
	
	
	// ===== 중분류 [BPAYMENT] 테이블 ==== 
	

	// === 소분류 [ CARD ] 필드 {CARDNUM, CARDBAMK, CARDYEAR, CARDMONTH, CVC} == [건욱]
	// 1. 카드를 비동기식으로 수정해주는 메서드입니다.
	@RequestMapping("BPayment/rest/updateCard/")
	@PostMapping(produces="application/json; charset=utf8")
	public String updateCard(@RequestBody BPaymentVO bPaymentVO) {
		
		int result = svc.updateCard(bPaymentVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	

	// === 소분류 [ ACCOUNT ] 필드 {ACCOUNTBANK, ACCOUNTNUM, CARDYEAR, CARDMONTH, CVC} == [건욱]
	// 2. 계좌를 비동기식으로 수정해주는 메서드입니다. 계좌관리에 통장사본 수정할 수 있는 란을 추가적으로 생성해줘야합니다.
	@RequestMapping("BPayment/rest/updateAccount/")
	@PostMapping(produces="application/json; charset=utf8")
	public String updateAccount(@RequestBody BPaymentVO bPaymentVO) {
		
		int result = svc.updateAccount(bPaymentVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	 
	// ========================= 대분류 [주문현황] ================================ [건욱]
	
	
		
	// ========================= 대분류 [리뷰관리] ================================ [영경]
	// 답글 달기		// processing in ('reply', 'report')
//	@PostMapping(produces=org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@PostMapping(produces="application/json; charset=UTF-8")
	@RequestMapping(value="businessReviewManagement/rest/{pageKind}/{processing}/", method = RequestMethod.POST, produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String updateReview(HttpServletRequest req, @RequestBody ReviewList reviewList, @PathVariable("pageKind")String pageKind, @PathVariable("processing")String processing) {
		return svc.updateReview(req, reviewList, pageKind, processing);
	}
	
	@RequestMapping("businessReviewManagement/rest/pageCount/")
	@PostMapping(produces="application/json; charset=utf8")
	public String CouponCount(HttpServletRequest req) {
		return svc.CouponCount(req);
	}
	

	// ========================= 대분류 [쿠폰관리] ================================ [영경]
	// processing in ('add', 'del')
	@RequestMapping("businessCouponManagement/rest/{processing}/")
	@PostMapping(produces="application/json; charset=utf8")
	public String updateCoupon(HttpServletRequest req, @RequestBody BCouponVO bcouponvo, @PathVariable("processing")String processing) {
		return svc.updateCoupon(req, bcouponvo, processing);
	}
}
