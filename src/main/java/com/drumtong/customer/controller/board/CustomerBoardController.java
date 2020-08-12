package com.drumtong.customer.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.drumtong.customer.service.board.CustomerBoardService;

@Controller
@RequestMapping("customer/board/")
public class CustomerBoardController {

	@Autowired CustomerBoardService svc;
	
	@RequestMapping(value = "customerBoard/", method = RequestMethod.GET)
	public String board() {
		return "customer/board/customerBoard";
	}
	
	
	@RequestMapping(value = "customerBoardRead/", method = RequestMethod.GET)
	public String read() {
		return "customer/board/customerBoardRead";
	}
		
	@RequestMapping(value = "customerBoardWrite/", method = RequestMethod.GET)
	public String write() {
		return "customer/board/customerBoardWrite";	
	}
}
