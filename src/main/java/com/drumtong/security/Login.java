package com.drumtong.security;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.system.dao.SLoginLogDAO;
import com.drumtong.system.vo.SLoginLogVO;

@Component
public class Login {
	static CPrivateDataDAO cPrivateDataDAO;
	static SLoginLogDAO sLoginLogDAO;
	
	@Autowired CPrivateDataDAO BeancPrivateDataDAO;
	@Autowired SLoginLogDAO BeansLoginLogDAO;
	
	@PostConstruct
	public void init() {
		cPrivateDataDAO = BeancPrivateDataDAO;
		sLoginLogDAO = BeansLoginLogDAO;
	}
	
	public static boolean login(HttpSession session, HttpServletResponse resp, PrivateData privateData, String storeid){
		Cookie SessionID = new Cookie("JSESSIONID", session.getId());
		String ID = privateData.getId();	// 아이디
		String PW = privateData.getPw();	// 비밀번호
		CPrivateDataVO Login = null;	// User의  MemberID와 일치하는 객체 저장
		// CustomerLoginInterceptor 에서 만들어 세션에 저장해두었던 LoginLogVO 객체 불러오기
		SLoginLogVO sLoginLogVO = (SLoginLogVO)session.getAttribute("sLoginLogVO");	// 인터셉터에서 받아온 loginlogo불러오기
		boolean LoginResult = false;		// 로그인 성공여부
		boolean CheckAutoLogin = "on".equals(storeid);	// 자동로그인 체크여부
		
		// 1. 아이디 비밀번호와 일치하는 계정 가져오기
		System.out.println("고객 : " + (privateData instanceof CPrivateDataVO));
		Login = cPrivateDataDAO.selectLogin(Encrypt.SecurePassword(ID, PW));
		
		// 2. 일치하는 계정 있다면 Login 계정 생성하고 세션에 저장!(세션 시간은 3시간)
		if(Login != null) {
			session.setAttribute("Login", Login);
//			System.out.println("로그인 객체 : " + session.getAttribute("Login"));
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
