package com.drumtong.customer.service.membership;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.dao.CAlarmDAO;
import com.drumtong.customer.dao.CCustomerDAO;
import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.SerialUUID;

@Service
public class CustomerMembershipService {

	@Autowired CCustomerDAO cCustomerDAO;			// 고객 테이블
	@Autowired CPrivateDataDAO cPrivateDataDAO;		// 고객정보 테이블
	@Autowired CAlarmDAO cAlarmDAO;					// 고객알람 테이블
	@Autowired CPaymentDAO cPaymentDAO;				// 고객결제 테이블
	
	// 고객 회원가입 (GET)
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView("customer/membership/customerSignUp");
		return mav;
	}
	
	// 고객 회원가입 (POST)
	public ModelAndView signUp(CPrivateDataVO cPrivateDataVO) {
		System.out.println("signUP 구문 실행");
		ModelAndView mav = new ModelAndView("/");
		
		// SerialUUID 생성
		String MemberID =  SerialUUID.getSerialUUID("CPrivateData", "MemberID");
		
		// 고객 정보 VO에 MemberID 입력
		cPrivateDataVO.setMemberid(MemberID);
		
		
		// 1. CCustomer 신규 데이터 생성
		
		int CustomerReuslt = cCustomerDAO.insertSignUp(MemberID);
		
		
		
		// 2. CPrivateData 신규 데이터 생성
		
		int PrivateDataResult = cPrivateDataDAO.insertSignUp(cPrivateDataVO);
		
		
		
		// 3. CAlarm 신규 데이터 생성
		
		int AlarmResult = cAlarmDAO.insertSignUp(MemberID);
		
		
		
		// 4. CCpayment 신규 데이터 생성
		
		int PaymentResult = cPaymentDAO.insertSignUp(MemberID);
		
		
		return mav;
	}

}
