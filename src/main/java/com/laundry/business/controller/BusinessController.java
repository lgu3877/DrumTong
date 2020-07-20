package com.laundry.business.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.laundry.business.service.BusinessService;

@Controller
@RequestMapping("/business/")
public class BusinessController {
	
	@Autowired BusinessService svc;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		return svc.test();
	}
	
}
