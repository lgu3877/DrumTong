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
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.BBusinessReviewVO;
import com.drumtong.business.vo.BCustomerReviewVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BReviewVO;
import com.drumtong.business.vo.BSalesVO;

@Service
public class BusinessSubManagementService {
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BCustomerReviewDAO bCustomerReviewDAO;
	@Autowired BBusinessReviewDAO bBusinessReviewDAO;
	@Autowired BSalesDAO bSalesDAO;
	
	
	// 비즈니스 리뷰관리 페이지로 이동 (GET) [영경]
	public ModelAndView reviewManagement(HttpServletRequest req) {
  
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
			
		
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
	public ModelAndView couponManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessReviewManagement");
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
