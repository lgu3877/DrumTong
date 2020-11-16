package com.drumtong.business.service.submanagement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BSalesVO;
import com.drumtong.security.Review;

@Service
public class BusinessSubManagementService {
	@Autowired BSalesDAO bSalesDAO;
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BCouponDAO bCouponDAO;

	// 비즈니스 리뷰관리 페이지로 이동 (GET) [영경]
	public ModelAndView reviewManagement(HttpServletRequest req, String pageKind, String pageNum) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		
		// ===================================================================================
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = bInformationVO.getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		// ===================================================================================
		
		String estid = bInformationVO.getEstid();
		ModelAndView mav = new ModelAndView("business/submanagement/businessReviewManagement");
		
//		Review.reviewForBusiness(mav, estid, pageKind, pageNum);
		Review.reviewForBusiness(mav, estid, pageKind);
		
		
		
		return mav;
	}


	// 비즈니스 쿠폰관리 페이지로 이동 (GET) [영경]
	public ModelAndView couponManagement(HttpServletRequest req) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = bInformationVO.getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		ModelAndView mav = new ModelAndView("business/submanagement/businessCouponManagement");
		
		List<BCouponVO> couponList = bCouponDAO.select(bInformationVO.getEstid());
		mav.addObject("couponList", couponList);
		
		return mav;
	}


	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	public ModelAndView cardAccountManagement(HttpServletRequest req) {		// Status 계약 여부 필드를 세션을 받아와준다.

		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessCardAccountManagement");
		return mav;
	}



	// 비즈니스 통계관리 페이지로 이동 (GET) [건욱]
	public ModelAndView statisticsManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessStatisticsManagement");
		return mav;
	}


	// 비즈니스 주문현황 관리 페이지로 이동 (GET) [건욱]
	public ModelAndView orderStatusManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		
				
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
			
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid = bInformationVO.getEstid();
			
		//	주문현황 페이지에 필요한 구매정보 데이터를 가져와줍니다. 
		List<BSalesVO> bSalesList =  bSalesDAO.selectBSales(estid);
	
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessOrderStatusManagement");
		
		
		mav.addObject("bSales", bSalesList);
		
		
		return mav;
	}

	
}
