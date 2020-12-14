package com.drumtong.customer.service.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.vo.CPaymentVO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.customer.vo.CouponList;

@Service
public class CustomerAccountService {
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BCouponDAO bCouponDAO;
	@Autowired CPaymentDAO cPaymentDAO;
	
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
		mav.addObject("accountNum", accountNum);
		mav.addObject("accountBank", cPaymentVO.getAccountbank());
		
		List<CouponList> couponlist = bCouponDAO.selectCouponList(Login.getMemberid());
		
		mav.addObject("couponlist", couponlist);
		// -------------------------------------------------
		return mav;
	}

}
