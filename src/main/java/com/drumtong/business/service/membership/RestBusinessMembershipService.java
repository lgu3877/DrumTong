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
import com.drumtong.security.Login;

@Service
public class RestBusinessMembershipService {
	

	@Autowired BPrivateDataDAO bPrivateDataDAO;		// 비즈니스 개인정보 테이블
	
	
	// 아이디 중복 검사
	public int useridDupl(String id) {
		return bPrivateDataDAO.useridDupl(id);
	}

	// 비즈니스 로그인 [영경]
	public String login(HttpServletRequest req, HttpServletResponse resp, HashMap<String, String> param) {
		BPrivateDataVO bPrivateDataVO = new BPrivateDataVO();
		bPrivateDataVO.setId(param.get("id"));
		bPrivateDataVO.setPw(param.get("pw"));
		boolean LoginResult = Login.login(req.getSession(), resp, bPrivateDataVO, param.get("storeid"));
		return LoginResult ? "true": "false";
	}
	
	// 계정이 일치한다면 이메일 전송[영경]
	public String emailConfirm(BPrivateDataVO bprivatedatavo) {
		BPrivateDataVO User = bPrivateDataDAO.pwFindEmailID(bprivatedatavo);
		// 인증번호 난수로 생성
		int VerificationCode = ((int)Math.random() * 100000) + 1;
		if(User != null) {
			// 이메일로 인증번호 전송하는 메서드
			String message = "<h1>DRUMTONG</h1>인증번호는 " + VerificationCode + "입니다.";
			sendMail(bprivatedatavo.getEmail(), message);
			// 정상적으로 입력했다면 인증번호 반환
			return VerificationCode + "";
		}
		// 잘못된 입력일 땐 -1 반환
		return "-1";
	}

	private void sendMail(String toEmail, String message) {
		// 네이버[smtp.naver.com] | 구글[smtp.gmail.com]
		String host = "smtp.naver.com";
		
		// 정보 담을 객체 생성
		Properties props = System.getProperties();
		
		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);	// SMTP 서비스 포트
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");	// ssl 방식으로 보내기
		props.put("mail.smtp.ssl.trust", host);
		
		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
		          String username = ""; // 사용자;
		          String password = "";  // 패스워드;
		          return new PasswordAuthentication(username, password);
		     }
		};
		
		Session mailSession = Session.getDefaultInstance(props, auth);
		mailSession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailSession);
		try {
			// 보내는 사람 풀 주소
			mimeMessage.setFrom(new InternetAddress("xx@naver.com"));
			mimeMessage.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(toEmail));
			
			mimeMessage.setSubject("[DRUMTONG]비밀번호 변경을 위한 인증 번호입니다.");
			mimeMessage.setText(message);
			Transport.send(mimeMessage);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} 
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
//		for(Entry<String,String> entry : ob.entrySet()) {
//			System.out.println("key : " + entry.getKey() +  "value : " + entry.getValue());
//		}
		
		int RestUpdateResult = bPrivateDataDAO.restUpdate(ob);
		
		HttpSession Session = req.getSession();
		Session.setAttribute("bLogin", bPrivateDataDAO.selectbPrivateData(ob.get("whereparam")));
		
		
		return RestUpdateResult;
	}
}
