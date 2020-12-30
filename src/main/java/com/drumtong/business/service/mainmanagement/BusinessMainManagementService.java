package com.drumtong.business.service.mainmanagement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.drumtong.business.dao.BDeliveryAreaDAO;
import com.drumtong.business.dao.BImageDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BManagementDAO;
import com.drumtong.business.dao.BMenuDAO;
import com.drumtong.business.dao.BScheduleDaysDAO;
import com.drumtong.business.dao.BScheduleTimeDAO;
import com.drumtong.business.dao.BTempHolidayDAO;
import com.drumtong.business.dao.BTempSuspensionDAO;
import com.drumtong.business.vo.BDeliveryAreaVO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.BScheduleDaysVO;
import com.drumtong.business.vo.BScheduleTimeVO;
import com.drumtong.business.vo.BTempHolidayVO;
import com.drumtong.business.vo.BTempSuspensionVO;
import com.drumtong.security.AwsServiceImpl;
import com.google.gson.Gson;

@Service
public class BusinessMainManagementService {
	/*
	 * [건욱]
	 * ###################################################################################
	 * # 																				 # 
	 * #	계약 관련 메서드에 DAO를 불러올 때														 #
	 * # 	insert로 시작하는 메서드는 신규 데이터 입력이고											 #
	 * # 	update로 시작하는 메서드는 이미 회원가입 때 생성된 null데이터에 신규데이터를 업데이트 하는 메서드입니다.		 #
	 * #																				 #	
	 * ###################################################################################
	 */
	// 매장관리 DAO
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BImageDAO bImageDAO;
	@Autowired BMenuDAO bMenuDAO;
	@Autowired BDeliveryAreaDAO bDeliveryAreaDAO;
	@Autowired BInformationDAO bInformationDAO;
	
	// 일정관리 DAO
	@Autowired BScheduleTimeDAO bScheduleTimeDAO;
	@Autowired BScheduleDaysDAO bScheduleDaysDAO;
	@Autowired BTempHolidayDAO bTempHolidayDAO;
	@Autowired BTempSuspensionDAO bTempSuspensionDAO;
	@Autowired AwsServiceImpl aws;
	
	
	// 비즈니스 매장관리 페이지로 이동 (GET) [건욱]
	public ModelAndView shopManagement(HttpServletRequest req) {
 		ModelAndView mav = new ModelAndView("business/mainmanagement/businessShopManagement");
//		ModelAndView mav = new ModelAndView("business/test"); //test 용임 지울 시 위에 코드 활성화 시켜줄 것
		
 		/*
 		 * status 값이 FAIL이면 DefaultCategory 값을 BManagement 테이블에서 가져온다.
 		 * 초기 메뉴 등록을 할 때 기본 템플릿으로 제공해준다.
 		 * 
 		 * status 값이 SUCCESS이면 .
 		 */
 		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 		
 	    
 	    if( bInformationVO.getStatus().equals("FAIL") ) {
 	    	// defaultcategory 의 데이터형식이 'top/pants/suit/hat/underwear/cutton/'
 	    	List<String> defaultcategory = Arrays.asList((bManagementDAO.selectDefaultCategory(estid).split("/")));
 	    	mav.addObject("defaultcategory", (new Gson()).toJson(defaultcategory));
 	    
 	    }
		// MultipartFile mpf = new MultipartFile();
//		aws.s3FileUpload(file, folderName);
		return mav;
	}

	
	
	// 비즈니스 일정관리 페이지로 이동 (GET) [건욱]
	public ModelAndView scheduleManagement() {
		ModelAndView mav = new ModelAndView("business/mainmanagement/businessScheduleManagement");
		
		return mav;
	}


