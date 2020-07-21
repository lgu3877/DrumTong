package com.drumtong.customer.controller.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.drumtong.customer.service.account.CustomerAccountService;

@Controller
@RequestMapping("/account/")
public class CustomerAccountController {

	@Autowired CustomerAccountService svc;
}
