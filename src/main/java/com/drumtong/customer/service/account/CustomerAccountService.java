package com.drumtong.customer.service.account;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.vo.CPrivateDataVO;

@Service
public class CustomerAccountService {
	@Autowired BInformationDAO bInformationDAO;
	
	public ModelAndView bookmark(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("customer/account/customerBookmark");
		CPrivateDataVO Login = ((CPrivateDataVO)req.getSession().getAttribute("Login"));
		// cbookmark 에서 memberid를 검색해 estid 리스트 출력
		
		// estid 와 일치하는 사업자 테이블 리스트 출력
		
		
		List<BInformationVO> bookmarkList = bInformationDAO.selectBookmark(Login.getMemberid());
		mav.addObject("bookmarkList", bookmarkList);
		return mav;
	}

}
