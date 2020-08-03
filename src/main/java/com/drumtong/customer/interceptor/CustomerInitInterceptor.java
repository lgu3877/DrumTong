package com.drumtong.customer.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CCustomerVO;
import com.drumtong.system.dao.SIPLogDAO;
import com.drumtong.system.dao.SLoginLogDAO;
import com.drumtong.system.vo.SIPLogVO;
import com.drumtong.system.vo.SLoginLogVO;

//Customer Init Intercepter
public class CustomerInitInterceptor extends HandlerInterceptorAdapter {
	// extends HandlerInterceptorAdaptor
	// (Shift + Alt + S) + V
	@Autowired CPrivateDataDAO cPrivateDAO;
	@Autowired SIPLogDAO sIPLogDAO;
	@Autowired SLoginLogDAO sLoginLogDAO;
	
	// 1. request가 발생한 이후 컨트롤러의 메서드를 수행하기 전에 개입(내가 만든 서브컨트롤러로 넘어가기 전)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession Session = request.getSession();
		String Referer = request.getHeader("REFERER");
//		◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆
		// pull 하고나서 수정 : !referer.startsWith("http://본인아이피주소:본인포트번호/drumtong/"))
		Boolean LinkInitialConnection = (Referer == null || !Referer.startsWith("http://localhost:7070/drumtong/"));
//		◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆
		
		// 로그인 되어있고 페이지를 계속 사용중이라면 Session 유지시간 3시간으로 업데이트
		if(Session.getAttribute("Login") != null)
			Session.setMaxInactiveInterval(60 * 60 * 3);

		// 최초로 접속했을때만 실행되는 함수
		if(LinkInitialConnection) {
			String IP;
			SIPLogVO sIPLogVO = new SIPLogVO();
			CCustomerVO AutoLogin = (CCustomerVO)Session.getAttribute("AutoLogin");
			SLoginLogVO sLoginLogVO = new SLoginLogVO();
			
			// 1. referer과 ip 구하기
			// type-in_traffic : 웹 브라우저에 직접 웹 사이트의 주소를 입력하여 검색하는 사람
			Referer = Referer == null ? "type-in_traffic" : Referer;
			// 구글링을 프록시를 사용하는 경우에는 getRemoteAddr()를 사용하지 않고 다음의 몇 가지 헤더값으로 IP를 판단해야 된다고 하는데 WAS 종류마다 사용하는 헤더값이 조금씩 다를 수 있다
			// 개인의 환경에 따라 다를 수 있으니 IP를 구하는 메서드로 따로 빼두고 다음의 소스를 사용하여 헤더값을 하나하나 검사
			IP = request.getHeader("X-Forwarded-For");
			if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("Proxy-Client-IP"); }
			if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("WL-Proxy-Client-IP"); }
			if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("HTTP_CLIENT_IP"); }
			if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getHeader("HTTP_X_FORWARDED_FOR"); }
			if (IP == null || IP.length() == 0 || "unknown".equalsIgnoreCase(IP)) {  IP = request.getRemoteAddr(); }
			
			sIPLogVO.setUserip(IP);
			sIPLogVO.setIpurl(Referer);
			
			// 2. DB에 저장
			int IPLogResult = sIPLogDAO.insertIPLog(sIPLogVO);

			// 3. 자동로그인 정보가 있다면 로그인하고 로그인로그남기기
			if(AutoLogin != null) {
				String MemberID = cPrivateDAO.selectID(AutoLogin.getMemberid());
				sLoginLogVO.setUserid(MemberID);
				sLoginLogVO.setLoginip(IP);
				sLoginLogVO.setLoginurl(Referer);
				sLoginLogVO.setLoginresult("AUTO");
				
				// DB에 저장
				int LoginLogResult = sLoginLogDAO.insertLoginLog(sLoginLogVO);
			}
		}
		return true;
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
