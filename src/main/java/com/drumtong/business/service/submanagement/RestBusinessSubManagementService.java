package com.drumtong.business.service.submanagement;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amazonaws.services.cloudwatch.model.Statistic;
import com.drumtong.business.dao.BBusinessReviewDAO;
import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BPaymentVO;
import com.drumtong.business.vo.ReviewList;
import com.drumtong.security.Review;
import com.drumtong.security.SerialUUID;
import com.drumtong.security.Statistics;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Service
public class RestBusinessSubManagementService {
	
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BBusinessReviewDAO bBusinessReviewDAO;
	@Autowired BCouponDAO bCouponDAO;
	
	
	// ========================= 대분류 [카드/계좌 관리] ================================ [건욱]
	
	
	// ===== 중분류 [BPAYMENT] 테이블 ==== 
	

	// === 소분류 [ CARD ] 필드 {CARDNUM, CARDBAMK, CARDYEAR, CARDMONTH, CVC} == [건욱]
	// 1. 카드를 비동기식으로 수정해주는 메서드입니다.
	public int updateCard(BPaymentVO bPaymentVO) {
		int RestUpdateCardReuslt = bPaymentDAO.updatePremiumPay(bPaymentVO);
		return RestUpdateCardReuslt;
	}


	// === 소분류 [ ACCOUNT ] 필드 {ACCOUNTBANK, ACCOUNTNUM, CARDYEAR, CARDMONTH, CVC} == [건욱]
	// 2. 계좌를 비동기식으로 수정해주는 메서드입니다. 계좌관리에 통장사본 수정할 수 있는 란을 추가적으로 생성해줘야합니다.
	public int updateAccount(BPaymentVO bPaymentVO) {
		int RestUpdateAccountReuslt = bPaymentDAO.updatePremiumPay(bPaymentVO);
		return RestUpdateAccountReuslt;
	}


	// ========================= 대분류 [리뷰 관리] ================================ [영경]
	// 답글 달기		// processing in ('reply', 'report')
	// 리뷰 구분을 위해 SALECODE를 항상 같이 넘겨주어야 함
	@Transactional
	public String updateReview(HttpServletRequest req, ReviewList reviewList, String pageKind, String processing) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		reviewList.setEstid(estid);
		int result = 0;
		
		switch(processing) {
		case "replyAdd":	// 사장님 답글 추가
			result = bReviewDAO.updateReplyConfirm(reviewList);		// estid, salecode
			result = bBusinessReviewDAO.updateReply(reviewList);	// content, estid, salecode
			break;
		case "reportAdd":	// 신고하기
			result = bReviewDAO.updateReportConfirm(reviewList);	// estid, salecode
			break;
		case "replyDelete":	// 사장님 답글 삭제(단, 댓글확인은 유지)
			result = bBusinessReviewDAO.deleteReply(reviewList);
			break;
		case "reportDelete":// 신고 해제
			result = bReviewDAO.deleteReportConfirm(reviewList);
			break;
		}
		
		List<ReviewList> bReviewList = Review.selectList(estid, pageKind);
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(bReviewList);
	}
	
	public String ReviewCount(HttpServletRequest req) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		
		HashMap<String, Integer> result = Review.pageList(estid);
		return new Gson().toJson(result);
	}

	// ========================= 대분류 [쿠폰관리] ================================ [영경]
	public String updateCoupon(HttpServletRequest req, BCouponVO bcouponvo, String processing) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bcouponvo.setEstid(estid);
		int result = 0;
		switch(processing) {
		case "add":
			bcouponvo.setCouponid(SerialUUID.getSerialUUID("BCoupon", "CouponID"));
			result = bCouponDAO.insertCoupon(bcouponvo);
			break;
		case "del":
			result = bCouponDAO.deleteCoupon(bcouponvo);
			break;
		}
		
		List<BCouponVO> couponList = bCouponDAO.select(estid);
		return new Gson().toJson(couponList);
	}

	// ========================= 대분류 [통계관리] ================================ [영경]
	public String selectStatistics(HttpServletRequest req, String startDate, String endDate, String pageKind, String option) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		return Statistics.statistics(estid, pageKind, option, startDate, endDate);
	}
	
}
