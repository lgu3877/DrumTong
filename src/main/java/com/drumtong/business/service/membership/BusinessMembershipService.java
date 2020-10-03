package com.drumtong.business.service.membership;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BBusinessDAO;
import com.drumtong.business.dao.BPrivateDataDAO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.Encrypt;
import com.drumtong.security.Login;
import com.drumtong.security.SerialUUID;

@Service
public class BusinessMembershipService {
	
	@Autowired BBusinessDAO bBusinessDAO;			// 사업자 테이블
	@Autowired BPrivateDataDAO bPrivateDataDAO;		// 사업자 개인 정보 테이블
	
	// 비즈니스 로그인 이동 [건욱]
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("business/membership/businessLogin");
		return mav;
	}
	
	// 로그인 성공 여부에 따라 페이지 이동[영경]
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp, BPrivateDataVO bPrivateDatavo, String storeid){
		ModelAndView mav = new ModelAndView();
		HttpSession Session = req.getSession();
		String AddressToMove = (String)Session.getAttribute("AddressToMove");		// 인터셉터 들어가기 전 이동하려던 주소
		
		boolean LoginResult = Login.login(Session, resp, bPrivateDatavo, storeid);		// 로그인 성공여부
		
		// 3. 로그인 성공 여부로 반환할 주소 값 다르게 저장
		mav.setViewName("redirect:" + (LoginResult ? AddressToMove : "/business/membership/businessLogin/" ));
		

		return mav;
	}
	
	// 로그아웃 객체
	public ModelAndView logOut(HttpServletRequest req, HttpServletResponse resp) {
		String Referer = req.getHeader("referer");
		String AddressToMove = Referer != null ? Referer.split("drumtong")[1] : "/business/";
		ModelAndView mav = new ModelAndView("redirect:" + AddressToMove);
		HttpSession Session = req.getSession();
		
		Login.logout(Session, req, resp, Referer, (BPrivateDataVO)Session.getAttribute("bLogin"));
		
		// 로그아웃 했을 때 표시해주기
		Session = req.getSession();
		Session.setAttribute("Logout", "Logout");
		return mav;
	}

	// 비즈니스 회원가입 (GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView("business/membership/businessSignUp");
		return mav;
	}
	
	// 비즈니스 회원가입 (POST) [건욱]
	public ModelAndView signUp(BPrivateDataVO bPrivateDataVO) {

		ModelAndView mav = new ModelAndView("redirect:/");
		
		// SerialUUID 생성
		String BPersonID =  SerialUUID.getSerialUUID("BBusiness", "BPersonID");
		
		// 암호화할 아이디, 패스워드 받기
		String PassWord = bPrivateDataVO.getPw();
		String ID = bPrivateDataVO.getId();
		
		// 암호화
		bPrivateDataVO.setPw(Encrypt.SecurePassword(ID, PassWord));
		
		// 사업자 개인정보 VO에 BPersonID UUID 넣어준다.
		bPrivateDataVO.setBpersonid(BPersonID);
		
		
		
		// 1. BBusiness 신규 데이터 생성	( 사업자 테이블 )
		
		int BBusinessReuslt = bBusinessDAO.insertSignUp(BPersonID);
		
		
		
		// 2. BPrivateData 신규 데이터 생성	( 사업자 개인정보 테이블 )
		int PrivateDataResult = bPrivateDataDAO.insertSignUp(bPrivateDataVO);
		
		
		
		return mav;
	}
	
	
	
}
