package com.drumtong.security;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.drumtong.system.vo.SLoginLogVO;

//Customer Login Intercepter
public class LoginInterceptor extends HandlerInterceptorAdapter {

	// extends HandlerInterceptorAdaptor
	// (Shift + Alt + S) + V

	// 1. request가 발생한 이후 컨트롤러의 메서드를 수행하기 전에 개입(내가 만든 서브컨트롤러로 넘어가기 전)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession Session = request.getSession();
		new Cookie("JSESSIONID", Session.getId()).setPath("/drumtong/");
		boolean NotChangeAddressConfirm = "move".equals(Session.getAttribute("move")) ? true : false;
		Session.removeAttribute("move");
		String AddressToMove = CheckAddress(NotChangeAddressConfirm, Session, request);
		boolean typeOfSite = AddressToMove.contains("/business/") ? false : true;
		boolean NowLogin = Session.getAttribute(typeOfSite ? "cLogin" : "bLogin") != null;
		String LoginPageName = typeOfSite ? "/customer/membership/customerLogin/" : "/business/membership/businessLogin/";
		String MainPageName = typeOfSite ? "/customer/" : "/business/";
		
		// ■□■□■□■□■□■□■□■□■□■□■□로그인이 되어있다면■□■□■□■□■□■□■□■□■□■□■□
		if(NowLogin) {
			return MoveAfterLogin(Session, LoginPageName, MainPageName, AddressToMove, request, response);
		}
		
		// ■□■□■□■□■□방금 로그아웃 했고 이전 페이지가 로그인 해야하는 페이지일 경우 메인으로!■□■□■□■□■□
		if("firstPage".equals(Session.getAttribute(typeOfSite ? "cLogout" : "bLogout"))) {
//			System.out.println("[로그인인터셉터] 방금 로그아웃&이동할 페이지가 로그인 해야하는 페이지");
			Session.removeAttribute(typeOfSite? "cLogout" : "bLogout");
			response.sendRedirect(request.getContextPath() + MainPageName);
			return false;
		}
		
		// ■□■□■□■□■□■□■□■□■□■□■로그인이 안되어있다면□■□■□■□■□■□■□■□■□■□■□
		// 1. 이동할 주소 session에 저장
		if(NotChangeAddressConfirm) {
//			System.out.println("[로그인 인터셉터] ① 로그인 페이지로 이동 중, 아래 문장 실행 안됌");
			return true;
		}
//		System.out.println("[로그인 인터셉터] ② 첫 로그인인터셉터!, 아래 문장 실행 됌");
		
		// 다음 인터셉터에서 이동할주소가 그대로 유지되게 해주는 객체
		AddressToMove = MoveBeforeLogin(Session, LoginPageName, MainPageName, AddressToMove, request);
		
//		System.out.println("[로그인 인터셉터] 맨마지막 줄 > 로그인 페이지로 redirect 수행 직전");
		response.sendRedirect(request.getContextPath() + LoginPageName);
		return false;
//		return true;
	}
	
	private String MoveBeforeLogin(HttpSession session, String loginPageName, String mainPageName, String addressToMove,
			HttpServletRequest request) {
		String Referer = request.getHeader("Referer");
		session.setAttribute("move", "move");
		System.out.println("Referer : " + Referer);
		System.out.println("addressToMove : " + addressToMove);
		System.out.println("loginPageName : " + loginPageName);
		System.out.println("mainPageName : " + mainPageName);
		System.out.println("request.getContextPath() : " + request.getContextPath());
		
		addressToMove = addressToMove.endsWith(loginPageName)
				? (Referer != null ? (Referer.split(request.getContextPath())[1]) : mainPageName)	// 로그인 페이지를 눌러 이동한거면
				: addressToMove;	// 로그인 페이지가 아닌 다른 페이지에서 왔다면
		
//				if(addressToMove.endsWith(loginPageName)) {	// 로그인 페이지로 직접이동
//					if(Referer != null) {	// 주소창에 입력하지 않은 경우
//						String tmp = Referer.split(request.getContextPath())[1];
//						if(!tmp.endsWith(signUpPageName)){
//							tmp = mainPageName; 
//						}
//						addressToMove = tmp;
//					} else {	// 주소창 입력
//						addressToMove = mainPageName;
//					}
//				}
		
				
		session.setAttribute("AddressToMove", addressToMove);
		System.out.println("최종 AddressToMove 는'" + addressToMove + "'로 로 되었고");
		CreateNewSLoginLog(request, session, addressToMove);
		return addressToMove;
	}

	public void CreateNewSLoginLog(HttpServletRequest request, HttpSession session, String addressToMove) {
//		System.out.println("[로그인 인터셉터] CreateNewSLoginLog > 이 메서드는 로그인를 생성하는 메서드 입니다.");
		SLoginLogVO sLoginLogVO = new SLoginLogVO();
		String Referer = request.getHeader("Referer");
		Referer = Referer == null ? addressToMove : Referer;
		
		sLoginLogVO.setLoginip(GetIPAddress.getIP(request));
		sLoginLogVO.setLoginurl(Referer);
//		System.out.println("Referer : " + Referer);
		session.setAttribute("sLoginLogVO", sLoginLogVO);
		
	}

	// 로그인 되어있을 때 이동할 페이지
	private boolean MoveAfterLogin(HttpSession session, String loginPageName, String mainPageName, String addressToMove, HttpServletRequest request, HttpServletResponse response) throws IOException {
		session.removeAttribute("AddressToMove");
//		System.out.println("AddressToMove 삭제");
		if(addressToMove.endsWith(loginPageName) ) {
//			System.out.println("[로그인 인터셉터] MoveAfterLogin > 로그인 되어있는데 주소창에 로그인 주소를 입력해 이동하려는 경우 메인으로 강제 이동");
			response.sendRedirect(request.getContextPath() + mainPageName);
			return false;
		}
		return true;
	}

	// AddressToMove값 넣기
	private String CheckAddress(boolean notChangeAddressConfirm, HttpSession session, HttpServletRequest request) {
		String AddressToMove = null;
		if(notChangeAddressConfirm) {
			AddressToMove = (String)session.getAttribute("AddressToMove");
		} else {
			AddressToMove = request.getRequestURI();
			AddressToMove = AddressToMove.substring(request.getContextPath().length(),AddressToMove.length());
//			System.out.println("로그인 인터셉터 : AddressToMove : " + AddressToMove);
		}
		return AddressToMove;
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