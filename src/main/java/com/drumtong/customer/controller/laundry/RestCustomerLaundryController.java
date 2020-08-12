package com.drumtong.customer.controller.laundry;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.customer.service.laundry.RestCustomerLaundryService;

@RestController
@RequestMapping("customer/laundry/")
public class RestCustomerLaundryController {
	
	@Autowired RestCustomerLaundryService svc;
	
	@RequestMapping("customerDetail/rest/addBookmark/")
	@PostMapping(produces="application/json; charset=utf8")
	public String setBookmark(@RequestBody HashMap<String, String> param) {
		return svc.setBookmark(param);
	}
}
