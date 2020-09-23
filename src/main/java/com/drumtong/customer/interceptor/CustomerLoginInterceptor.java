package com.drumtong.customer.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.drumtong.security.GetIPAddress;
import com.drumtong.system.vo.SLoginLogVO;

//Customer Login Intercepter
public class CustomerLoginInterceptor extends HandlerInterceptorAdapter {

	// extends HandlerInterceptorAdaptor
	// (Shift + Alt + S) + V

	// 1. request가 발생한 이후 컨트롤러의 메서드를 수행하기 전에 개입(내가 만든 서브컨트롤러로 넘어가기 전)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession Session = request.getSession();
		String AddressToMove = request.getRequestURI();
		AddressToMove = AddressToMove.substring(request.getContextPath().length(),AddressToMove.length());
		SLoginLogVO sLoginLogVO = null;
		
		// ■□■□■□■□■□■□■□■□■□■□■□로그인이 되어있다면■□■□■□■□■□■□■□■□■□■□■□
		if(Session.getAttribute("Login") != null) {
			// 로그인 되어있을 땐 로그인 페이지를 들어갈 수 없게! 만약 들어왔다면 메인으로 이동
			if(AddressToMove.equals("/customer/membership/customerLogin/") ) {
				response.sendRedirect(request.getContextPath() + "/customer/");
				return false;
			}
			return true;
		}
		
		// ■□■□■□■□■□방금 로그아웃 했고 이전 페이지가 로그인 해야하는 페이지일 경우 메인으로!■□■□■□■□■□
		if("firstPage".equals(Session.getAttribute("Logout"))) {
			response.sendRedirect(request.getContextPath() + "/customer/");
			return false;
		}
		
		// ■□■□■□■□■□■□■□■□■□■□■로그인이 안되어있다면□■□■□■□■□■□■□■□■□■□■□
		// 1. 이동할 주소 session에 저장
		AddressToMove = AddressToMove.equals("customer/membership/customerLogin/")
				? "customer/"	// 로그인 페이지를 눌러 이동한거면
				: AddressToMove;	// 로그인 페이지가 아닌 다른 페이지에서 왔다면

		Session.setAttribute("AddressToMove", AddressToMove);
		
		// 2. 로그인 로그 객체 만들기
		sLoginLogVO = new SLoginLogVO();
		
		// 3. LOGINIP, LOGINURL 넣기;
		sLoginLogVO.setLoginip(GetIPAddress.getIP(request));
		sLoginLogVO.setLoginurl(request.getHeader("referer"));
		
		Session.setAttribute("sLoginLogVO", sLoginLogVO);
		
		// redirect 넣고, return false로 바꾸기
		return true;
	}

	// 2. 컨트롤러의 메서드가 수행된 이후, view로 넘어가기 전에 개입
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		// 더이상 사용하지 않을 Session들 삭제해주기
		HttpSession Session = request.getSession();
		Session.removeAttribute("AddressToMove");
		Session.removeAttribute("sLoginLogVO");
		Session.removeAttribute("Logout");
		
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	// 3. view가 전달된 이후 개입
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}
	
}
