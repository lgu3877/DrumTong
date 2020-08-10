package com.drumtong.customer.service.laundry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BMenuDAO;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;

@Service
public class CustomerLaundryService {
	@Autowired BCouponDAO bCouponDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BMenuDAO bMenuDAO;
	
	// 검색 페이지 이동 [GET]
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("customer/laundry/customerSearch");
		return mav;
	}
	
	public ModelAndView detail(String estid) {
		// estid가 널 값일 때 처리해주기
		ModelAndView mav = new ModelAndView("customer/laundry/customerDetail");
		BInformationVO bInformationVO = bInformationDAO.selectCustomerDetail(estid);
		BManagementVO bManagementVO = bManagementDAO.selectCustomerDetail(estid);
		BCouponVO bCouponVO = bCouponDAO.select(estid);
		List<BMenuVO> bMenuVO = bMenuDAO.select(estid);
		
		mav.addObject("bInformationVO", bInformationVO);
		mav.addObject("bManagementVO", bManagementVO);
		mav.addObject("bCouponVO", bCouponVO);
		mav.addObject("bMenuVO", bMenuVO);
		
		return mav;
	}
	
}

