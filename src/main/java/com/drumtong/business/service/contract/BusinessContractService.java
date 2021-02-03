package com.drumtong.business.service.contract;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BEstablishmentDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.dao.BScheduleDaysDAO;
import com.drumtong.business.dao.BScheduleTimeDAO;
import com.drumtong.business.vo.BEstablishmentVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BPaymentVO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.security.AwsServiceImpl;
import com.drumtong.security.Login;
import com.drumtong.security.SerialUUID;

@Service
public class BusinessContractService {

	// 아마존 S3 서비스 
	@Autowired AwsServiceImpl aws; 
	
	private static final String BInformationVO = null;
	@Autowired BEstablishmentDAO bEstablishmentDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired BPaymentDAO bPaymentDAO;
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BScheduleTimeDAO bScheduleTimeDAO;
	@Autowired BScheduleDaysDAO bScheduleDaysDAO;
	
	
	// 비즈니스 온라인 계약으로 이동 (GET) [건욱]
	public ModelAndView contract() {
		ModelAndView mav = new ModelAndView("business/contract/businessContract");
		return mav;
	}
	

	
	/* 온라인 계약 매장 생성 (POST) [건욱]
	 기본으로 생성해주어야할 테이블도 같이 생성해줍니다.
	BEstablishment 테이블을 생성하기 위해 resp에서 bpersonid값을 가져와줍니다.
	
	현재 메서드에서 생성되는 테이블은 다음과 같습니다.
		1. BEstablishment #사업장 테이블
		2. BInformation #사업장 정보 테이블
		3. BPayment #결제 테이블
		4. BManagement #매장관리 테이블
		5. BScheduleTime #영업시간관리 테이블
		6. BScheduleDays #정기휴무일정관리 테이블

		S3에 저장되는 파일은 
		BInformation 테이블에 ReportCard / License  두 개의 필드가 저장되며
		BPayment에 CopyOfBankBook 필드가 저장됩니다.
		
		3개의 파일은 S3에 매장ESTID/Contract/STOREIMG_ESTID 형식으로 저장됩니다.
	*
	*/
	@Transactional	// 복잡한 쿼리가 구현되기 때문에 트랜잭션 어노테이션을 추가했습니다.
	public ModelAndView contract(BInformationVO bInformationVO, BPaymentVO bPaymentVO, 
									BManagementVO bManagementVO, HttpServletRequest req,MultipartHttpServletRequest mpf) {

		
		ModelAndView mav = new ModelAndView("redirect:/business/");
		
		// BEstablishment 테이블을 위한 ESTID UUID 생성
		/*
		 * 한 사업자가 여러 개의 사업장을 운영할 수 있기 때문에 고려한 
		 * 테이블 구조입니다.
		 * ESTID(사업장아이디)는 새로 생성해주고 BPersonID(사업자ID)의 값은
		 * 현재 로그인하고 있는 세션에서 가져와줍니다.
		 * 
		 */
		String ESTID = SerialUUID.getSerialUUID("BEstablishment", "ESTID");

		// bpersonid값을 가져와주기 위해 sessoin 생성
		
		HttpSession Session = req.getSession();
		BPrivateDataVO User = ((BPrivateDataVO)Session.getAttribute("bLogin"));
		String Bpersonid = User.getBpersonid();
		
		
		
		
		
		//BEstablishment 테이블 생성을 위해 데이터를 셋팅해준다.
		
		BEstablishmentVO bEstablishmentVO = new BEstablishmentVO();
		
		bEstablishmentVO.setEstid(ESTID);
		bEstablishmentVO.setBpersonid(Bpersonid);
		
		
		
		
		// 1. 사업장 BEstablishment 테이블에 정보 입력

		int BEstablishmentResult = bEstablishmentDAO.insertSignUp(bEstablishmentVO);
		

		

		// 2. 사업장 BInformation 테이블에 정보 입력
		
		bInformationVO.setEstid(ESTID);
		
		
		int BInformationResult = bInformationDAO.insertSignUp(bInformationVO);
		
		
		
		
		// 3. 사업장 BPayment 테이블에 정보 입력

		bPaymentVO.setEstid(ESTID);
		int BPaymentResult = bPaymentDAO.insertSignUp(bPaymentVO);
		
		
		bManagementVO.setDefaultcategory(bManagementVO.getDefaultcategory().replace(",", "/") + "/");
		
		
		
		// 4. 사업장 BManagement 테이블에 '기본 카테고리' 정보 입력

		bManagementVO.setEstid(ESTID);
		int BManagementResult = bManagementDAO.insertSignUp(bManagementVO);
		
		
		
		// 5. 사업장 BScheduletime 테이블 정보 입력
		int BScheduleTimeResult = bScheduleTimeDAO.insertSignUp(ESTID);
		
		
		
		
		// 6. 사업장 BScheduleDays 테이블 정보 입력
		int BScheduleDaysResult = bScheduleDaysDAO.insertSignUp(ESTID);
		
		
		/* S3에 이미지 파일들을 저장해주기 위한 메서드이다.
		 * 여기서 처리해주는 필드 값들은 다음과 같다.
		 * 1. BInformation 테이블 -> ReportCard(영업신고증) && License(사업자등록증) S3 내부의 Contract폴더에 저장된다.
		 * 2. BPayment 테이블 -> CopyOfBankBook(통장사본) S3 내부의 Contract폴더에 저장된다.
		 * 
		 * 	파일 리스트 / 폴더 / 객체            순서로 매개변수를 전달해준다.
		 * 
		 * 
		 * 다중 이미지 업로드이기 떄문에 multipleUpload 메서드를 호출해준다.
		 *  
		 */
		BPrivateDataVO bPrivateDataVO = (BPrivateDataVO)Session.getAttribute("bLogin");
 	    String bpersonid = bPrivateDataVO.getBpersonid();
 	    
 	    
 	    String folderName = "business/" + bpersonid + "/" + ESTID; 
 	    
		aws.multipleUpload(mpf, folderName, bInformationVO, req);
		
		// [영경 추가] InformationList를 갱신해줌
		Login.getInformationList(User, Session, bInformationDAO);
		
		return mav;
	}


