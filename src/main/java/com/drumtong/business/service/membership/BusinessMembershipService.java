package com.drumtong.business.service.membership;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BBusinessDAO;
import com.drumtong.business.dao.BPrivateDataDAO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.Encrypt;
import com.drumtong.security.SerialUUID;

@Service
public class BusinessMembershipService {
	
	@Autowired BBusinessDAO bBusinessDAO;			// 사업자 테이블
	@Autowired BPrivateDataDAO bPrivateDataDAO;		// 사업자 개인 정보 테이블
	
	// 비즈니스 로그인 이동 (GET) [건욱]
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("business/membership/businessLogin");
		return mav;
	}
	

	// 비즈니스 회원가입 이동 (GET) [건욱]
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

	// 사업자 회원가입 완료 이동 (GET) [건욱]
	public ModelAndView finishSignUp() {
		ModelAndView mav = new ModelAndView("business/membership/businessFinishSignUp");
		return mav;
	}
	


	// 사업자 계약해지 & 패스워드 재확인 이동 (GET) [건욱]
	public ModelAndView pwReconfirm() {
		ModelAndView mav = new ModelAndView("business/membership/businessPWReconfirm");
		return mav;
	}
	
	

	// 사업자 계정 정보 관리 이동 (GET) [건욱]
	public ModelAndView accountInfo() {
		ModelAndView mav = new ModelAndView("business/membership/businessAccountInfo");
		return mav;
	}


	// 사업자 계정 찾기 이동 (GET) [건욱]
	public ModelAndView accountFind() {
		ModelAndView mav = new ModelAndView("business/membership/businessAccountFind");
		return mav;
	}


	// 사업자 ID 찾기 이동 (GET) [건욱]
	public ModelAndView idFind() {
		ModelAndView mav = new ModelAndView("business/membership/businessIDFind");
		return mav;		
	}


	// 사업자 PW 찾기 이동 (GET) [건욱]
	public ModelAndView pwFind() {
		ModelAndView mav = new ModelAndView("business/membership/businessPWFind");
		return mav;		
	}
	
	
	
}
