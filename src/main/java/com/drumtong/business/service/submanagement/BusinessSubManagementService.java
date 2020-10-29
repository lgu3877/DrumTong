package com.drumtong.business.service.submanagement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BBusinessReviewDAO;
import com.drumtong.business.dao.BCustomerReviewDAO;
import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.vo.BBusinessReviewVO;
import com.drumtong.business.vo.BCustomerReviewVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BReviewVO;

@Service
public class BusinessSubManagementService {
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BCustomerReviewDAO bCustomerReviewDAO;
	@Autowired BBusinessReviewDAO bBusinessReviewDAO;

	// 비즈니스 리뷰관리 페이지로 이동 (GET) [영경]
	public ModelAndView reviewManagement(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("business/submanagement/businessReviewManagement");
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid = bInformationVO.getEstid();
		
		
		// 전체 리뷰
		List<BReviewVO> bReviewList = bReviewDAO.selectReview(estid);
		List<BCustomerReviewVO> bCustomerReviewList = bCustomerReviewDAO.selectReview(estid);
		List<BBusinessReviewVO> bBusinessReviewList = bBusinessReviewDAO.selectReview(estid);
		
		mav.addObject("bReview", bReviewList);
		mav.addObject("ReviewCount", bReviewList.size());
		mav.addObject("bCustomerReview", bCustomerReviewList);
		mav.addObject("bBusinessReview", bBusinessReviewList);
		
		// 미답변리뷰
		List<BReviewVO> NoReplybReviewList = bReviewDAO.selectNoReply(estid);
		List<BCustomerReviewVO> bCustomerNoReplyReviewList = bCustomerReviewDAO.selectNoReply(estid);

		mav.addObject("NoReplybReview", NoReplybReviewList);
		mav.addObject("NoReplybReviewCount", NoReplybReviewList.size());
		mav.addObject("bCustomerNoReplyReview", bCustomerNoReplyReviewList);
		return mav;
	}


	// 비즈니스 쿠폰관리 페이지로 이동 (GET) [건욱]
	public ModelAndView couponManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessCouponManagement");
		return mav;
	}


	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	public ModelAndView cardAccountManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessCardAccountManagement");
		return mav;
	}



	// 비즈니스 통계관리 페이지로 이동 (GET) [건욱]
	public ModelAndView statisticsManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessStatisticsManagement");
		return mav;
	}


	// 비즈니스 주문현황 관리 페이지로 이동 (GET) [건욱]
	public ModelAndView orderStatusManagement() {
		ModelAndView mav = new ModelAndView("business/submanagement/businessOrderStatusManagement");
		return mav;
	}

	
}
