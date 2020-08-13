package com.drumtong.customer.controller.laundry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.service.laundry.CustomerLaundryService;

@Controller
@RequestMapping("customer/laundry/")
public class CustomerLaundryController {

	@Autowired CustomerLaundryService svc;
	
	
	// 검색 페이지 이동 [GET]
	@RequestMapping("customerSearch/")
	public ModelAndView search(HttpServletRequest req) {	
		return svc.search();
	}
}
