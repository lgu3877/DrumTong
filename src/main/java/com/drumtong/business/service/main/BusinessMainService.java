package com.drumtong.business.service.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.AwsServiceImpl;

//import com.drumtong.business.dao.BusinessDAO;


@Service
public class BusinessMainService {
//	@Autowired BusinessDAO dao;
	@Autowired BInformationDAO bInformationDAO;		// 사업장 테이블
	@Autowired AwsServiceImpl aws;
	public ModelAndView main(HttpServletRequest req) {
		HttpSession Session = req.getSession();
		ModelAndView mav = new ModelAndView("business/main/businessMain");
		BPrivateDataVO User = ((BPrivateDataVO)Session.getAttribute("bLogin"));
		// 사업장 정보 들고오기

		return mav;
	}
	

	public ModelAndView mainCover() {
		ModelAndView mav = new ModelAndView("business/main/mainCover");
		return mav;
	}

//	@Transactional(timeout=5)
}
