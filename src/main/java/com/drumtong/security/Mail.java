package com.drumtong.security;

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
// 메일을 전송[사용법]
// type : type이 'authentication' 이면 인증번호 전송, type이 'free'이면 원하는 형식으로 메일 전송
// 1. 만약 인증번호를 전송하게 끔 하고 싶다면
// 	mailSendTypeAuth([받는 사람 메일]);	=> 반환값은 인증번호
// 		=> (메일 형식)제목 : [DRUMTONG]비밀번호 변경을 위한 인증 번호입니다.
// 		=> (메일 형식)내용 : [DRUMTONG]인증번호는 '000000'입니다."
// 2. 원하는 내용의 메일을 전송하고 싶다면		=> 반환값 void
// mailSend([원하는 제목], [원하는 내용], [받는 사람 메일]);
public class Mail {
	public static int mailSendTypeAuth(String toEmail) {
		int Code = ((int)(Math.random() * 1000000)) + 1;
		String Subject = "[DRUMTONG]비밀번호 변경을 위한 인증 번호입니다.";
		String Content = "[DRUMTONG]인증번호는 '" + Code + "'입니다.";
		mailSend(Subject, Content, toEmail);
		return Code;
	}
	
	public static void mailSend(String subject, String content, String toEmail) {
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
			String username = "drumtonglaundry"; // 사용자;
			String password = "drumtong@laundry";  // 패스워드;
			protected PasswordAuthentication getPasswordAuthentication() {
		          return new PasswordAuthentication(username, password);
		     }
		};
		Session mailSession = Session.getDefaultInstance(props, auth);
		mailSession.setDebug(true);
		
		Message mimeMessage = new MimeMessage(mailSession);
		try {
			// 보내는 사람 풀 주소
			mimeMessage.setFrom(new InternetAddress("drumtonglaundry@naver.com"));
			mimeMessage.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(toEmail));
			
			mimeMessage.setSubject(subject);
			mimeMessage.setText(content);
			Transport.send(mimeMessage);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} 
	}
}
