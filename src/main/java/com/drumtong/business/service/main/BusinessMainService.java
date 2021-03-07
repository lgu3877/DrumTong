package com.drumtong.business.service.main;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BHitsDAO;
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.security.AwsServiceImpl;

@Service
public class BusinessMainService {
	@Autowired AwsServiceImpl aws;
	@Autowired BHitsDAO bHitsDAO;
	@Autowired BSalesDAO bSalesDAO;
	
	// 비즈니스 메인 페이지로 이동 (GET) [영경]
	public ModelAndView main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("business/main/businessMain");
		HttpSession Session = req.getSession();
		
		mav.addObject("ModalCheck", Session.getAttribute("ModalCheck"));
		Session.removeAttribute("ModalCheck");
		
		BInformationVO selectEST = (BInformationVO)Session.getAttribute("selectEST");
		// 로그인 되어있고 등록된 매장까지 있을 경우 매장의 프리뷰를 보여준다.
		if(Session.getAttribute("bLogin") != null && selectEST != null && "SUCCESS".equals(selectEST.getStatus())) {
			String estid = selectEST.getEstid();
			// 방문량(오늘, 이번주, 이번달)
			HashMap<String, Integer> HitsMap = bHitsDAO.getMainPreviewHits(estid);
			mav.addObject("HitsMap", HitsMap);
			
			// 주문현황(요청, 처리중, 완료)
			HashMap<String, Integer> OrderMap = bSalesDAO.getMainPreviewOrder(estid);
			mav.addObject("OrderMap", OrderMap);
			
			// 가게매출(오늘, 이번주, 이번달)
			HashMap<String, Integer> PriceMap = bSalesDAO.getMainPreviewPrice(estid);
			mav.addObject("PriceMap", PriceMap);
			
			// 세탁물판매(오늘, 이번주, 이번달)
			HashMap<String, Integer> LaundryMap = bSalesDAO.getMainPreviewLaundry(estid);
			mav.addObject("LaundryMap", LaundryMap);
			
		}
		return mav;
	}

	public ModelAndView mainCover() {
		ModelAndView mav = new ModelAndView("business/main/mainCover");
		return mav;
	}

	// 비즈니스 메뉴얼 페이지로 이동 (GET) [건욱]
	public ModelAndView businessIntroduceService(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("business/main/businessIntroduceService");
		return mav;
	}

	// 비즈니스 서비스 소개 페이지로 이동 (GET) [건욱]
	public ModelAndView businessManual(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("business/main/businessManual");
		return mav;
	}

	// 비즈니스 1차 메뉴얼 페이지로 이동 (GET) [건욱]
	public ModelAndView businessSelectManual(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("business/main/businessSelectManual");
		return mav;
	}
	
	

//	@Transactional(timeout=5)
}
