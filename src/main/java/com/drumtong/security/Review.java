package com.drumtong.security;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.dao.BSalesDAO;
import com.drumtong.business.vo.ReviewList;
import com.google.gson.Gson;

@Component
public class Review {
	
	@Autowired BReviewDAO beanbReviewDAO;
	@Autowired BSalesDAO beanBSalesDAO;
	
	static BReviewDAO bReviewDAO;
	static BSalesDAO bSalesDAO;
	
	@PostConstruct
	public void init() {
		bReviewDAO = beanbReviewDAO;
		bSalesDAO = beanBSalesDAO;
	}

	public static void reviewForBusiness(ModelAndView mav, String estid, String pageKind) {
		pageKind = pageKind == null ? "whole" : pageKind;				// 페이지 종류에 대한 정보가 없으면 "whole"
		List<ReviewList> bReviewList = selectList(estid, pageKind);
		
		
		
		// 컨트롤러에서 jsp 로 JSON 넘기기 - GSON
		Gson gson = new Gson();
		String json = gson.toJson(bReviewList);
		mav.addObject("bReviewList", json);
		
		mav.addObject("pageKind", pageKind);
	}

	public static List<ReviewList> selectList(String estid, String pageKind) {
		HashMap<String, String> map = new HashMap<String, String>();

		
		map.put("estid", estid);
		switch(pageKind) {
		case "whole":	// 전체 페이지 수
			map.put("division", "whole");
			break;
		case "noReply": // 미답변 페이지 수
			map.put("division", "noReply");
			break;
		case "reportReply": // 신고한리뷰 페이지 수
			map.put("division", "reportReply");	//	10개 이상일 때 신고로 이동
			break;
		}
//		System.out.println("pageKind : " + pageKind);
		
		List<ReviewList> firstResult = bReviewDAO.selectReview(map);
		
		return countVisits(estid, firstResult);
	}
	
	private static List<ReviewList> countVisits(String estid, List<ReviewList> firstResult) {
		for(int i = 0; i < firstResult.size(); i++) {
			ReviewList li = firstResult.get(i);
			HashMap<String, String> paramVisit = new HashMap<String, String>();
			paramVisit.put("estid", estid);
			paramVisit.put("memberid", li.getMemberid());
			paramVisit.put("salecode", li.getSalecode());
			
			int visits = bSalesDAO.visits(paramVisit);
			li.setVisits(visits);
			
			String orderListMsg = settingMSG(li.getAmount(), li.getOrderList());
			li.setOrderListMsg(orderListMsg);
		}
		return firstResult;
	}

	private static String settingMSG(int amount, String orderList) {
		String[] tmpList = orderList.split(",");
		int tmpCount = tmpList.length;
		String result = tmpList[0] + (tmpCount == 1 ? "" : " 외 " + (tmpCount - 1) + "종류");
		result += "(총 " + amount + "벌)";
		return result;
	}

	public static HashMap<String, Integer> pageList(String estid){
		HashMap<String, String> map = new HashMap<String, String>();
		HashMap<String, Integer> result = new HashMap<String, Integer>();
		map.put("estid", estid);
		
		map.put("division", "whole");
		int wholeNum = bReviewDAO.selectReviewNum(map);
		result.put("wholeNum", wholeNum);
		
		map.put("division", "noReply");
		int noReplyNum = bReviewDAO.selectReviewNum(map);
		result.put("noReplyNum", noReplyNum);
		
		map.put("division", "reportReply");	
		int reportReplyNum = bReviewDAO.selectReviewNum(map);
		result.put("reportReplyNum", reportReplyNum);
		
		return result;
	}

}
