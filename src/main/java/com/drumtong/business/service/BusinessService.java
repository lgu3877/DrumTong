package com.drumtong.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BusinessDAO;



@Service
public class BusinessService {
	@Autowired BusinessDAO dao;
	
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView("business/businessMain");
		mv.addObject("test",dao.test());
		return mv;
	}
	
//	@Transactional(timeout=5)
}
