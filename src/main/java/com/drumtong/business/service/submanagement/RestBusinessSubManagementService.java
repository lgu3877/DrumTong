package com.drumtong.business.service.submanagement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.drumtong.business.dao.BBusinessReviewDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BPaymentVO;
import com.drumtong.business.vo.ReviewList;
import com.drumtong.security.Review;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Service
public class RestBusinessSubManagementService {
	
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BBusinessReviewDAO bBusinessReviewDAO;
	
	
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
	
	// ========================= 대분류 [쿠폰관리] ================================ [영경]
}
