package com.drumtong.customer.service.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BBusinessReviewDAO;
import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BCustomerReviewDAO;
import com.drumtong.business.dao.BDetailSalesDAO;
import com.drumtong.business.dao.BEstablishmentDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.OrderList;
import com.drumtong.business.vo.ReviewList;
import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.dao.CPointDAO;
import com.drumtong.customer.vo.CPaymentVO;
import com.drumtong.customer.vo.CPointVO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.customer.vo.CouponList;
import com.drumtong.security.AwsServiceImpl;
import com.drumtong.security.OrderListSetting;
import com.google.gson.Gson;

@Service
public class CustomerAccountService {
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BCouponDAO bCouponDAO;
	@Autowired CPaymentDAO cPaymentDAO;
	@Autowired BSalesDAO bSalesDAO;
	@Autowired BDetailSalesDAO bDetailSalesDAO;
	@Autowired CPointDAO cPointDAO;
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BCustomerReviewDAO bCustomerReviewDAO;
	@Autowired BBusinessReviewDAO bBusinessReviewDAO;
	@Autowired AwsServiceImpl awsServiceImpl;
	@Autowired BEstablishmentDAO bEstablishmentDAO;
	
	
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
		
		// 충전 금액
		mav.addObject("myPoint", cPaymentVO.getPoint());
		// 충전내역
		List<CPointVO> pointlist = cPointDAO.selectAll(Login.getMemberid());
		mav.addObject("pointlist", pointlist);
		// -------------------------------------------------
		return mav;
	}
	
	// 주문 목록 [건욱]
	public ModelAndView orderList(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("customer/account/customerOrderList");
		CPrivateDataVO Login = ((CPrivateDataVO)req.getSession().getAttribute("cLogin"));
		
		//	주문 목록 페이지에 필요한 구매정보 데이터를 가져와줍니다
		List<OrderList> orderList = OrderListSetting.selectCustomer(Login.getMemberid());
		
		
		// OrderListSetting 클래스는 static으로 구성이되어 있다. [사업자 주문목록 / 고객 주문목록 ] 둘 다 사용 가능
		// setOrderList 함수는 orderList의 메인 메뉴, 서브메뉴, 메뉴들을 Tree구조로 중첩되지 않게 구성시켜즈는 역할을 한다.
		// orderList에 maincategory의 구조는 다음과 같다.
//		 		  메인                                            서브                       VO
//		HashMap<String, HashMap<String,List<BDetailSalesVO>>>
		mav.addObject("orderList", (new Gson()).toJson(orderList));
		return mav;
	}

	public ModelAndView newReview(HttpServletRequest req, MultipartHttpServletRequest mpf, ReviewList review) {
		ModelAndView mav = new ModelAndView("redirect:/customer/account/customerOrderList/");
		String memberid = ((CPrivateDataVO)req.getSession().getAttribute("cLogin")).getMemberid();
		review.setMemberid(memberid);
		
		int result = 0;
		// 1. BReview 생성 - memberid,estid,salecode,gpa
		result = bReviewDAO.insertNewReview(review);
		
		// 2. Review 이미지 올리기(aws)
		MultipartFile file = mpf.getFile("reviewimgbox");
		System.out.println("file : " + file.isEmpty());
		
		String estid = review.getEstid();
		
		if(!file.isEmpty()) {
			String folderName = "business/" + bEstablishmentDAO.selectBPersonID(estid) + "/" + estid;
			result = awsServiceImpl.fileUpload(file, folderName, review, -1);
		}
		
		// 2. BCustomerReview 생성 - memberid, estid, salecode, content
		result = bCustomerReviewDAO.insertNewReview(review);
		
		// 3. BBusinessReview 생성 - memberid, estid, salecode
		result = bBusinessReviewDAO.insertNewReview(review);
		
		return mav;
	}

}
