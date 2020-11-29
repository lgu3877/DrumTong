package com.drumtong.business.service.main;

import java.util.Arrays;
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

//import com.drumtong.business.dao.BusinessDAO;


@Service
public class BusinessMainService {
//	@Autowired BusinessDAO dao;
	@Autowired AwsServiceImpl aws;
	@Autowired BHitsDAO bHitsDAO;
	@Autowired BSalesDAO bSalesDAO;
	
	// 비즈니스 메인 페이지로 이동 (GET) [영경]
	public ModelAndView main(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("business/main/businessMain");
		HttpSession Session = req.getSession();
		
		BInformationVO selectEST = (BInformationVO)Session.getAttribute("selectEST");
		// 로그인 되어있고 등록된 매장까지 있을 경우
		System.out.println("1 test");
		if(Session.getAttribute("bLogin") != null && selectEST != null && "SUCCESS".equals(selectEST.getStatus())) {
			System.out.println("로그인 되어있고 매장 등록이 완료된 상태일 때");
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
		}
		System.out.println("2 test");
			// 매장이 등록 완료되어있는지도 체크하기
		// 매장의 프리뷰를 보여준다.
		return mav;
	}
	
	// 테스트용-이영경
//	public ModelAndView main(HttpServletRequest req) {
//		ModelAndView mav = new ModelAndView("business/main/businessMain");
//		String Referer = req.getHeader("REFERER");
//		String uri = req.getRequestURI();
//		
//		mav.addObject("Referer", Referer);
//		mav.addObject("uri", uri);
//		return mav;
//	}

	public ModelAndView mainCover() {
		ModelAndView mav = new ModelAndView("business/main/mainCover");
		return mav;
	}

//	@Transactional(timeout=5)
}
