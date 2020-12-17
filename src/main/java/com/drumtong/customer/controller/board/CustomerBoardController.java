package com.drumtong.customer.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import org.springframework.web.servlet.ModelAndView;


import com.drumtong.customer.service.board.CustomerBoardService;

@Controller
@RequestMapping("customer/board/")
public class CustomerBoardController {

	@Autowired CustomerBoardService svc;
	
	// 게시판1 이동
	@RequestMapping(value = "customerBoard1/{page}/", method = RequestMethod.GET)
	public ModelAndView boardOneMove(HttpServletRequest req, @PathVariable("page")String page) {
		req.getSession().setAttribute("page", page);
		return new ModelAndView("redirect:/customer/board/customerBoard1/");
	}
	
	// 게시판1 이동
	@RequestMapping(value = "customerBoard1/", method = RequestMethod.GET)
	public ModelAndView boardOne(HttpServletRequest req) {
		HttpSession Session = req.getSession();
		String page = (String)Session.getAttribute("page");
		Session.removeAttribute("page");
		return svc.boardOne(page);
	}
	
	// 게시판2 이동
	@RequestMapping(value = "customerBoard2/", method = RequestMethod.GET)
	public ModelAndView boardTwo() {
		return svc.boardTwo();
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
