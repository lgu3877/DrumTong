package com.drumtong.customer.controller.laundry;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.service.laundry.CustomerDetailService;

@Controller
@RequestMapping("customer/laundry/")
public class CustomerDetailController {
	@Autowired CustomerDetailService svc;
	
	@RequestMapping(value="customerDetail/{estid}/",method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable("estid") String estid, HttpServletRequest req) {
		System.out.println("테스트");
		req.getSession().setAttribute("estid", estid);
		return new ModelAndView("redirect:/customer/laundry/customerDetail/detail/");
	}
	
	@RequestMapping("customerDetail/detail/")
	public ModelAndView detail2(HttpServletRequest req) {	
		return svc.detail((String)req.getSession().getAttribute("estid"));
	}
}