	// 비즈니스 온라인계약 {신규매장관리} 데이터 등록  (POST) [건욱]
	/*
	 * 
	 * 온라인 계약에 포함되는 마지막 단계이다.
	 * 새 데이터가 입력되는 테이블은 다음과 같다.
	 * 
	 * [1] BManagement[매장관리]
	 * [2] BImage[매장사진] <- AWS S3에 저장됨
	 * [3] BMenu[매장메뉴] 
	 * [4] BDeliveryArea[배달지역]
	 * 
	 * [1] -> 매장관리는 {소개글, 배달여부, 퀵여부} 데이터가 BManagementVO를 통해서 데이터가 들어와 SQL문으로 RDS서버에 넣어준다.
	 * 
	 * [2] -> BImage는 AWS S3에 이미지가 저장된다. 
	 * 	여기서 정적인 이미지(로고, 운영자가 직접 넣는 이미지)는 Eclipse내부에 저장이되고
	 * 	동적인 이미지(매장사진, 고객프로필 사진 등 사용자가 넣는 이미지)는 S3에 저장이 된다.
	 * 
	 * 	S3에 저장하기 위해서 security패키지에 AwsServiceImpl.Class를 호출해야하며 
	 * 	다중으로 이미지를 업로드하기 위해서는 [multipleUpload] 메서드를 호출하고
	 * 	단일 파일을 업로드 및 수정을 하기 위해서는 [s3FileUpload] 메서드를 호출한다.
	 * 	S3파일 삭제를 원하면 [s3FileDelete] 메서드를 호출한다.
	 * 
	 * 	S3에 저장되는 이미지 파일 이름은 STORE_IMAGE + UUID 형식으로 저장이되며 중첩이 안되게 저장이 된다.
	 * 	또한 폴더의 형식은 ESTID/STORE_IMAGE + UUID 형식으로 저장이되며
	 * 	여기서 ESTID는 폴더명이 되겠다.
	 * 	그러므로 이렇게 저장하기 위해서 ESTID가 활용된다.
	 * 
	 * [3] -> 메장 메뉴는 {메뉴이름, 가격, 퀵가격, 예상소요시간}의 신규 데이터를 입력해준다..
	 * 
	 * [4] -> 배달 지역은  {시도,시군구,시구,읍면동,통리,반}의 신규 데이터를 입력해준다.
	 * 
	 * 
	 * 
	 */
	public ModelAndView shopManagement(MultipartHttpServletRequest mpf, BManagementVO bManagementVO,
									   BImageVO bImageVO, BMenuVO bMenuVO,	
									   BDeliveryAreaVO bDeliveryAreaVO) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		// ESTID는 혹시 프론트에서 설정을 안할 것을 대비해서 적어 놓는 것임. (혹여나 작업을 했다면 해당 코드는 지울 것)
		String ESTID = bManagementVO.getEstid(); 
		
		// 1. 매장관리 테이블에  {소개글,배달여부,퀵여부}를 업데이트 시켜준다. 
		int BManagementResult = bManagementDAO.updateConstract(bManagementVO);

		// 2. 매장사진 테이블에  {저장이미지}를 업데이트 시켜준다.
		// 계약을 위한 매장사진 등록이기 떄문에 POST를 염두하고 작업해준다.
		// 다중 이미지 업로드이기 떄문에 multipleUpload 메서드를 호출해준다.
		bImageVO.setEstid(ESTID);	// ESTID를 세팅하는 이유는 S3 저장방식이 ESTID(폴더명)/ESTID + UUID로 저장되기 때문에 sql문에 필요하다.
		aws.multipleUpload(mpf, ESTID, bImageVO);
		
		

		// 3. 메뉴 테이블에  {메뉴이름, 가격, 퀵가격, 예상소요시간}를 업데이트 시켜준다.
		int BMenuResult = bMenuDAO.insertConstract(bMenuVO);
		
		
//		// 4. 배달지역 테이블에  {시도,시군구,시구,읍면동,통리,반}를 업데이트 시켜준다. 이 메서드는 추후에 데이터 타입을 보고 작업할 수 있도록 한다.
		int BDeliveryAreaResult = bDeliveryAreaDAO.insertConstract(bDeliveryAreaVO);
//		
		
		return mav;
	}



	// 비즈니스 온라인계약 {신규일정관리} 데이터 등록 (POST) [건욱]
	public ModelAndView scheduleManagement(BScheduleDaysVO bScheduleDaysVO, BScheduleTimeVO bScheduleTimeVO,
										   BTempHolidayVO bTempHolidayVO, BTempSuspensionVO bTempSuspensionVO) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		// 1. 영업일정관리 {첫 번째 주, 두 번째 주, 세 번째 주, 네 번째 주, 다섯 번째 주, 여섯 번째 주, 공휴일 휴무 여부}를 업데이트 시켜준다.
		int BScheduleDaysResult = bScheduleDaysDAO.updateConstract(bScheduleDaysVO);
		
		// 2. 영업시간관리 {평일, 토요일, 일요일}시간을 업데이트 시켜준다.
		int BScheduleTimeResult = bScheduleTimeDAO.updateConstract(bScheduleTimeVO);
		
		// 3. 영업임시휴일관리 {임시휴일 시작일, 임시휴일 마지막일}을 업데이트 시켜준다.
		int BTempHolidayResult = bTempHolidayDAO.insertConstract(bTempHolidayVO);
		
		// 4. 영업임시중지관리 {임시중지 시작일, 임시중지 마지막일}을 업데이트 시켜준다.
		int BTempSuspensionResult = bTempSuspensionDAO.insertConstract(bTempSuspensionVO);
		
		
		return mav;
	}

	
}
