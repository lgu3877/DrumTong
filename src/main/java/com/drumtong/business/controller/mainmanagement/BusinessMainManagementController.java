package com.drumtong.business.controller.mainmanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.mainmanagement.BusinessMainManagementService;

@Controller
@RequestMapping("business/mainmanagement/")
public class BusinessMainManagementController {

	@Autowired BusinessMainManagementService svc;
	
	// 비즈니스 매장관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessShopManagement/", method = RequestMethod.GET)
	public ModelAndView shopManagement() {
		return svc.shopManagement();
	}
	
	// 비즈니스 일정관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessScheduleManagement/", method = RequestMethod.GET)
	public ModelAndView scheduleManagement() {
		return svc.scheduleManagement();
	}	
	
	
	
}
