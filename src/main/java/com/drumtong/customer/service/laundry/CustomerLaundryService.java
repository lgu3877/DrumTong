package com.drumtong.customer.service.laundry;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BImageDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BMenuDAO;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.customer.dao.CBookmarkDAO;
import com.drumtong.customer.vo.CPrivateDataVO;

@Service
public class CustomerLaundryService {
	@Autowired BCouponDAO bCouponDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BMenuDAO bMenuDAO;
	@Autowired CBookmarkDAO cBookmarkDAO;
	@Autowired BImageDAO bImageDAO;
	
	// 검색 페이지 이동 [GET]
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("customer/laundry/customerSearch");
		return mav;
	}
	
	public ModelAndView detail(HttpServletRequest req, String estid) {
		if(estid == null) {
			return new ModelAndView("customer/");
		}
		ModelAndView mav = new ModelAndView("customer/laundry/customerDetail");
		
		// 상호명, 메인주소, 상세주소를 저장한 객체
		BInformationVO bInformationVO = bInformationDAO.selectCustomerDetail(estid);
		
		// 매장관리(소개글, 배달, 퀵여부)를 저장한 객체
		BManagementVO bManagementVO = bManagementDAO.selectCustomerDetail(estid);
		
		// ★★★★★★★★미완성★★★★★★★★★
		List<BImageVO> bImageVO = bImageDAO.selectImageList(estid);
		if(bImageVO != null) mav.addObject("bImageVO", bImageVO);
		
		// 쿠폰(할인가격, 기간, 최소금액, 중복가능여부) 객체를 유효기간에 해당하는 리스트만 불러왔음
		List<BCouponVO> bCouponVO = comparePeriod(bCouponDAO.select(estid));
		
		// 메뉴 정보(메뉴이름, 가격, 퀵 가격, 예상소요시간)를 저장한 객체(오름차순)
		List<BMenuVO> bMenuVO = bMenuDAO.select(estid);
		
		mav.addObject("bInformationVO", bInformationVO);
		mav.addObject("bManagementVO", bManagementVO);
		mav.addObject("bCouponVO", bCouponVO);
		mav.addObject("bMenuVO", bMenuVO);
		
		// 로그인 되어있을 때 쿠폰 정보, 북마크 체크 여부
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		if(Login != null) {
			// 1. map에 memberid, estid를 넣어준다
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberid", Login.getMemberid());
			map.put("estid", estid);
			
			// 고객이 가지고 있으면서 해당 사업장 쿠폰이고 사업장에 유효한(삭제X, 유효기간O) 쿠폰일 때
			List<BCouponVO> CouponList = comparePeriod(bCouponDAO.selectUsableCoupon(map));
			mav.addObject("CouponList", CouponList);
			
			mav.addObject("Bookmark", (cBookmarkDAO.isCheck(map) != null) ? "y" : "n");
		}
		
		return mav;
	}
	
	// 유효기간에 해당하는 쿠폰 리스트만 반환해준다.
	private List<BCouponVO> comparePeriod(List<BCouponVO> list) {
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		List<BCouponVO> UserCoupon = new ArrayList<BCouponVO>();
		for(BCouponVO vo : list) {
			String[] day = vo.getPeriod().split(" ~ ");
			// 오늘 날짜가 시작날짜보다 큰 값일 때 양수 || 오늘 날자가 끝날짜보다 작은 값일 때 음수 
			if(today.compareTo(day[0]) > 0 || today.compareTo(day[1])<0){
				UserCoupon.add(vo);
			}
		}
		return list;
	}

	// 검색어 입력[영경]
	public ModelAndView search(String searchWord) {
		ModelAndView mav = new ModelAndView("customer/laundry/customerSearch");
		mav.addObject("searchWord", searchWord);
		
//		HashMap<String, String> param = new HashMap<String, String>();
//		param.put("MainAddress", searchWord);
//		
//		param.put("premium", "no");
//		List<EstablishmentList> list = bInformationDAO.selectEstablishmentList(param);
//		mav.addObject("list", list);
//		
//		param.put("premium", "yes");
//		List<EstablishmentList> plist = bInformationDAO.selectEstablishmentList(param);
//		mav.addObject("plist", plist);
		
		return mav;
	}
	
}

