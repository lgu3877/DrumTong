package com.laundry.customer.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.laundry.customer.dao.CustomerDAO;

@Service
public class CustomerService {
	@Autowired CustomerDAO dao;
	
	public ModelAndView test() {
		ModelAndView mv = new ModelAndView("customer/customerMain");
		mv.addObject("test",dao.test());
		return mv;
	}
	
	
	//@Transactional(timeout=5)
}
