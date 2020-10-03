package com.drumtong.business.service.mainmanagement;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service
public class BusinessMainManagementService {

	// 비즈니스 매장관리 페이지로 이동 (GET) [건욱]
	public ModelAndView shopManagement() {
		ModelAndView mav = new ModelAndView("business/mainmanagement/businessShopManagement");
		return mav;
	}

	
	
	// 비즈니스 일정관리 페이지로 이동 (GET) [건욱]
	public ModelAndView scheduleManagement() {
		ModelAndView mav = new ModelAndView("business/mainmanagement/businessScheduleManagement");
		return mav;
	}

	
}
