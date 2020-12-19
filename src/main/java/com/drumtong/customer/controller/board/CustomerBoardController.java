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
	
	// 게시판 이동(type : notice, event)
	@RequestMapping(value = "customerBoard/{type}/{page}/", method = RequestMethod.GET)
	public ModelAndView boardMove(HttpServletRequest req, @PathVariable("type")String type, 
								@PathVariable("page")String page) {
		req.getSession().setAttribute("page", page);
		return new ModelAndView("redirect:/customer/board/customerBoard/" + type + "/");
	}
	
	// 게시판 이동
	@RequestMapping(value = "customerBoard/{type}/", method = RequestMethod.GET)
	public ModelAndView board(HttpServletRequest req, @PathVariable("type")String type) {
		HttpSession Session = req.getSession();
		String page = (String)Session.getAttribute("page");
		Session.removeAttribute("page");
		return svc.board(page, type);
	}
	
	@RequestMapping(value = "customerBoardRead/{type}/{num}/", method = RequestMethod.GET)
	public ModelAndView read(HttpServletRequest req, @PathVariable("type")String type, @PathVariable("num")int num) {
		req.getSession().setAttribute("num", num);
		return new ModelAndView("redirect:/customer/board/customerBoardRead/" + type + "/");
	}
	
	@RequestMapping(value = "customerBoardRead/{type}/", method = RequestMethod.GET)
	public ModelAndView read(HttpServletRequest req, @PathVariable("type")String type) {
		HttpSession Session = req.getSession();
		int num = (int)Session.getAttribute("num");
		Session.removeAttribute("num");
		return svc.read(type, num);
	}
		
	@RequestMapping(value = "customerBoardWrite/", method = RequestMethod.GET)
	public String write() {
		return "customer/board/customerBoardWrite";	
	}

}
