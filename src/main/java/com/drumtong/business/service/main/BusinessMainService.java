package com.drumtong.business.service.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.security.AwsServiceImpl;

//import com.drumtong.business.dao.BusinessDAO;


@Service
public class BusinessMainService {
//	@Autowired BusinessDAO dao;
	@Autowired AwsServiceImpl aws;
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("business/main/businessMain");
		
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
