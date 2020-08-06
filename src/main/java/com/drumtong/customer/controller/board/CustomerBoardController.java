package com.drumtong.customer.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.service.board.CustomerBoardService;

@Controller
@RequestMapping("customer/board/")
public class CustomerBoardController {

	@Autowired CustomerBoardService svc;
	
	// 게시판1 이동
	@RequestMapping(value = "customerBoard1/", method = RequestMethod.GET)
	public ModelAndView boardOne() {
		return svc.boardOne();
	}
	// 게시판2 이동
	@RequestMapping(value = "customerBoard2/", method = RequestMethod.GET)
	public ModelAndView boardTwo() {
		return svc.boardTwo();
	}
}
