package com.drumtong.business.controller.mainmanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.service.mainmanagement.BusinessMainManagementService;
import com.drumtong.business.vo.BDeliveryAreaVO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.BScheduleDaysVO;
import com.drumtong.business.vo.BScheduleTimeVO;
import com.drumtong.business.vo.BTempHolidayVO;
import com.drumtong.business.vo.BTempSuspensionVO;

@Controller
@RequestMapping("business/mainmanagement/")
public class BusinessMainManagementController {

	@Autowired BusinessMainManagementService svc;
	
	// 비즈니스 매장관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessShopManagement/", method = RequestMethod.GET)
	public ModelAndView shopManagement() {
		return svc.shopManagement();
	}
	
	// 비즈니스 온라인계약 {신규매장관리} 데이터 등록  (POST) [건욱]
	// AWS S3에 다중 이미지 업로드를 해줍니다.
	@RequestMapping(value="businessShopManagement/", method = RequestMethod.POST)
	public ModelAndView shopManagement(MultipartHttpServletRequest mpf,BManagementVO bManagementVO,
									   BImageVO bImageVO, BMenuVO bMenuVO,
									   BDeliveryAreaVO bDeliveryAreaVO) {
		return svc.shopManagement(mpf,bManagementVO, bImageVO, bMenuVO, bDeliveryAreaVO);
	}
	
	
	
	
	
	
	
	// 비즈니스 일정관리 페이지로 이동 (GET) [건욱]
	@RequestMapping(value="businessScheduleManagement/", method = RequestMethod.GET)
	public ModelAndView scheduleManagement() {
		return svc.scheduleManagement();
	}

	
	// 비즈니스 온라인계약 {신규일정관리} 데이터 등록 (POST) [건욱]
	@RequestMapping(value="businessScheduleManagement/", method = RequestMethod.POST)
	public ModelAndView scheduleManagement(BScheduleDaysVO bScheduleDaysVO, BScheduleTimeVO bScheduleTimeVO,
										   BTempHolidayVO bTempHolidayVO, BTempSuspensionVO bTempSuspensionVO){
		return svc.scheduleManagement(bScheduleDaysVO, bScheduleTimeVO, bTempHolidayVO, bTempSuspensionVO);
	}
	
	
	
	
	
	
}


