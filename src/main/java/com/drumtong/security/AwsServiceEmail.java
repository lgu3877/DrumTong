package com.drumtong.security;

import org.springframework.stereotype.Service;

import com.amazonaws.regions.Regions;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailService;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClientBuilder;
import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;

@Service  // [건욱]
public class AwsServiceEmail {

	// ! 하루에 최대 전송할 수 있는 이메일 개수는 50,000 건 입니다. 더 많은 이메일 건수를 요청할 시에 AWS Support case에 문의합니다!
	// link : https://console.aws.amazon.com/support/home#/case/
	
	// "보내는 사람"의 주소를 적으면 됩니다.
	// 이 주소는 반드시 아마존 SES와 확인이 되어야합니다.
	static final String FROM = "drumtonglaundry@naver.com";

	// "받는 사람"의 주소를 적어야합니다. 현재 메서드에서는 매개 변수로 받아오는 변수입니다.
	//	static final String TO = "sample@naver.com";

	// 이 전자 메일에 사용할 구성 집합.
	// 구성 집합을 사용하지 않으려면 다음 변수와 .withConfigurationSetName(CONFIGSET); 인수에 주석을 달으십시오.
	//	static final String CONFIGSET = "ConfigSet";

	
	// 이메일이 제목 부분입니다.
	static final String SUBJECT = "Drumtong 이메일 인증 번호";


	// 이메일의 본문 부분입니다.
	static final String HTMLBODY = "<h1>Drumtong 이메일 인증 번호</h1>"
			+ "<p>Drumtong에서 알려드립니다.</p> <br>"
			+ "<p>이 이메일 주소와 연결된 Drumtong 계정의 인증번호 요청을 받았습니다.</p> <br>"
			+ "<p>아래 인증번호를 확인하여서 해당 이메일을 인증해주십시요. </p>"
			+ "<br> <br>"
			+ "<b>이메일 인증 번호  : </b><h2>%s</h2>"	// <- 이곳에 이메일 인증번호를 넣어주세요.
			+ "<p>인증번호를 요청하지 않은 경우 이 이메일을 무시해주세요. </p> <br>"
			+ "<p>Drumtong은 비밀번호, 신용카드, 은행 계좌 번호를 묻거나 확인하라는 이메일을 절대 보내지 않습니다. "
			+ "계정 정보를 업데이트 하라는 링크가 포함된 의심스러운 이메일을 받으신 경우 절대 클릭하지마세요!"
			+ "<br><br>"
			+ "<p>Drumtong을 이용해 주셔서 감사합니다. </p>"
			+ "<br>"
			+ "안녕히 계십시오."
			+ "Drumtong 측 드림";


	// HTML이 아닌 전자 메일 클라이언트가 있는 수신인의 전자 메일 본문입니다.
	static final String TEXTBODY = "Drumtong 이메일 인증 번호" 
								 + "이 이메일 주소와 연결된 Drumtong 계정의 인증번호 요청을 받았습니다."
								 + "아래 인증번호를 확인하여서 해당 이메일을 인증해주십시요. "
								 + "이메일 인증 번호  : %s" // <- 이곳에 이메일 인증번호를 넣어주세요.
								 + "인증번호를 요청하지 않은 경우 이 이메일을 무시해주세요. "
								 + "Drumtong은 비밀번호, 신용카드, 은행 계좌 번호를 묻거나 확인하라는 이메일을 절대 보내지 않습니다. "
								 + "계정 정보를 업데이트 하라는 링크가 포함된 의심스러운 이메일을 받으신 경우 절대 클릭하지마세요!"
								 + "Drumtong을 이용해 주셔서 감사합니다. "
								 + "안녕히 계십시오."
								 + "Drumtong 측 드림";

	
	
	
//	public int useSES(String emailTO) {
//		try {
//			AmazonSimpleEmailService client = AmazonSimpleEmailServiceClientBuilder.standard()
//					// Amazon SES를 사용하는 Region을 해당 Regions에 넣어주면됩니다. 
//					// 전 서울 Region을 사용하고 있으므로 AP_NORTHEAST_2를 넣어줍니다.
//					.withRegion(Regions.AP_NORTHEAST_2).build();
//			SendEmailRequest request = new SendEmailRequest().withDestination(new Destination().withToAddresses(emailTO))
//					.withMessage(new Message()
//							.withBody(new Body().withHtml(new Content().withCharset("UTF-8").withData(HTMLBODY))
//									.withText(new Content().withCharset("UTF-8").withData(TEXTBODY)))
//							.withSubject(new Content().withCharset("UTF-8").withData(SUBJECT)))
//					.withSource(FROM);
//					// configuration 메서드를 사용하지않으면 주석처리를 해주면 됩니다.
//					// .withConfigurationSetName(CONFIGSET);
//			client.sendEmail(request);
//			System.out.println("Email sent!");
//			return 1;
//		} catch (Exception ex) {
//			System.out.println("The email was not sent. Error message: " + ex.getMessage());
//			return 0;
//		}
//	}
	
	//-----------------------------아래부터 영경 수정---------------------------------------------------
	public static void useSES(String subject, String htmlcontent, String textcontent, String emailTO) {
		System.out.println("메일 제목 : " + subject);
		System.out.println("메일 내용(HTML) : " + htmlcontent);
		System.out.println("메일 내용(text) : " + textcontent);
		System.out.println("받는 사람 메일 : " + emailTO);
		try {
			AmazonSimpleEmailService client = AmazonSimpleEmailServiceClientBuilder.standard()
					// Amazon SES를 사용하는 Region을 해당 Regions에 넣어주면됩니다. 
					// 전 서울 Region을 사용하고 있으므로 AP_NORTHEAST_2를 넣어줍니다.
					.withRegion(Regions.AP_NORTHEAST_2).build();
			SendEmailRequest request = new SendEmailRequest().withDestination(new Destination().withToAddresses(emailTO))
					.withMessage(new Message()
							.withBody(new Body().withHtml(new Content().withCharset("UTF-8").withData(htmlcontent))
									.withText(new Content().withCharset("UTF-8").withData(textcontent)))
							.withSubject(new Content().withCharset("UTF-8").withData(subject)))
					.withSource(FROM);
					// configuration 메서드를 사용하지않으면 주석처리를 해주면 됩니다.
					// .withConfigurationSetName(CONFIGSET);
			client.sendEmail(request);
			System.out.println("Email sent!");
		} catch (Exception ex) {
			System.out.println("The email was not sent. Error message: " + ex.getMessage());
		}
	}
	
	// 일반 메일 보내기 sendMail(제목, HTML내용, 일반텍스트내용, 받는 사람 이메일)
	
	// 인증번호 메일 보내기 (받는 사람 이메일)
	public static int sendMailTypeAuth(String toEmail) {
		int Code = ((int)(Math.random() * 1000000)) + 1;
		useSES(SUBJECT, String.format(HTMLBODY, Code), String.format(TEXTBODY, Code), toEmail);
		return Code;
	}
}
