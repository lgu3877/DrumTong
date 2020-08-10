package com.drumtong.customer.service.laundry;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class CustomerLaundryService {
	
	// 검색 페이지 이동 [GET]
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("customer/laundry/customerSearch");
		return mav;
	}

}
