package com.laundry.customer.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.laundry.customer.service.CustomerService;


@Controller
@RequestMapping("/customer/")
public class CustomerController {
	
	@Autowired CustomerService svc;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView home() {
		return svc.test();
	}
	
}
