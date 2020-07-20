package com.laundry.customer.exception;

import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice		// 모든 컨트롤러에(전역설정) root-context 전역 설정 
public class CustomerException {
						// 예외처리 적용
	
						// 수정이 필요함. 
	@ExceptionHandler(CannotGetJdbcConnectionException.class)
	public ModelAndView CanNotConnection(CannotGetJdbcConnectionException e) {
		ModelAndView mv = new ModelAndView("alert");
		mv.addObject("msg", "알 수 없는 문제가 발생했습니다 : " + e);	// 예외를 너무 자세하게 알려주면 1.어짜피 사용자가 이해할 수 없음 2.공격하기 쉬움
//		mv.addObject("msg", "네트워크가 불안하거나, 시스템  상의 문제가 발생했습니다");	// 예외를 너무 자세하게 알려주면 1.어짜피 사용자가 이해할 수 없음 2.공격하기 쉬움
		mv.addObject("site", "/");	// redirect에 사용되는 값
		// 관리자명령 프롬프트에서 lsnrctl stop
		// netstat -an | findstr : 1521
		return mv;
	}
}
