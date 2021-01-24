package com.drumtong.customer.service.account;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.drumtong.customer.dao.CPaymentDAO;
import com.drumtong.customer.dao.CPointDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;
import com.drumtong.customer.vo.CPointVO;
import com.drumtong.customer.vo.CPrivateDataVO;
import com.drumtong.security.AwsServiceImpl;
import com.drumtong.security.Encrypt;

@Service
public class RestCustomerAccountService {
	
	@Autowired CPrivateDataDAO cPrivateDataDAO;
	@Autowired CPaymentDAO cPaymentDAO;
	@Autowired CPointDAO cPointDAO;
	@Autowired AwsServiceImpl aws;
	
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

	public String paySave(HttpServletRequest req, HashMap<String, String> param) {
		HttpSession Session= req.getSession();
		CPrivateDataVO Login = (CPrivateDataVO)Session.getAttribute("cLogin");
		int result = 0;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberid", Login.getMemberid());
		
		System.out.println("테스트코드");
		System.out.println("type : " + param.get("type"));
		
		switch(param.get("type")) {
		case "account":
			map.put("typebank", "ACCOUNTBANK");
			map.put("bankname", param.get("accountBank"));
			map.put("typenum", "ACCOUNTNUM");
			map.put("bankNum", param.get("accountNum"));
			break;
		case "card":
			map.put("typebank", "CARDBANK");
			map.put("bankname", param.get("cardBank"));
			map.put("typenum", "CARD");
			map.put("bankNum", param.get("cardNum1") + "-" + param.get("cardNum2") + "-" + param.get("cardNum3") + "-" + param.get("cardNum4"));
			break;
		}
		
		System.out.println("map : " + map.toString());
		
		result = cPaymentDAO.updatePayment(map);
		return result == 0 ? "false" : "true";
	}

	// 포인트 충전
	public String pointSave(HttpServletRequest req, CPointVO cPointvo) {
		CPrivateDataVO Login = (CPrivateDataVO)req.getSession().getAttribute("cLogin");
		
		cPointvo.setMemberid(Login.getMemberid());
		
		int result = cPointDAO.insertPoint(cPointvo);
		result = cPaymentDAO.updatePoint(cPointvo);
		return result == 0 ? "false" : "true";
	}

	// 프로필 사진 수정
	public String changePhotoId(HttpServletRequest req, MultipartHttpServletRequest mpf) {
		HttpSession Session= req.getSession();
		CPrivateDataVO Login = (CPrivateDataVO)Session.getAttribute("cLogin");
		
		// 이전에 업데이터 한 이미지가 있다면 삭제하도록
		if(Login.getProfileimg() != null) {
			aws.fileDelete(Login.getProfileimg());
		}
		
		String memberid = Login.getMemberid();
		CPrivateDataVO cprivatedata = new CPrivateDataVO();
		cprivatedata.setMemberid(memberid);
		
		MultipartFile file = mpf.getFiles("user").get(0);
		
		String folderName = "customer/" + "memberid";
		
		int result = aws.fileUpload(file, folderName, cprivatedata, -1);
		
		if(result == 1) {
			Session.setAttribute("cLogin", cPrivateDataDAO.selectLogin(Login.getPw()));
		}
		return result == 1 ? "true" : "false";
	}

}
 