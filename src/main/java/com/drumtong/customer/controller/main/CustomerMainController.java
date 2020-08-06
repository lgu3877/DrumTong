package com.drumtong.customer.controller.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.service.main.CustomerMainService;


@Controller
@RequestMapping(value = {"/customer/", "/"})
public class CustomerMainController {
	
	@Autowired CustomerMainService svc;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView main() {
		return svc.main();
	}

	
}
