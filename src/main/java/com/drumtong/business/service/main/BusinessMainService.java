package com.drumtong.business.service.main;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

//import com.drumtong.business.dao.BusinessDAO;


@Service
public class BusinessMainService {
//	@Autowired BusinessDAO dao;
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("business/main/businessMain");
		return mav;
	}

//	@Transactional(timeout=5)
}
