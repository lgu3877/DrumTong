package com.drumtong.customer.service.main;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.system.dao.SCustomerBoard1DAO;
import com.drumtong.system.dao.SCustomerBoard2DAO;


@Service
public class CustomerMainService {

	@Autowired SCustomerBoard1DAO sCustomerBoard1DAO;
	@Autowired SCustomerBoard2DAO sCustomerBoard2DAO;
	
	
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("customer/main/customerMain");
		// 관리자가 출력할 게시판 개수 - 1    ex) 5개를 출력할거면 4개를 입력
		int NumberOfData = 4;
		
		// 공지사항 리스트를 5개를 넣어줌.
		mav.addObject("boardRecentList", sCustomerBoard1DAO.selectRecentData1(NumberOfData));


		// 이벤트 게시판 리스트를 5개를 넣어줌.
		mav.addObject("eventRecentList", sCustomerBoard2DAO.selectRecentData2(NumberOfData));
		
		
		// 당일 날짜 구함.
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date date = new Date();
		String todayDate = format1.format(date);
		mav.addObject("todayDate", todayDate);
		
		
		return mav;
	}
	
	//@Transactional(timeout=5)
}
