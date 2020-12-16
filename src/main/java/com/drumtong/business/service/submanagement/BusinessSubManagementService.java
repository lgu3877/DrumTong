package com.drumtong.business.service.submanagement;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BDetailSalesDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.business.vo.BDetailSalesVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BSalesVO;
import com.drumtong.business.vo.OrderList;
import com.drumtong.security.Review;
import com.drumtong.security.Statistics;
import com.drumtong.system.dao.SImageDAO;
import com.google.gson.Gson;

@Service
public class BusinessSubManagementService {
	@Autowired BSalesDAO bSalesDAO;
	@Autowired BDetailSalesDAO bDetailSalesDAO;
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BCouponDAO bCouponDAO;
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired SImageDAO sImageDAO;

	// 비즈니스 리뷰관리 페이지로 이동 (GET) [영경]
	public ModelAndView reviewManagement(HttpServletRequest req, String pageKind) {
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
		
		mav.addObject("couponList", (new Gson()).toJson(couponList));
		
		return mav;
	}


	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	public ModelAndView cardAccountManagement(HttpServletRequest req) {		// Status 계약 여부 필드를 세션을 받아와준다.
		
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessCardAccountManagement");
		
		// BPayment 테이블의 정보가 담겨있는 객체입니다.
		mav.addObject("paymentList", (new Gson()).toJson(bPaymentDAO.selectList(bInformationVO.getEstid())));
		mav.addObject("imagesrcList", (new Gson()).toJson(sImageDAO.selectSImageSRC("BANK")));
		return mav;
	}



	// pageKind in ('Hits[조회수]', 'Sales[주문 수]', 'Price[주문 금액]')
	// 비즈니스 통계관리 페이지로 이동 (GET) [영경]
	public ModelAndView statisticsManagement(HttpServletRequest req, String pageKind, String option, String startDate, String endDate) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = bInformationVO.getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		
		// -------------------------------------------------------------------------
		String estid = bInformationVO.getEstid();
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessStatisticsManagement");
		mav.addObject("statisticsList", startDate == null || "n".equals(startDate) || endDate == null || "n".equals(endDate)? 
								Statistics.statistics(estid, pageKind, option) : 
								Statistics.statistics(estid, pageKind, option, startDate, endDate));
		mav.addObject("pageKind", pageKind == null || "n".equals(pageKind) ? "Hits/" : pageKind + "/");
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
		
		// ♠ => 이 표시는 bsalesDAO의 selectBsales 메서드를 임시로 주석처리하면서 같이 주석한 코드들!
		// -> 영경에게 물어보기
		
		//♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠
		//	주문현황 페이지에 필요한 구매정보 데이터를 가져와줍니다. 
		List<OrderList> orderList =  bSalesDAO.selectOrderList(estid);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("estid", estid);
		
		for (OrderList ol : orderList) {
			map.put("salecode", ol.getSalecode());
			List<BDetailSalesVO> bDetailSalesList = bDetailSalesDAO.selectBDetailSalesList(map);
			ol.setbDetailSalesVOList(bDetailSalesList);
		}
		
		System.out.println("sysout1 : " + orderList.get(0).getSalecode());
		System.out.println("sysout2 : " + orderList.get(0).getBrandnaming());
		System.out.println("sysout3 : " + orderList.get(0).getbDetailSalesVOList().get(0).getName());
		//♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessOrderStatusManagement");
		
		//♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠
		mav.addObject("orderList", (new Gson()).toJson(orderList));
		//♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠♠
		
		return mav;
	}

	
}
