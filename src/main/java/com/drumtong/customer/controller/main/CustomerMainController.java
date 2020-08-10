package com.drumtong.customer.controller.main;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = {"/customer/", "/"})
public class CustomerMainController {
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String main() {
		return "customer/main/customerMain";
	}

	
}
