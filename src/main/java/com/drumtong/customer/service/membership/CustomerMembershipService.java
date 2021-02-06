
package com.drumtong.customer.service.membership;

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
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.Encrypt;
import com.drumtong.security.Login;
import com.drumtong.security.SerialUUID;

@Service
public class CustomerMembershipService {

	@Autowired CCustomerDAO cCustomerDAO;			// 고객 테이블
	@Autowired CPrivateDataDAO cPrivateDataDAO;		// 고객정보 테이블
	@Autowired CAlarmDAO cAlarmDAO;					// 고객알람 테이블
	@Autowired CPaymentDAO cPaymentDAO;				// 고객결제 테이블
	
	
	// 로그인 페이지로 이동[영경]
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("customer/membership/customerLogin");
		return mav;
	}

	// 로그인 성공 여부에 따라 페이지 이동[영경]
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp, CPrivateDataVO cPrivateDatavo, String storeid){
		ModelAndView mav = new ModelAndView();
		HttpSession Session = req.getSession();
		String AddressToMove = (String)Session.getAttribute("AddressToMove");		// 인터셉터 들어가기 전 이동하려던 주소
		if(AddressToMove == null) 	AddressToMove = "/customer/";
		
		boolean LoginResult = Login.login(Session, resp, cPrivateDatavo, storeid);		// 로그인 성공여부
		
		// 3. 로그인 성공 여부로 반환할 주소 값 다르게 저장
		mav.setViewName("redirect:" + (LoginResult ? AddressToMove : "/customer/membership/customerLogin/" ));
		

		return mav;
	}
	
	// 로그아웃 객체[영경]
	public ModelAndView logOut(HttpServletRequest req, HttpServletResponse resp) {
		String Referer = req.getHeader("referer");
		String AddressToMove = Referer != null ? Referer.split("drumtong")[1] : "/customer/";
		ModelAndView mav = new ModelAndView("redirect:" + AddressToMove);
		HttpSession Session = req.getSession();
		
		Login.logout(Session, req, resp, Referer, (CPrivateDataVO)Session.getAttribute("cLogin"));
		
		// 로그아웃 했을 때 표시해주기
		Session = req.getSession();
		Session.setAttribute("cLogout", "cLogout");
		return mav;
	}
	
	// 고객 회원가입 (GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView("customer/membership/customerSignUp");
		return mav;
	}
	
	// 고객 회원가입 (POST)
	public ModelAndView signUp(CPrivateDataVO cPrivateDataVO, String checkAddress) {

		ModelAndView mav = new ModelAndView("redirect:/");
		
		// 집주소와 배송지주소가 일치하면 [영경]
		if("on".equals(checkAddress)) {
			// 세탁된 물품을 회수받는 주소에 집 주소 수동으로 입력해주기
			cPrivateDataVO.setMainreceiptaddress(cPrivateDataVO.getMainaddress());
			cPrivateDataVO.setDetailreceiptaddress(cPrivateDataVO.getDetailaddress());
		}
		
		// SerialUUID 생성
		String MemberID =  SerialUUID.getSerialUUID("CPrivateData", "MemberID");
		System.out.println("MemberID : " + MemberID);
		
		
		// 암호화할 아이디, 패스워드 받기
		String PassWord = cPrivateDataVO.getPw();
		String ID = cPrivateDataVO.getId();
		
		// 암호화
		cPrivateDataVO.setPw(Encrypt.SecurePassword(ID, PassWord));
		
		// 고객 정보 VO에 MemberID 입력
		cPrivateDataVO.setMemberid(MemberID);
		
		
		
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
