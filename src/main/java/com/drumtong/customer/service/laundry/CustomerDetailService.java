package com.drumtong.customer.service.laundry;

import java.util.ArrayList;
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
public class CustomerDetailService {
	@Autowired BCouponDAO bCouponDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BMenuDAO bMenuDAO;
	
	public ModelAndView detail(String estid) {
		ModelAndView mav = new ModelAndView("customer/laundry/customerDetail/detailPage");
		BInformationVO bInformationVO = bInformationDAO.selectCustomerDetail(estid);
		BManagementVO bManagementVO = bManagementDAO.selectCustomerDetail(estid);
		BCouponVO bCouponVO = bCouponDAO.select(estid);
		List<BMenuVO> bMenuVO = bMenuDAO.select(estid);
		
		mav.addObject("bInformationVO", bInformationVO);
		mav.addObject("bManagementVO", bManagementVO);
		mav.addObject("bCouponVO", bCouponVO);
		mav.addObject("bMenuVO", bMenuVO);
		
//		System.out.println("테스트1) 사업장이름 확인 : " + bInformationVO.getBrandnaming());
//		System.out.println("테스트2) 매장관리 소개글 : " + bManagementVO.getIntroduction());
//		System.out.println("테스트3) 쿠폰 할인 가격 :" + bCouponVO.getDiscount());
//		System.out.println("테스트4) 메뉴 갯수 : " + bMenuVO.size());
		return mav;
	}
	
}
