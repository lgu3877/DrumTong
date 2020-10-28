package com.drumtong.business.service.membership;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BBusinessDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BPrivateDataDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.Encrypt;
import com.drumtong.security.Login;
import com.drumtong.security.SerialUUID;

@Service
public class BusinessMembershipService {
	
	@Autowired BBusinessDAO bBusinessDAO;			// 사업자 테이블
	@Autowired BPrivateDataDAO bPrivateDataDAO;		// 사업자 개인 정보 테이블
	@Autowired BInformationDAO bInformationDAO;		// 사업장 정보 테이블
	
	// 비즈니스 로그인 이동 (GET) [영경]
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("business/membership/businessLogin");
		return mav;
	}
	
	// 로그인 성공 여부에 따라 페이지 이동[영경]
	public ModelAndView login(HttpServletRequest req, HttpServletResponse resp, BPrivateDataVO bPrivateDatavo, String storeid){
		ModelAndView mav = new ModelAndView();
		HttpSession Session = req.getSession();
		String AddressToMove = (String)Session.getAttribute("AddressToMove");		// 인터셉터 들어가기 전 이동하려던 주소
		if(AddressToMove == null) 	AddressToMove = "/business/";
		
		
		boolean LoginResult = Login.login(Session, resp, bPrivateDatavo, storeid);		// 로그인 성공여부

		BPrivateDataVO User = ((BPrivateDataVO)Session.getAttribute("bLogin"));
		// 사업장 정보 들고오기
		if(User != null) {
			List<BInformationVO> InformationList = bInformationDAO.selectInformationList(User.getBpersonid());
			
			BInformationVO selectEST = (BInformationVO)Session.getAttribute("selectEST");
			if(InformationList != null && InformationList.size() != 0) {
				if(selectEST == null) {
					selectEST = bInformationDAO.selectEst(InformationList.get(0).getEstid());
					Session.setAttribute("selectEST", selectEST);
				}
			}
			
			for(int i = 0; i < InformationList.size(); i++) {
				String naming = InformationList.get(i).getBrandnaming();
				if(naming.length() > 4) {
					BInformationVO ChangeData = InformationList.get(i);
					naming = naming.substring(0, 4) + "..";
					ChangeData.setBrandnaming(naming);
					InformationList.set(i, ChangeData);
				}
			}
			Session.setAttribute("InformationList", InformationList);

			
		}
		
		// 3. 로그인 성공 여부로 반환할 주소 값 다르게 저장
		mav.setViewName("redirect:" + (LoginResult ? AddressToMove : "/business/membership/businessLogin/" ));


		return mav;
	}
	
	// 로그아웃 객체[영경]
	public ModelAndView logOut(HttpServletRequest req, HttpServletResponse resp) {
		String Referer = req.getHeader("referer");
		String AddressToMove = Referer != null ? Referer.split("drumtong")[1] : "/business/";
		ModelAndView mav = new ModelAndView("redirect:" + AddressToMove);
		HttpSession Session = req.getSession();
		
		Login.logout(Session, req, resp, Referer, (BPrivateDataVO)Session.getAttribute("bLogin"));
		
		// 로그아웃 했을 때 표시해주기
		Session = req.getSession();
		Session.setAttribute("bLogout", "bLogout");
		Session.removeAttribute("selectEST");
		Session.removeAttribute("InformationList");
		return mav;
	}

	// 비즈니스 회원가입 이동 (GET) [건욱]
	public ModelAndView signUp() {
		ModelAndView mav = new ModelAndView("business/membership/businessSignUp");
		return mav;
	}
	
	// 비즈니스 회원가입 (POST) [건욱]
	public ModelAndView signUp(BPrivateDataVO bPrivateDataVO) {

		ModelAndView mav = new ModelAndView("business/membership/businessFinishSignUp");
		
		// SerialUUID 생성
		String BPersonID =  SerialUUID.getSerialUUID("BBusiness", "BPersonID");
		
		// 암호화할 아이디, 패스워드 받기
		String PassWord = bPrivateDataVO.getPw();
		String ID = bPrivateDataVO.getId();
		
		// 암호화
		bPrivateDataVO.setPw(Encrypt.SecurePassword(ID, PassWord));
		
		// 사업자 개인정보 VO에 BPersonID UUID 넣어준다.
		bPrivateDataVO.setBpersonid(BPersonID);
		
		System.out.println("====================");
		System.out.println("BPersonID : " + BPersonID);
		System.out.println("bPrivateVO : " + bPrivateDataVO.getId());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getPw());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getName());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getBirth());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getGenderboolean());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getPhonenum());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getMainaddress());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getDetailaddress());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getEmail());
		System.out.println("bPrivateVO : " + bPrivateDataVO.getDelegatecrn());
		System.out.println("====================");
		
		// 1. BBusiness 신규 데이터 생성	( 사업자 테이블 )
		
		int BBusinessReuslt = bBusinessDAO.insertSignUp(BPersonID);
		
		
		
		// 2. BPrivateData 신규 데이터 생성	( 사업자 개인정보 테이블 )
		int PrivateDataResult = bPrivateDataDAO.insertSignUp(bPrivateDataVO);
		
		
		
		return mav;
	}

	// 사업자 회원가입 완료 이동 (GET) [건욱]
	public ModelAndView finishSignUp() {
		ModelAndView mav = new ModelAndView("business/membership/businessFinishSignUp");
		return mav;
	}
	


	// 사업자 계약해지 & 패스워드 재확인 이동 (GET) [건욱]
	public ModelAndView pwReconfirm() {
		ModelAndView mav = new ModelAndView("business/membership/businessPWReconfirm");
		return mav;
	}
	
	

	// 사업자 계정 정보 관리 이동 (GET) [건욱]
	public ModelAndView accountInfo() {
		ModelAndView mav = new ModelAndView("business/membership/businessAccountInfo");
		return mav;
	}


	// 사업자 계정 찾기 이동 (GET) [영경]
	public ModelAndView accountFind() {
		ModelAndView mav = new ModelAndView("business/membership/businessAccountFind");
		return mav;
	}
	
	// 사업자 ID 찾기 결과 페이지로 이동 (POST) [영경]
	public ModelAndView idFind(BPrivateDataVO bprivatedatavo, String option, int[] birth) {
		ModelAndView mav = new ModelAndView("business/membership/businessIDFind");
		String UserID = null;
		bprivatedatavo = updateData(bprivatedatavo);
		switch(option) {
			case "NamePhoneNum":
				UserID = bPrivateDataDAO.idFindNamePhoneNum(bprivatedatavo);
				break;
			case "NameBirth":
				bprivatedatavo.setBirth(birth[0] + "-" + (birth[1] < 10 ? "0" : "") + birth[1] + "-" + (birth[2] < 10 ? "0" : "") + birth[2]);
				UserID = bPrivateDataDAO.idFindNameBirth(bprivatedatavo);
				break;
			case "NameEmail":
				UserID = bPrivateDataDAO.idFindNameEmail(bprivatedatavo);
				break;
			case "CRNEmail":
				UserID = bPrivateDataDAO.idFindCRNEmail(bprivatedatavo);
				break;
			case "CRNPhone":
				UserID = bPrivateDataDAO.idFindCRNPhone(bprivatedatavo);
				break;
		}
		if("".equals(UserID) || UserID != null) {
			UserID = UserID.substring(0,UserID.length() - 3) + "***";
			UserID = "회원님의 아이디는 [ " + UserID + " ]입니다.";
		} else {
			UserID = "회원정보를 찾을 수 없습니다.";
		}
		mav.addObject("result", UserID);
		return mav;		
	}

	// 사업자 PW 찾기 이동 (POST) [영경]
	public ModelAndView pwFind(BPrivateDataVO bprivatedatavo, String option) {
		ModelAndView mav = new ModelAndView();
		bprivatedatavo = updateData(bprivatedatavo);
		BPrivateDataVO User = null;
		switch(option) {
		case "phoneNameID":
			User = bPrivateDataDAO.pwFindPhoneNameID(bprivatedatavo);
			break;
		case "emailID":
			User = bPrivateDataDAO.pwFindEmailID(bprivatedatavo);
			break;
		case "AccountInfo":
			User = bPrivateDataDAO.selectbPrivateData(bprivatedatavo.getBpersonid());
			break;
		}
		mav.setViewName(User == null ? "business/membership/businessAccountFind" : "business/membership/businessPWFind");
		mav.addObject("User", User);
		if(option.equals("AccountInfo")) {
			mav.addObject("AccountPage", "AccountPage");
		}
		return mav;		
	}
	
	private BPrivateDataVO updateData(BPrivateDataVO bprivatedatavo) {
		String Phonenum = bprivatedatavo.getPhonenum();
		String Delegatecrn = bprivatedatavo.getDelegatecrn();
		if(Phonenum != null)
			bprivatedatavo.setPhonenum(Phonenum.substring(0,3) + "-" + Phonenum.substring(3,7) + "-" + Phonenum.substring(7));
		if(Delegatecrn != null)
			bprivatedatavo.setDelegatecrn(Delegatecrn.substring(0,3) + "-" + Delegatecrn.substring(3,5) + "-" + Delegatecrn.substring(5));
		return bprivatedatavo;
	}

	public ModelAndView pwChange() {
		return new ModelAndView("redirect:/business/");
	}
	
	
}
