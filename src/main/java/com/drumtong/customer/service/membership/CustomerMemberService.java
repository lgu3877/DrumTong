package com.drumtong.customer.service.membership;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.customer.vo.CPrivateDataVO;

@Service
public class CustomerMemberService {
	// 로그인 페이지로 이동[영경]
	public ModelAndView login() {
		// intercepter에서 걸러짐! -> 로그인 안되어있을 때
		// 로그인 페이지로 이동하기 전 페이지 주소가 세션이 담겨 있는 상태
		ModelAndView mav = new ModelAndView("customer/membership/customerLogin");
		return mav;
	}

	// 로그인 성공 여부에 따라 페이지 이동[영경]
	public ModelAndView login(CPrivateDataVO vo) {
		System.out.println();
		// 1. 아이디 비밀번호 일치 여부 확인하기(계정 가져오기)
		// - 아이디(uk)로 객체를 가져와서 비밀번호를 비교!(true, false)
//		CCustomer login = dao.selectLogin(vo.getId(), SecurePassword(vo.getId(), vo.getPw()));
		
		// 2. !true 면 로그인 페이지로 접속하기 이전 주소로 , false 면 로그인 페이지로 ModelAndView에 주소 입력
		// ( 로그인 성공 시 : intercepter에서 주소 값 변수에 받아와서 주소 값이 있을 땐 그 주소로, 없으면 메인으로)
//		ModelAndView mav = new ModelAndView(login != null ? "이전에 접속한 페이지" : "customer/membership/customerLogin");
		
		// 3. 로그인로그에 데이터 입력
		
		
		// 4. 자동로그인 체크되어있고, 로그인 결과 값이 true이면 쿠키에 저장
		
		// 5. 리턴
		return null;
	}
	
	// 비밀번호를 암호화하여 해쉬값 반환[영경]
	public String SecurePassword(String id, String pw) throws NoSuchAlgorithmException{
		MessageDigest mdHash = MessageDigest.getInstance("SHA-512");
		// Base64 : 8비트 이진 데이터를 문자 코드에 영향을 받지 않는 공통 ASCII 영역의 문자들로만 이루어진 일련의 문자열로 바꾸는 인코딩 방식
		// update() : 지정된 바이트 데이터를 사용해 다이제스트를 갱신
		mdHash.update(Base64.getEncoder().encode(id.getBytes()));
		mdHash.update(Base64.getEncoder().encode(pw.getBytes()));
		// digest() : 바이트배열로 해쉬를 반환한다.
		return String.format("%064x", new BigInteger(1, mdHash.digest()));
	}
	
}
