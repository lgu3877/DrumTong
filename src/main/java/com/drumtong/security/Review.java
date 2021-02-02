package com.drumtong.security;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BReviewDAO;
import com.drumtong.business.vo.ReviewList;
import com.google.gson.Gson;

@Component
public class Review {
	
	@Autowired BReviewDAO beanbReviewDAO;
	
	static BReviewDAO bReviewDAO;
	
	@PostConstruct
	public void init() {
		bReviewDAO = beanbReviewDAO;
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
		return bReviewDAO.selectReview(map);
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
