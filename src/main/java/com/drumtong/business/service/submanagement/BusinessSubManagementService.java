package com.drumtong.business.service.submanagement;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.vo.BInformationVO;

@Service
public class BusinessSubManagementService {


	// 비즈니스 리뷰관리 페이지로 이동 (GET) [건욱]
	public ModelAndView reviewManagement(HttpServletRequest req) {

		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();

		// boolean의 결과 값에 따라 'SUCCESS'이면 business로 우회해주고 'FAIL'이면 서브관리 페이지들로 이동시켜준다.
		String route = bol.equals("SUCCESS") ? "redirect:/business/" : "business/submanagement/businessReviewManagement"; 

		
		ModelAndView mav = new ModelAndView(route);
		return mav;
	}


	// 비즈니스 쿠폰관리 페이지로 이동 (GET) [건욱]
	public ModelAndView couponManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();

		// boolean의 결과 값에 따라 'SUCCESS'이면 business로 우회해주고 'FAIL'이면 서브관리 페이지들로 이동시켜준다.
		String route = bol.equals("SUCCESS") ? "redirect:/business/" : "business/submanagement/businessReviewManagement"; 

		
		ModelAndView mav = new ModelAndView(route);
		return mav;
	}


	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	public ModelAndView cardAccountManagement(HttpServletRequest req) {		// Status 계약 여부 필드를 세션을 받아와준다.

		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();

		// boolean의 결과 값에 따라 'SUCCESS'이면 business로 우회해주고 'FAIL'이면 서브관리 페이지들로 이동시켜준다.
		String route = bol.equals("SUCCESS") ? "redirect:/business/" : "business/submanagement/businessCardAccountManagement"; 

		
		ModelAndView mav = new ModelAndView(route);
		return mav;
	}



	// 비즈니스 통계관리 페이지로 이동 (GET) [건욱]
	public ModelAndView statisticsManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();

		// boolean의 결과 값에 따라 'SUCCESS'이면 business로 우회해주고 'FAIL'이면 서브관리 페이지들로 이동시켜준다.
		String route = bol.equals("SUCCESS") ? "redirect:/business/" : "business/submanagement/businessStatisticsManagement"; 

		
		ModelAndView mav = new ModelAndView(route);
		return mav;
	}


	// 비즈니스 주문현황 관리 페이지로 이동 (GET) [건욱]
	public ModelAndView orderStatusManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();

		// boolean의 결과 값에 따라 'SUCCESS'이면 business로 우회해주고 'FAIL'이면 서브관리 페이지들로 이동시켜준다.
		String route = bol.equals("SUCCESS") ? "redirect:/business/" : "business/submanagement/businessOrderStatusManagement"; 

		
		ModelAndView mav = new ModelAndView(route);
		return mav;
	}

	
}
