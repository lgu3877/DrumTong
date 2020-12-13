package com.drumtong.customer.service.account;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.Encrypt;

@Service
public class RestCustomerAccountService {
	
	@Autowired CPrivateDataDAO cPrivateDataDAO;
	
	// 비밀번호 수정하기 전 현재 비밀번호 체크[영경]
	public String pwCheck(HttpServletRequest req, String pw) {
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		
		if(cPrivateDataDAO.selectLogin(Encrypt.SecurePassword(Login.getId(), pw)) != null)
			return "true";
		return "false";
	}

	// 개인정보 수정하기[영경]
	public String Change(HttpServletRequest req, String type, HashMap<String, String> param) {
		HttpSession Session= req.getSession();
		CPrivateDataVO Login = (CPrivateDataVO)Session.getAttribute("cLogin");
		
		if(type.equals("pw")) {
			String securePW = Encrypt.SecurePassword(Login.getId(), param.get("pw"));
			param.put("pw", securePW);
			Login.setPw(securePW);
		}
		
		HashMap<String, String> value = new HashMap<String, String>();
		value.put("memberid", Login.getMemberid());
		value.put("value", param.get(type));
		value.put("name", type);
		
		if(cPrivateDataDAO.updateChange(value) == 1) {
			Session.setAttribute("cLogin", cPrivateDataDAO.selectLogin(Login.getPw()));
			return "true";
		}
		return "false";
	}

}
