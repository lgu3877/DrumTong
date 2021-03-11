package com.drumtong.customer.controller.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.customer.service.main.RestCustomerMainService;

@RestController
@RequestMapping("custmer/main/")
public class RestCustomerMainController {
	
	@Autowired RestCustomerMainService svc;
	
	@RequestMapping("customerMain/rest/searchAutoComplete/{param}/")
	@GetMapping(produces="application/json; charset=utf8")
	public String searchAutoComplete(@PathVariable("param")String searchWord) {
		return svc.searchAutoComplete(searchWord);
	}
}
