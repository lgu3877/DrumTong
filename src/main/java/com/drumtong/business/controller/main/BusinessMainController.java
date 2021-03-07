package com.drumtong.business.controller.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.service.main.BusinessMainService;

@Controller
@RequestMapping(value = "business/")
public class BusinessMainController {
	
	@Autowired BusinessMainService svc;
	@Autowired BInformationDAO binformationdao;
	
	// 비즈니스 메인 페이지로 이동 (GET) [영경]
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView home(HttpServletRequest req) {
		return svc.main(req);
	}
	
	// 테스트용-이영경
//	@RequestMapping(value = "", method = RequestMethod.GET)
//	public ModelAndView home(HttpServletRequest req) {
//		return svc.main(req);
//	}
	
	@RequestMapping(value = "selectEST/{selectEST}/", method = RequestMethod.GET)
	public ModelAndView selectEstMain(HttpServletRequest req, @PathVariable("selectEST")String selectEST) {
		req.getSession().setAttribute("selectEST", binformationdao.selectEst(selectEST));
		return new ModelAndView("redirect:/business/");
	}

	@RequestMapping(value = "mainCover/", method = RequestMethod.GET)
	public ModelAndView mainCover() {
		return svc.mainCover();
	}
	
	// 비즈니스 서비스 소개 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessIntroduceService/", method = RequestMethod.GET)
	public ModelAndView businessIntroduceService(HttpServletRequest req) {
		return svc.businessIntroduceService(req);
	}
	
	// 비즈니스 메뉴얼 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessManual/", method = RequestMethod.GET)
	public ModelAndView businessManual(HttpServletRequest req) {
		return svc.businessManual(req);
	}
	
	// 비즈니스 1차 메뉴얼 페이지로 이동 (GET) [건욱]
	@RequestMapping(value = "businessSelectManual/", method = RequestMethod.GET)
	public ModelAndView businessSelectManual(HttpServletRequest req) {
		return svc.businessSelectManual(req);
	}

}
