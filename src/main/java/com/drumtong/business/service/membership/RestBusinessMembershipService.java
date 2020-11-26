package com.drumtong.business.service.membership;

import java.util.HashMap;
import java.util.Map.Entry;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BPrivateDataDAO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.AwsServiceEmail;
import com.drumtong.security.Encrypt;
import com.drumtong.security.Login;

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
			return AwsServiceEmail.sendMailTypeAuth(User.getEmail()) + "";
//			return Mail.mailSendTypeAuth(User.getEmail()) + "";
			
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
		int RestUpdateResult = 0;
		
		// 패스워드 일 시에 다른 SQL를 불러오기 위해서 예외처리를 해준다.
		String value = ob.get("fieldname");
		
		/*
		 * 만약에 사용자가 암호 버튼을 클릭했다면 
		 * javascript의 object에 id라는 필드를 추가해서 id 값을 히든으로 넣어줘야한다.
		 * ex) 'id' : 'lgu3877'
		 * 
		 * 입력받은 아이디와 비밀번호는 암호화를 위해 전역 클래스인 Encrypt의 SecurePassword 메서드에 넣어준다.
		 * 
		 * 암호화된 encryptPW로 DB와 비교분석을 한 뒤 일치하면 새 비밀번호 설정할 수 있는 페이지로 이동해준다.
		 * 
		 */
		if(value.equals("pw")) {
			String id = ob.get("id");
			String pw = ob.get("paramdata");
			
			// 암호화
			String encryptPW = Encrypt.SecurePassword(id, pw);
			
			// 암호화된 값 hashmap에 수정해주기
			ob.put("paramdata", encryptPW);
			
			
			RestUpdateResult = bPrivateDataDAO.checkEncryptPW(ob); 
			System.out.println(RestUpdateResult);
		}
		else {
			
			RestUpdateResult = bPrivateDataDAO.restUpdate(ob);
			
			
			
			HttpSession Session = req.getSession();
			Session.setAttribute("bLogin", bPrivateDataDAO.selectbPrivateData(ob.get("whereparam")));
		}
		
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