	// 비즈니스 온라인 프리미엄 광고 계약으로 이동 (GET) [건욱]
	public ModelAndView premiumAd(HttpServletRequest req) {
		
		// premiumBoolean를 세션을 받아와준다.
		String bol = ((BInformationVO)req.getSession().getAttribute("selectEST")).getPremiumboolean();

		// boolean의 결과 값에 따라 'Y'이면 business로 우회해주고 'N'이면 프리미엄광고 페이지로 이동시켜준다.
		String route = bol.equals("Y") ? "redirect:/business/" : "business/contract/businessPremiumAd"; 
		
		ModelAndView mav = new ModelAndView(route);
		return mav;
	}

	
	// 비즈니스 온라인 프리미엄 광고 계약 (POST)) [건욱]
	// BInformation(사업장정보 테이블)의 Premium Boolean 값은  매개변수 값으로 String을 가져온다.
	public ModelAndView premiumAd(BInformationVO bInformationVO, BPaymentVO bPaymentVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("redirect:/business/");
		HttpSession Session = req.getSession();
		BPrivateDataVO User = (BPrivateDataVO)Session.getAttribute("bLogin");
		
		// estid를 세션을 받아와준다.
		String estid = ((BInformationVO)Session.getAttribute("selectEST")).getEstid();
		
		// 입력받은 카드번호를  [OOOO-OOOO-OOOO-OOO] 형식으로 수정해준다.
		bPaymentVO.setEstid(estid);
		bPaymentVO.setCardnum(bPaymentVO.getCardnum().replace(",", "-"));
		
		
		
		// 1. 프리미엄 광고 결제 수단 정보를 업데이트 시켜준다.
		int BPaymentResult = bPaymentDAO.updatePremiumPay(bPaymentVO);
		
		System.out.println("BPaymentResult : " + BPaymentResult);
		
		// 2. 광고 결제 수단이 정상적으로 작동이 되면 프리미엄 광고 여부를 업데이트 시켜준다.
		if(BPaymentResult == 1) {
			bInformationVO.setEstid(estid);
			bInformationVO.setPremiumboolean("Y");
			int BInformationResult = bInformationDAO.updatePremiumBoolean(bInformationVO);
			System.out.println("BInformationResult : " + BInformationResult);
		}
		
		// [영경 추가] InformationList를 갱신해줌
		Login.getInformationList(User, Session, bInformationDAO);
		
		return mav;
	}
	
	
	
	
}
