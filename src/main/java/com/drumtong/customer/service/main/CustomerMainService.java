package com.drumtong.customer.service.main;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


@Service
public class CustomerMainService {
//	@Autowired CustomerDAO dao;
	
	public ModelAndView test() {
		return new ModelAndView("customer/main/customerMain");
	}
	
	//@Transactional(timeout=5)
}
