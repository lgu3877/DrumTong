package com.drumtong.security;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.drumtong.customer.dao.CCustomerDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CCustomerVO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.system.dao.SLoginLogDAO;
import com.drumtong.system.vo.SLoginLogVO;

@Component
public class Login {
	static CPrivateDataDAO cPrivateDataDAO;
	static CCustomerDAO cCustomerDAO;
	static SLoginLogDAO sLoginLogDAO;
	
	@Autowired CPrivateDataDAO BeancPrivateDataDAO;
	@Autowired CCustomerDAO BeancCustomerDAO;
	@Autowired SLoginLogDAO BeansLoginLogDAO;
	
	@PostConstruct
	public void init() {
		this.cPrivateDataDAO = BeancPrivateDataDAO;
		this.cCustomerDAO = BeancCustomerDAO;
		this.sLoginLogDAO = BeansLoginLogDAO;
	}
	
	public static boolean login(HttpSession session, HttpServletResponse resp, CPrivateDataVO cPrivateDatavo, String storeid){
		Cookie SessionID = new Cookie("JSESSIONID", session.getId());
		String ID = cPrivateDatavo.getId();	// 아이디
		String PW = cPrivateDatavo.getPw();	// 비밀번호
		CPrivateDataVO User = null;	// ID, PW과 일치하는 객체 저장
		CCustomerVO Login = null;	// User의  MemberID와 일치하는 객체 저장
		// CustomerLoginInterceptor 에서 만들어 세션에 저장해두었던 LoginLogVO 객체 불러오기
		SLoginLogVO sLoginLogVO = (SLoginLogVO)session.getAttribute("sLoginLogVO");	// 인터셉터에서 받아온 loginlogo불러오기
		boolean LoginResult = false;		// 로그인 성공여부
		boolean CheckAutoLogin = "on".equals(storeid);	// 자동로그인 체크여부
		
		System.out.println("cPrivateDataDAO : " + cPrivateDataDAO);		
		System.out.println("cCustomerDAO : " + cCustomerDAO);		
		System.out.println("sLoginLogDAO : " + sLoginLogDAO);
		// 1. 아이디 비밀번호 일치 여부 확인하기(계정 가져오기)
		String test=Encrypt.SecurePassword(ID, PW);
		System.out.println("test : " + test);
		User = cPrivateDataDAO.selectUser(test);
		
		// 2. 일치하는 계정 있다면 Login 계정 생성하고 세션에 저장!(세션 시간은 3시간)
		if(User != null) {
			Login = cCustomerDAO.selectLogin(User.getMemberid());
			session.setAttribute("Login", Login);
			System.out.println("로그인 객체 : " + session.getAttribute("Login"));
			session.setMaxInactiveInterval(60 * 60 * 3);
			LoginResult = true;
			
			SessionID.setPath("/drumtong/");
		}
		
		// 4. 로그인로그에 데이터 입력 후 DB에 저장
		sLoginLogVO.setUserid(ID);
		sLoginLogVO.setLoginresult(LoginResult ? "SUCCESS" : "FAIL");
		int LoginLogResult = sLoginLogDAO.insertLoginLog(sLoginLogVO);
		
		// 5. 자동로그인 체크되어있고, 로그인 결과 값이 true이면 쿠키에 저장
		if(CheckAutoLogin && LoginResult) {
			session.setAttribute("AutoLogin", Login);
			session.setMaxInactiveInterval(60 * 60 * 24 * 7);
			SessionID.setMaxAge(60 * 60 * 24 * 7);
			resp.addCookie(SessionID);
		}

		return LoginResult;
	}
}
