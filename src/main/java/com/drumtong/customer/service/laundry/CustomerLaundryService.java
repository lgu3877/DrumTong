package com.drumtong.customer.service.laundry;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BHitsDAO;
import com.drumtong.business.dao.BImageDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BMenuDAO;
import com.drumtong.business.dao.BScheduleDaysDAO;
import com.drumtong.business.dao.BScheduleTimeDAO;
import com.drumtong.business.dao.BTempSuspensionDAO;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.BScheduleDaysVO;
import com.drumtong.business.vo.BScheduleTimeVO;
import com.drumtong.business.vo.BTempSuspensionVO;
import com.drumtong.business.vo.MenuList;
import com.drumtong.business.vo.ReviewList;
import com.drumtong.customer.dao.CBookmarkDAO;
import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.GetIPAddress;
import com.drumtong.security.AddressListSetting;
import com.drumtong.security.MenuListSetting;
import com.drumtong.security.Review;
import com.google.gson.Gson;

@Service
public class CustomerLaundryService {
	@Autowired BCouponDAO bCouponDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BMenuDAO bMenuDAO;
	@Autowired CBookmarkDAO cBookmarkDAO;
	@Autowired BImageDAO bImageDAO;
	@Autowired CPaymentDAO cPaymentDAO;
	@Autowired BHitsDAO bHitsDAO;
	@Autowired BScheduleTimeDAO bScheduleTimeDAO;
	@Autowired BScheduleDaysDAO bScheduleDaysDAO;
	@Autowired BTempSuspensionDAO bTempSuspensionDAO;
	
	// 검색 페이지 이동 [GET]
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("customer/laundry/customerSearch");
		return mav;
	}
	
	public ModelAndView detail(HttpServletRequest req, String estid) {	// 추가해야할 부분 : cpayment
		if(estid == null) {
			return new ModelAndView("customer/");
		}
		
		// 조회수
		setHits(req, estid);
		
		ModelAndView mav = new ModelAndView("customer/laundry/customerDetail");
		
		// 기본 카테고리 데이터 	    
 	    List<String> defaultcategory = Arrays.asList((bManagementDAO.selectDefaultCategory(estid).split("/")));
		
		// 상호명, 메인주소, 상세주소를 저장한 객체
		BInformationVO bInformationVO = bInformationDAO.selectCustomerDetail(estid);
		
		// 매장관리(소개글, 배달, 퀵여부)를 저장한 객체
		BManagementVO bManagementVO = bManagementDAO.selectCustomerDetail(estid);
		
		// 매장 이미지 객체
		List<BImageVO> bImageVO = bImageDAO.selectImageList(estid);
		
		// 쿠폰(할인가격, 기간, 최소금액, 중복가능여부) 객체를 유효기간에 해당하는 리스트만 불러왔음
		List<BCouponVO> bCouponVO = bCouponDAO.select(estid);
		
		// 메뉴 정보(메뉴이름, 가격, 퀵 가격, 예상소요시간)를 저장한 객체
		MenuList menuList = MenuListSetting.selectMenuList(estid);
		
		// 리뷰
		List<ReviewList> ReviewList = Review.selectList(estid, "whole");
		
		// 선택한 지역 데이터 리스트 
		HashMap<String, HashMap<String , ArrayList<String>>> deliveryAreas = AddressListSetting.getAddressList(estid);
    	
		// 매장 영업 시간
		BScheduleTimeVO bscheduletime =  bScheduleTimeDAO.selectBScheduleTime(estid);
		
		// 매장 영업 일정
		BScheduleDaysVO bscheduledays =  bScheduleDaysDAO.selectBScheduleDays(estid);
		
		// 매장 임시 휴무
		List<BTempSuspensionVO> btempsuspension = bTempSuspensionDAO.selectBTempSuspension(estid);
		
		// 추가 작업할 일 정리(영경)
		// 영업 시간 가지고 와야함, 매장 주소 => 가져옴  내가 이건욱 ㅋㅋㅋ
		
		Gson gson = new Gson();
		mav.addObject("defaultcategory", gson.toJson(defaultcategory));
		mav.addObject("bInformationVO", bInformationVO);
		mav.addObject("bManagementVO", bManagementVO);
		if(bImageVO != null) mav.addObject("bImageVO", gson.toJson(bImageVO));
		mav.addObject("bCouponVO", gson.toJson(bCouponVO));
		mav.addObject("menuList", gson.toJson(menuList));
		mav.addObject("ReviewList", gson.toJson(ReviewList));
		mav.addObject("deliveryAreas", (gson.toJson(deliveryAreas)));
		mav.addObject("bscheduletime", gson.toJson(bscheduletime));
		mav.addObject("bscheduledays", gson.toJson(bscheduledays));
		mav.addObject("btempsuspension", gson.toJson(btempsuspension));
		
		
		
		// 로그인 되어있을 때 쿠폰 정보, 북마크 체크 여부
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		if(Login != null) {
			// 1. map에 memberid, estid를 넣어준다
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberid", Login.getMemberid());
			map.put("estid", estid);
			
			// 고객이 가지고 있으면서 해당 사업장 쿠폰이고 사업장에 유효한(삭제X, 유효기간O) 쿠폰일 때
			List<BCouponVO> CouponList = bCouponDAO.selectUsableCoupon(map);
			mav.addObject("CouponList", new Gson().toJson(CouponList));
			
			// 고객 포인트 정보
			int myPoint = cPaymentDAO.select(Login.getMemberid()).getPoint();
			mav.addObject("myPoint", myPoint);
			
			mav.addObject("Bookmark", (cBookmarkDAO.isCheck(map) != null) ? "y" : "n");
		} else {
			mav.addObject("CouponList", "n");
		}
		
		return mav;
	}
	
	private void setHits(HttpServletRequest req, String estid) {
		// ip를 가져와서
		String yourIP = GetIPAddress.getIP(req);
		System.out.println("yourIP : " + yourIP);
		// ip, estid, 오늘날짜와 일치하는 데이터가 있는지 조회
		
		// 결과가 있으면 조회수를 올리지 않고 return
		// 결과가 없으면 insert로 추가 후 bmanagement의 hits 필드 1 증가시키기
	}

	// 검색어 입력[영경]
	public ModelAndView search(String searchWord, String level) {
		ModelAndView mav = new ModelAndView("customer/laundry/customerSearch");
		mav.addObject("searchWord", searchWord);
		mav.addObject("level", level);
		
		return mav;
	}
	
}

