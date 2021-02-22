package com.drumtong.customer.service.membership;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.vo.BCouponVO;
import com.drumtong.customer.dao.CBookmarkDAO;
import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.Login;


@Service
public class RestCustomerMembershipService {
	
	@Autowired CPrivateDataDAO cPrivateDataDAO;		// 고객정보 테이블
	@Autowired CPaymentDAO cPaymentDAO;	// 고객정보 테이블
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired BCouponDAO bCouponDAO;
	@Autowired CBookmarkDAO cBookmarkDAO;
	
	// 아이디 중복 검사
	public int useridDupl(String id) {
		return cPrivateDataDAO.useridDupl(id);
	}

	public List<Object> login(HttpServletRequest req, HttpServletResponse resp, HashMap<String, String> param) {
		CPrivateDataVO cPrivateDataVO = new CPrivateDataVO();
		cPrivateDataVO.setId(param.get("id"));
		cPrivateDataVO.setPw(param.get("pw"));
		boolean LoginResult = Login.login(req.getSession(), resp, cPrivateDataVO, param.get("storeid"));
		
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		
		String estid = (String)req.getSession().getAttribute("estid");
		List<Object> list = new ArrayList<Object>();
		list.add(LoginResult);
		if(LoginResult) {
			list.add(Login);
			// 1. map에 memberid, estid를 넣어준다
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("memberid", Login.getMemberid());
			map.put("estid", estid);
			
			// 고객이 가지고 있으면서 해당 사업장 쿠폰이고 사업장에 유효한(삭제X, 유효기간O) 쿠폰일 때
			List<BCouponVO> CouponList = bCouponDAO.selectUsableCoupon(map);
			list.add(CouponList);
			
			// 고객 포인트 정보
			int myPoint = cPaymentDAO.select(Login.getMemberid()).getPoint();
			list.add(myPoint);
			
			list.add((cBookmarkDAO.isCheck(map) != null) ? "y" : "n");
		}
		return list;
//		return LoginResult ? "true": "false";
	}

	// 이메일 중복 검사[영경]
	public String emailCheck(String email) {
		int CheckResult = cPrivateDataDAO.userEmailDupl(email);
		return CheckResult == 1 ? "false" : "true";
	}

	
}
