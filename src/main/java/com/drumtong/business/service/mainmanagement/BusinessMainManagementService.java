package com.drumtong.business.service.mainmanagement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.business.vo.BScheduleDaysVO;
import com.drumtong.business.vo.BScheduleTimeVO;
import com.drumtong.business.vo.BTempHolidayVO;
import com.drumtong.business.vo.BTempSuspensionVO;
import com.drumtong.map.dao.MMapAddressListDAO;
import com.drumtong.security.AddressListSetting;
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
	@Autowired AwsServiceImpl aws;
	
	// 일정관리 DAO
	@Autowired BScheduleTimeDAO bScheduleTimeDAO;
	@Autowired BScheduleDaysDAO bScheduleDaysDAO;
	@Autowired BTempHolidayDAO bTempHolidayDAO;
	@Autowired BTempSuspensionDAO bTempSuspensionDAO;
	
	
	// 지역 데이터 DAO
	@Autowired MMapAddressListDAO mMapAddressListDAO;
	
	
	
	// 비즈니스 매장관리 페이지로 이동 (GET) [건욱]
	public ModelAndView shopManagement(HttpServletRequest req) {
 		ModelAndView mav = new ModelAndView("business/mainmanagement/businessShopManagement");
		

		if(checkEstStatus(req, "ShopManagement")) return mainMove(req, "ShopManagement");
 		
 		/*
 		 * status 값이 FAIL이면 DefaultCategory 값을 BManagement 테이블에서 가져온다.
 		 * 초기 메뉴 등록을 할 때 기본 템플릿으로 제공해준다.
 		 * 
 		 * status 값이 SUCCESS이면 .
 		 */
 		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 		
 	    // 2차 온라인 계약에 매장관리를 완료했다면 전에 입력했던 데이터를 불러와준다.
 	    	
 	    // 매장 사진 데이터
 	   	mav.addObject("bImageList",(new Gson()).toJson(bImageDAO.selectImageList(estid)));
 	   	
 	   	// bManagement 테이블 [매장 소개글] [매장 메뉴] [세탁물 수령방법]
 	   	mav.addObject("bManagement", (new Gson()).toJson(bManagementDAO.selectCustomerDetail(estid)));
 	   	
 	   	// Menu에 대한 데이터를 보내줍니다.
 	   	mav.addObject("bMenu", (new Gson()).toJson(bMenuDAO.select(estid)));
 	    
 	    // 기본 카테고리 데이터 	    
 	    List<String> defaultcategory = Arrays.asList((bManagementDAO.selectDefaultCategory(estid).split("/")));
    	mav.addObject("defaultcategory", (new Gson()).toJson(defaultcategory));
		
    	
    	// 지역 데이터 리스트 ( AddressListSetting class는 static이라 상시호출가능)
    	HashMap<String, HashMap<String , ArrayList<String>>> addressList = AddressListSetting.getAddressList();
 	    mav.addObject("addressList", addressList);
    	
    	
 	    // 대분류 중분류 카테고리를 셋팅해주는 함수입니다.
	    HashMap<String, ArrayList<String>> menuCategories = menuCategoriesSetting(estid);
	    
	    // 선택한 기본카테고리도 같이 셋팅해줍니다.
	    for(String category : defaultcategory) {
	    	ArrayList<String> tmp = new ArrayList<String>();
	    	menuCategories.put(category, tmp);
	    }
	    
	    
	    //  대분류, 중분류 카테고리 모음
	    mav.addObject("menuCategories", (new Gson()).toJson(menuCategories));
	    
		// MultipartFile mpf = new MultipartFile();
 	    // aws.s3FileUpload(file, folderName);
 	    
	    
    	return mav;
	}

	
	// 비즈니스 일정관리 페이지로 이동 (GET) [건욱]
	public ModelAndView scheduleManagement(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("business/mainmanagement/businessScheduleManagement");
		
		if(checkEstStatus(req, "ScheduleManagement")) return mainMove(req, "ScheduleManagement");
		
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
	public ModelAndView shopManagement(HttpServletRequest req, MultipartHttpServletRequest mpf, 
									   BManagementVO bManagementVO,
									   BImageVO bImageVO, BMenuVO bMenuVO, 	
									   BDeliveryAreaVO bDeliveryAreaVO) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    BPrivateDataVO bPrivateDataVO = (BPrivateDataVO)Session.getAttribute("bLogin");
	    String bpersonid = bPrivateDataVO.getBpersonid();
	    
	    
	    // S3에 저장된 폴더 이름을 정의해줍니다.
	    String folderName = "business/"+ bpersonid + "/" + estid; 
	    
 	    
 	    
		// 1. 매장관리 테이블에  {소개글,배달여부,퀵여부}를 업데이트 시켜준다. 
		int BManagementResult = bManagementDAO.updateConstract(bManagementVO);

		// 2. 매장사진 테이블에  {저장이미지}를 업데이트 시켜준다.
		// 계약을 위한 매장사진 등록이기 떄문에 POST를 염두하고 작업해준다.
		// 다중 이미지 업로드이기 떄문에 multipleUpload 메서드를 호출해준다.
		bImageVO.setEstid(estid);	// ESTID를 세팅하는 이유는 S3 저장방식이 ESTID(폴더명)/ESTID + UUID로 저장되기 때문에 sql문에 필요하다.
		aws.multipleUpload(mpf, folderName, bImageVO, req);
		
		

		// 3. 메뉴 테이블에  {메뉴이름, 가격, 퀵가격, 예상소요시간}를 업데이트 시켜준다.
		int BMenuResult = bMenuDAO.insertConstract(bMenuVO);
		
		
//		// 4. 배달지역 테이블에  {시도,시군구,시구,읍면동,통리,반}를 업데이트 시켜준다. 이 메서드는 추후에 데이터 타입을 보고 작업할 수 있도록 한다.
		int BDeliveryAreaResult = bDeliveryAreaDAO.insertConstract(bDeliveryAreaVO);
//		
		
		// 5. 2차 온라인 계약 매장관리가 작성이 완료되었으면 status = 'Process' 로 변경시켜준다.
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("estid", estid);
		map.put("status", "PROCESS");
		
		
		int BInformationResult = bInformationDAO.updateStatus(map);
		
		return mav;
	}



	// 비즈니스 온라인계약 {신규일정관리} 데이터 등록 (POST) [건욱]
	public ModelAndView scheduleManagement(BScheduleDaysVO bScheduleDaysVO, BScheduleTimeVO bScheduleTimeVO,
										   BTempHolidayVO bTempHolidayVO, BTempSuspensionVO bTempSuspensionVO
										   ,HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("redirect:/");
		
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
		
		// 1. 영업일정관리 {첫 번째 주, 두 번째 주, 세 번째 주, 네 번째 주, 다섯 번째 주, 여섯 번째 주, 공휴일 휴무 여부}를 업데이트 시켜준다.
		int BScheduleDaysResult = bScheduleDaysDAO.updateConstract(bScheduleDaysVO);
		
		// 2. 영업시간관리 {평일, 토요일, 일요일}시간을 업데이트 시켜준다.
		int BScheduleTimeResult = bScheduleTimeDAO.updateConstract(bScheduleTimeVO);
		
		// 3. 영업임시휴일관리 {임시휴일 시작일, 임시휴일 마지막일}을 업데이트 시켜준다.
		int BTempHolidayResult = bTempHolidayDAO.insertConstract(bTempHolidayVO);
		
		// 4. 영업임시중지관리 {임시중지 시작일, 임시중지 마지막일}을 업데이트 시켜준다.
		int BTempSuspensionResult = bTempSuspensionDAO.insertConstract(bTempSuspensionVO);
		
		// 5. 2차 온라인 계약 매장관리가 작성이 완료되었으면 status = 'Process' 로 변경시켜준다.
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("estid", estid);
		map.put("status", "SUCCESS");
		
		int BInformationResult = bInformationDAO.updateStatus(map);
		
		return mav;
	}
	
	// 대분류 중분류를 셋팅해주는 함수입니다. 
	private HashMap<String, ArrayList<String>> menuCategoriesSetting(String estid) {
		// 대분류와 중분류를 HashMap으로 매장관리에 보내준다.
	    	/*
	    	 * 이 데이터의 구조
	    	 * {
	    	 * 
	    	 * 		"일반상의" : ["티셔츠","스포츠", "면티"],
	    	 * 		"하의"    : ["청바지", "수면바지"], 
	    	 * 			..
	    	 * 			..
	    	 * 			..
	    	 * 			..
	    	 * 			..
	    	 * }
	    	 */
	    	// 대분류/중분류 자료 구조를 선언해준다.
	    	HashMap<String, ArrayList<String>> menuCategories = new HashMap<String, ArrayList<String>>();
	    	
	    	// 새 메뉴VO를 선언해준다. estid값을 셋팅해준다.
	    	BMenuVO bMenuVO = new BMenuVO();
	    	bMenuVO.setEstid(estid);
	    	
	    	// 메인카테고리들을 DAO에서 받아와준다.
	    	ArrayList<String> mainCategories = bMenuDAO.selectMaincategories(estid);
	    	
	    	// ForEach문으로 데이터를 분리시켜준다.
	    	for(String mainCategory : mainCategories) {
	    		
	    		// 분리한 데이터를 VO에 maincategory를 셋팅해준다.
	    		bMenuVO.setMaincategory(mainCategory);
	    		// 설정한 값으로 메인카테고리에 해당하는 서브카테고리들을 불러와주고 해당 값을 menucategories에 셋팅해준다.
	    		menuCategories.put( mainCategory , bMenuDAO.selectSubcategories(bMenuVO));
	    	}
	    	
	    	return menuCategories;
	}
	
	// 매장이 완성되어있는지 체크[영경]
	private boolean checkEstStatus(HttpServletRequest req, String type) {
		BPrivateDataVO bPrivateDataVO = (BPrivateDataVO)req.getSession().getAttribute("bLogin");
		BInformationVO bInformationVO =(BInformationVO)req.getSession().getAttribute("selectEST");
		
		// main management의 경우 status가 FAIL 일 때만 일정관리에 접근할 수 없다.
		if(bPrivateDataVO == null || bInformationVO == null) {
			return true;
		}
		if(type.equals("ScheduleManagement") && bInformationVO.getStatus().equals("FAIL")) return true;
		// Status 계약 여부 필드를 세션에서 받아와 status가 'FAIL', 'PROCESS' 이면 business로 우회해주고 'SUCCESS'이면 서브관리 페이지들로 이동시키기 위해 boolean을 반환한다.
		return false;
	}

	
	private ModelAndView mainMove(HttpServletRequest req, String type) {
		ModelAndView mav = new ModelAndView("redirect:/business/");
		
		req.getSession().setAttribute("ModalCheck", type);
		
		return mav;
	}
	
	
}
