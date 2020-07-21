package com.drumtong.customer.service.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.dao.CustomerDAO;

@Service
public class CustomerMainService {
	@Autowired CustomerDAO dao;
	
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView("customer/main/customerMain");
		mv.addObject("test",dao.test());
		return mv;
	}
	
	
	//@Transactional(timeout=5)
}
