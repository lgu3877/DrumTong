package com.drumtong.business.service.submanagement;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BBusinessReviewDAO;
import com.drumtong.business.dao.BCustomerReviewDAO;
import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.ReviewList;
import com.google.gson.Gson;

@Service
public class BusinessSubManagementService {
	@Autowired BReviewDAO bReviewDAO;
	@Autowired BCustomerReviewDAO bCustomerReviewDAO;
	@Autowired BBusinessReviewDAO bBusinessReviewDAO;

	// 비즈니스 리뷰관리 페이지로 이동 (GET) [영경]
	public ModelAndView reviewManagement(HttpServletRequest req, String pageKind, String pageNum) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		
		// ===================================================================================
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = bInformationVO.getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		// ===================================================================================
		
		String estid = bInformationVO.getEstid();
		
		
		pageKind = pageKind == null ? "whole" : pageKind;				// 페이지 종류에 대한 정보가 없으면 "whole"
		
		
		
		int page = pageNum == null ? 1 : Integer.parseInt(pageNum);		// 페이지에 대한 정보가 없으면 1 페이지
		int gap = 5;													//한  페이지 당 보여주는 리뷰 개수
		
		int start = gap * (page - 1) + 1;
		int end = start + gap - 1;
		
		
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessReviewManagement");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", start + "");
		map.put("end", end + "");
		map.put("estid", estid);
		
		
		
		switch(pageKind) {
		case "whole":	// 전체 페이지 수, 페이지 별 리스트
			map.put("division", "whole");
			mav.addObject("Name", "전체 리뷰");
			break;
		case "noReply": // 미답변 페이지 수, 페이지 별 리스트
			map.put("division", "noReply");
			mav.addObject("Name", "미답변 리뷰");
			break;
		case "reportReply": // 신고한리뷰 페이지 수, 페이지 별 리스트
			map.put("division", "reportReply");	//	10개 이상일 때 신고로 이동
			mav.addObject("Name", "신고 리뷰");
			break;
		}
		
		// 전체 페이지 수
		int wholePageNum = bReviewDAO.selectReviewNum(map);
		
		// 페이지 번호, estid
		// 현재 승원씨 테스트를 위해 페이징은 기능은 제외해둠
		List<ReviewList> bReviewList = bReviewDAO.selectReview(map);
		
		mav.addObject("wholePageNum", wholePageNum);
		
		// 컨트롤러에서 jsp 로 JSON 넘기기 - GSON
		Gson gson = new Gson();
		String json = gson.toJson(bReviewList);
		mav.addObject("bReviewList", json);
		
		return mav;
	}


	// 비즈니스 쿠폰관리 페이지로 이동 (GET) [건욱]
	public ModelAndView couponManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessReviewManagement");
		return mav;
	}


	// 비즈니스 카드계좌관리 페이지로 이동 (GET) [건욱]
	public ModelAndView cardAccountManagement(HttpServletRequest req) {		// Status 계약 여부 필드를 세션을 받아와준다.

		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessCardAccountManagement");
		return mav;
	}



	// 비즈니스 통계관리 페이지로 이동 (GET) [건욱]
	public ModelAndView statisticsManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessStatisticsManagement");
		return mav;
	}


	// 비즈니스 주문현황 관리 페이지로 이동 (GET) [건욱]
	public ModelAndView orderStatusManagement(HttpServletRequest req) {
		
		// Status 계약 여부 필드를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getStatus();
		// boolean의 결과 값에 따라 'FAIL'이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시켜준다.
		if(bol.equals("FAIL"))
			return new ModelAndView("redirect:/business/");
		
		ModelAndView mav = new ModelAndView("business/submanagement/businessOrderStatusManagement");
		return mav;
	}

	
}
