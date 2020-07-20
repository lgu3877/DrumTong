package com.laundry.customer.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//Customer Login Intercepter
public class CustomerInterceptor extends HandlerInterceptorAdapter {

	// extends HandlerInterceptorAdaptor
	// (Shift + Alt + S) + V

	// 1. request가 발생한 이후 컨트롤러의 메서드를 수행하기 전에 개입(내가 만든 서브컨트롤러로 넘어가기 전)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//				System.out.println("preHandle");
		// referer에서 와서 RequestURI로 향한다
//				System.out.println("requestURI : " + request.getRequestURI());
//				System.out.println("referer" + request.getHeader("referer"));

		// 만약, 세션이 존재하면 세션을 반환하고, 세션이 없으면 새로 생성하지 않고 null을 반환한다(기존 세션만 사용)
		HttpSession session = request.getSession(false);
//				session.setAttribute("address", request.getRequestURI().substring(request.getContextPath().length()));

		String address = request.getRequestURI().substring(request.getContextPath().length() + 1);
		System.out.println("인터셉터 address : " + address);
		if (session != null && session.getAttribute("login") != null) {
			System.out.println("preHandle : true");
			return true; // 하던거 마저 하세요
		}
//				response.sendRedirect(request.getContextPath()+ "/login");
		response.sendRedirect(request.getContextPath() + "/login?address=" + address);

		System.out.println("preHandle : false");
		return false; // 다른쪽으로 넘깁니다. 더이상 진행하지 마세요
	}

	// 2. 컨트롤러의 메서드가 수행된 이후, view로 넘어가기 전에 개입
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
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
