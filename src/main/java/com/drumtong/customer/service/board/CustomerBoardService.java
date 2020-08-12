package com.drumtong.customer.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


@Service
public class CustomerBoardService {
	
	
	
	// 공지사항1 이동 [GET]
	public ModelAndView boardOne() {
		ModelAndView mav = new ModelAndView("customer/board/board1");
		return mav;
	}
	// 공지사항2 이동 [GET]
	public ModelAndView boardTwo() {
		ModelAndView mav = new ModelAndView("customer/board/board2");
		return mav;
	}
	


}
