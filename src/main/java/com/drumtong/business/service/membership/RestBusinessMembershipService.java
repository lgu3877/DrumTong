package com.drumtong.business.service.membership;

import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BPrivateDataDAO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.Encrypt;
import com.drumtong.security.Login;
import com.drumtong.security.Mail;

@Service
public class RestBusinessMembershipService {
	

	@Autowired BPrivateDataDAO bPrivateDataDAO;		// 비즈니스 개인정보 테이블
	
	// 비즈니스 로그인 [영경]
	public String login(HttpServletRequest req, HttpServletResponse resp, HashMap<String, String> param) {
		BPrivateDataVO bPrivateDataVO = new BPrivateDataVO();
		bPrivateDataVO.setId(param.get("id"));
		bPrivateDataVO.setPw(param.get("pw"));
		boolean LoginResult = Login.login(req.getSession(), resp, bPrivateDataVO, param.get("storeid"));
		return LoginResult ? "true": "false";
	}
	
	// 계정이 일치한다면 이메일 전송[영경]
	public String emailConfirm(HttpServletRequest req, BPrivateDataVO bprivatedatavo) {
		String Phonenum = bprivatedatavo.getPhonenum();
		if(Phonenum != null)
			bprivatedatavo.setPhonenum(Phonenum.substring(0,3) + "-" + Phonenum.substring(3,7) + "-" + Phonenum.substring(7));
		BPrivateDataVO User = bprivatedatavo.getEmail() != null ?
					bPrivateDataDAO.pwFindEmailID(bprivatedatavo)
					:bPrivateDataDAO.pwFindPhoneNameID(bprivatedatavo);
		if(User != null) {
			// 이메일로 인증번호 전송하는 메서드
			return Mail.mailSendTypeAuth(User.getEmail()) + "";
		}
		// 잘못된 입력일 땐 -1 반환
		return "-1";
	}
	
	// ========================= 대분류 [사업자 계정관리] ================================
	
	
	// ===== 중분류 [BPrivateData] 테이블 ====
		
		
	// === 소분류 [ NAME ] 필드 {이름} ==
	// 1. 사업자 계정관리에 이름을 비동기식으로 수정해주는 메서드입니다.
	public int updateName(BPrivateDataVO bPrivateDataVO) {
		int RestUpdateNameReuslt = bPrivateDataDAO.updateName(bPrivateDataVO);
		return RestUpdateNameReuslt;
	}

	
	// === 소분류 [ BIRTH ] 필드 {생년월일} ==
	// 2. 사업자 계정관리에 생년월일을 비동기식으로 수정해주는 메서드입니다.
	public int updateBirth(BPrivateDataVO bPrivateDataVO) {
		int RestUpdateBirthReuslt = bPrivateDataDAO.updateBirth(bPrivateDataVO);
		return RestUpdateBirthReuslt;
	}

	// Rest Update [건욱]
	public int restUpdate(HttpServletRequest req, HashMap<String, String> ob) {
		
//		 hashmap 출력
		for(Entry<String,String> entry : ob.entrySet()) {
			System.out.println("key : " + entry.getKey() +  "value : " + entry.getValue());
		}
		
		int RestUpdateResult = bPrivateDataDAO.restUpdate(ob);
		
		HttpSession Session = req.getSession();
		Session.setAttribute("bLogin", bPrivateDataDAO.selectbPrivateData(ob.get("whereparam")));
		
		
		return RestUpdateResult;
	}
	
	// 아이디 중복 검사
	public int useridDupl(String id) {
			return bPrivateDataDAO.useridDupl(id);
	}
	

	// 비밀번호 수정[영경]
	public String pwFind(BPrivateDataVO bPrivateDataVO) {
		bPrivateDataVO.setId(bPrivateDataDAO.selectID(bPrivateDataVO.getBpersonid()));
		String id = bPrivateDataVO.getId();
		String pw = bPrivateDataVO.getPw();
		bPrivateDataVO.setPw(Encrypt.SecurePassword(id, pw));
		int updatePwResult = bPrivateDataDAO.updatePW(bPrivateDataVO);
		return updatePwResult == 1 ? "true" : "false";
	}
}
