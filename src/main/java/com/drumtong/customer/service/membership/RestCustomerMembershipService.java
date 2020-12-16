package com.drumtong.customer.service.membership;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.Login;


@Service
public class RestCustomerMembershipService {
	
	@Autowired CPrivateDataDAO cPrivateDataDAO;		// 고객정보 테이블
	
	// 아이디 중복 검사
	public int useridDupl(String id) {
		return cPrivateDataDAO.useridDupl(id);
	}

	public String login(HttpServletRequest req, HttpServletResponse resp, HashMap<String, String> param) {
		CPrivateDataVO cPrivateDataVO = new CPrivateDataVO();
		cPrivateDataVO.setId(param.get("id"));
		cPrivateDataVO.setPw(param.get("pw"));
		boolean LoginResult = Login.login(req.getSession(), resp, cPrivateDataVO, param.get("storeid"));
		return LoginResult ? "true": "false";
	}

	// 이메일 중복 검사[영경]
	public String emailCheck(String email) {
		int CheckResult = cPrivateDataDAO.userEmailDupl(email);
		return CheckResult == 1 ? "false" : "true";
	}

	
}
