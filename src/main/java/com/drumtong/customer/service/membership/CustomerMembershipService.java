package com.drumtong.customer.service.membership;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.dao.CAlarmDAO;
import com.drumtong.customer.dao.CCustomerDAO;
import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CCustomerVO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.Encrypt;
import com.drumtong.security.SerialUUID;
import com.drumtong.system.dao.SLoginLogDAO;
import com.drumtong.system.vo.SLoginLogVO;

@Service
public class CustomerMembershipService {

	@Autowired CCustomerDAO cCustomerDAO;			// 고객 테이블
	@Autowired CPrivateDataDAO cPrivateDataDAO;		// 고객정보 테이블
	@Autowired CAlarmDAO cAlarmDAO;					// 고객알람 테이블
	@Autowired CPaymentDAO cPaymentDAO;				// 고객결제 테이블
	@Autowired SLoginLogDAO sLoginLogDAO;
	
	
	
	
	
	
	// 로그인 페이지로 이동[영경]
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("customer/membership/customerLogin");
		return mav;
	}

	// 로그인 성공 여부에 따라 페이지 이동[영경]
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp, CPrivateDataVO cPrivateDatavo, String storeid){
		ModelAndView mav = new ModelAndView();
		HttpSession Session = req.getSession();
		String ID = cPrivateDatavo.getId();	// 아이디
		String PW = cPrivateDatavo.getPw();	// 비밀번호
		CPrivateDataVO User = null;	// ID, PW과 일치하는 객체 저장
		CCustomerVO Login = null;	// User의  MemberID와 일치하는 객체 저장
		// CustomerLoginInterceptor 에서 만들어 세션에 저장해두었던 LoginLogVO 객체 불러오기
		SLoginLogVO sLoginLogVO = (SLoginLogVO)Session.getAttribute("sLoginLogVO");	// 인터셉터에서 받아온 loginlogo불러오기
		String AddressToMove = (String)Session.getAttribute("AddressToMove");		// 인터셉터 들어가기 전 이동하려던 주소
		boolean LoginResult = false;		// 로그인 성공여부
		boolean CheckAutoLogin = "on".equals(storeid);	// 자동로그인 체크여부
		
		// 1. 아이디 비밀번호 일치 여부 확인하기(계정 가져오기)
		User = cPrivateDataDAO.selectUser(Encrypt.SecurePassword(ID, PW));
		
		// 2. 일치하는 계정 있다면 Login 계정 생성하고 세션에 저장!(세션 시간은 3시간)
		if(User != null) {
			Login = cCustomerDAO.selectLogin(User.getMemberid());
			Session.setAttribute("Login", Login);
			Session.setMaxInactiveInterval(60 * 60 * 3);
			LoginResult = true;
		}
		
		// 3. 로그인 성공 여부로 반환할 주소 값 다르게 저장
		mav.setViewName("redirect:" + (LoginResult ? AddressToMove : "/customer/membership/customerLogin/" ));
		
		// 4. 로그인로그에 데이터 입력 후 DB에 저장
		sLoginLogVO.setUserid(ID);
		sLoginLogVO.setLoginresult(LoginResult ? "SUCCESS" : "FAIL");
		int LoginLogResult = sLoginLogDAO.insertLoginLog(sLoginLogVO);
		
		// 5. 자동로그인 체크되어있고, 로그인 결과 값이 true이면 쿠키에 저장
		if(CheckAutoLogin && LoginResult) {
			Session.setAttribute("AutoLogin", Login);
			Session.setMaxInactiveInterval(60 * 60 * 24 * 7);
			Cookie SessionID = new Cookie("JSESSIONID", Session.getId());
			SessionID.setPath("/drumtong/");
			SessionID.setMaxAge(60 * 60 * 24 * 7);
			resp.addCookie(SessionID);
		}

		return mav;
	}
	
	// 고객 회원가입 (GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView("customer/membership/customerSignUp");
		return mav;
	}
	
	// 고객 회원가입 (POST)
	public ModelAndView signUp(CPrivateDataVO cPrivateDataVO) {

		ModelAndView mav = new ModelAndView("/");
		
		// SerialUUID 생성
		String MemberID =  SerialUUID.getSerialUUID("CPrivateData", "MemberID");
		
		
		// 세탁된 물품을 회수받는 주소
		String MainReceiptAddress = cPrivateDataVO.getMainaddress();
		String DetailReceiptAddress = cPrivateDataVO.getDetailaddress();
		
		// 고객 정보 VO에 MemberID, MainReciptAddress, DetailReceiptAddress 입력
		cPrivateDataVO.setMemberid(MemberID);
		cPrivateDataVO.setMainreceiptaddress(MainReceiptAddress);
		cPrivateDataVO.setDetailreceiptaddress(DetailReceiptAddress);
		
		
		// 1. CCustomer 신규 데이터 생성	( 고객 테이블 )
		
		int CustomerReuslt = cCustomerDAO.insertSignUp(MemberID);
		
		
		
		// 2. CPrivateData 신규 데이터 생성	( 고객 개인정보 테이블 )
		
		int PrivateDataResult = cPrivateDataDAO.insertSignUp(cPrivateDataVO);
		
		
		
		// 3. CAlarm 신규 데이터 생성	( 고객 알람 테이블 )
		
		int AlarmResult = cAlarmDAO.insertSignUp(MemberID);
		
		
		
		// 4. CCpayment 신규 데이터 생성	( 고객 지불 테이블 )
		
		int PaymentResult = cPaymentDAO.insertSignUp(MemberID);
		
		
		return mav;
	}

}
