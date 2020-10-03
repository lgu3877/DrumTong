package com.drumtong.business.service.membership;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BPrivateDataDAO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.Login;

@Service
public class RestBusinessMembershipService {
	

	@Autowired BPrivateDataDAO bPrivateDataDAO;		// 비즈니스 개인정보 테이블
	
	
	// 아이디 중복 검사
	public int useridDupl(String id) {
		return bPrivateDataDAO.useridDupl(id);
	}

	// 비즈니스 로그인 [건욱]
	public String login(HttpServletRequest req, HttpServletResponse resp, HashMap<String, String> param) {
		BPrivateDataVO bPrivateDataVO = new BPrivateDataVO();
		bPrivateDataVO.setId(param.get("id"));
		bPrivateDataVO.setPw(param.get("pw"));
		boolean LoginResult = Login.login(req.getSession(), resp, bPrivateDataVO, param.get("storeid"));
		return LoginResult ? "true": "false";
	}
}
