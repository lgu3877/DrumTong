package com.drumtong.customer.controller.laundry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drumtong.customer.service.laundry.CustomerLaundryService;

@Controller
@RequestMapping("/laundry/")
public class CustomerLaundryController {

	@Autowired CustomerLaundryService svc;
	
}
