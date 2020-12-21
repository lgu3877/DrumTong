package com.drumtong.customer.service.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BDetailSalesDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.BDetailSalesVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.OrderList;
import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.vo.CPaymentVO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.customer.vo.CouponList;
import com.drumtong.security.OrderListSetting;
import com.google.gson.Gson;

@Service
public class CustomerAccountService {
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BCouponDAO bCouponDAO;
	@Autowired CPaymentDAO cPaymentDAO;
	@Autowired BSalesDAO bSalesDAO;
	@Autowired BDetailSalesDAO bDetailSalesDAO;
	
	
	
	
	// 북마크[영경]
	public ModelAndView bookmark(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("customer/account/customerBookmark");
		CPrivateDataVO Login = ((CPrivateDataVO)req.getSession().getAttribute("cLogin"));
		// cbookmark 에서 memberid를 검색해 estid 리스트 출력
		
		// estid 와 일치하는 사업자 테이블 리스트 출력
		
		List<BInformationVO> bookmarkList = bInformationDAO.selectBookmark(Login.getMemberid());
		mav.addObject("bookmarkList", bookmarkList);
		return mav;
	}

	// 회원정보 수정[영경]
	public ModelAndView joinChange(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("customer/account/customerJoinChange");
		CPrivateDataVO Login = ((CPrivateDataVO)req.getSession().getAttribute("cLogin"));
		
		mav.addObject("member", Login);
		return mav;
	}

	public ModelAndView payAndCoupon(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("customer/account/customerPayAndCoupon");
		CPrivateDataVO Login = ((CPrivateDataVO)req.getSession().getAttribute("cLogin"));
		
		CPaymentVO cPaymentVO = cPaymentDAO.select(Login.getMemberid());
		
		String card = cPaymentVO.getCard();
		String accountNum = cPaymentVO.getAccountnum();
		
		mav.addObject("cardNum", card.equals("-") ? new String[]{"","","",""} : card.split("-"));
		mav.addObject("cardBank", cPaymentVO.getCardbank());
		mav.addObject("accountNum", accountNum.equals("-") ? "" : accountNum);
		mav.addObject("accountBank", cPaymentVO.getAccountbank());
		
		List<CouponList> couponlist = bCouponDAO.selectCouponList(Login.getMemberid());
		
		mav.addObject("couponlist", couponlist);
		// -------------------------------------------------
		return mav;
	}
	
	// 주문 목록 [건욱]
	public ModelAndView orderList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("customer/account/customerOrderList");
		CPrivateDataVO Login = ((CPrivateDataVO)req.getSession().getAttribute("cLogin"));
		
		//	주문 목록 페이지에 필요한 구매정보 데이터를 가져와줍니다
		List<OrderList> orderList = bSalesDAO.selectOrderList(Login.getMemberid());
		
		
		// OrderListSetting 클래스는 static으로 구성이되어 있다. [사업자 주문목록 / 고객 주문목록 ] 둘 다 사용 가능
		// setOrderList 함수는 orderList의 메인 메뉴, 서브메뉴, 메뉴들을 Tree구조로 중첩되지 않게 구성시켜즈는 역할을 한다.
		// orderList에 maincategory의 구조는 다음과 같다.
//		 		  메인                                            서브                       VO
//		HashMap<String, List<HashMap<String,List<BDetailSalesVO>>>>
		mav.addObject("orderList", (new Gson()).toJson(OrderListSetting.setOrderList(orderList)));
		return mav;
	}

}
