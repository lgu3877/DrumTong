package com.drumtong.business.service.mainmanagement;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.drumtong.business.dao.BDeliveryAreaDAO;
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

// [건욱]
@Service
public class RestBusinessMainManagementService {
	
	
	// 매장관리 테이블
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BMenuDAO	bMenuDAO;
	@Autowired BDeliveryAreaDAO bDeliveryAreaDAO;
	@Autowired AwsServiceImpl aws;
	
	
	// 일정관리 테이블
	@Autowired BScheduleTimeDAO bScheduleTimeDAO;
	@Autowired BScheduleDaysDAO bScheduleDaysDAO;
	@Autowired BTempHolidayDAO bTempHolidayDAO;
	@Autowired BTempSuspensionDAO bTempSuspensionDAO;
	
	// ========================= 대분류 [매장관리] ================================
	
	
	// 통합 메뉴 업데이트
	public int bManagementRestProcessing(HttpServletRequest req, BManagementVO bManagementVO, String processing) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    bManagementVO.setEstid(estid);
 	    int result = 0;
 	    switch(processing) {
 	    	case "updateIntroduction" :
 	    		result = bManagementDAO.updateIntroduction(bManagementVO);
 	    		break;
 	    	
 	    	case "updateDeliveryBoolean" :
 	    		result = bManagementDAO.updateDeliveryBoolean(bManagementVO);	
 	    		break;
 	    	
 	    	case "updateQuickBoolean" :
 	    		result = bManagementDAO.updateQuickBoolean(bManagementVO);
 	    		break;
 	    	
 	    	case "updateDefaultCategory" :
 	    		result = bManagementDAO.updateDefaultCategory(bManagementVO);
 	    		break;
 	    }
		return result;
	}

	
	// ===== 중분류 [BImage] 테이블 ====
	
	
	// 1. 매장 관리에 매장 사진을 비동기식으로 수정해주는 메서드입니다.
	public int updateBImage(MultipartHttpServletRequest mpf, HttpServletRequest req) {
		System.out.println("Bimage Rest Service 실행...");
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    BImageVO bImageVO = new BImageVO();
 	    bImageVO.setEstid(estid);
 	    
		int RestUpdateBImageResult = aws.multipleUpload(mpf, estid, bImageVO);
		return RestUpdateBImageResult;
				
	}
	
	
	
	// ===== 중분류 [BManagement] 테이블 ====
	
	
	// === 소분류 [ Introduction ] 필드 {매장소개글} ==
	// 1. 매장 관리에 매장 소개글을 비동기식으로 수정해주는 메서드입니다.
	public int updateIntroduction(HttpServletRequest req, BManagementVO bManagementVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bManagementVO.setEstid(estid);
		
		int RestUpdateIntroductionReuslt = bManagementDAO.updateIntroduction(bManagementVO);
		
		return RestUpdateIntroductionReuslt;
	}


	// === 소분류 [ DeliveryBoolean ] 필드 {배달유무} ==
	// 2. 매장 관리에 배달유무를 비둥기식으로 수정해주는 메서드입니다.
	public int updateDeliveryBoolean(HttpServletRequest req, BManagementVO bManagementVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bManagementVO.setEstid(estid);
		
		int RestUpdateDeliveryBooleanReuslt = bManagementDAO.updateDeliveryBoolean(bManagementVO);
		
		return RestUpdateDeliveryBooleanReuslt;
	}


	// === 소분류 [ QuickBoolean ] 필드 {퀵유무} ==
	// 3. 매장 관리에 퀵여부를 비둥기식으로 수정해주는 메서드입니다.
	public int updateQuickBoolean(HttpServletRequest req, BManagementVO bManagementVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bManagementVO.setEstid(estid);
		
		int RestUpdateDeliveryBooleanReuslt = bManagementDAO.updateQuickBoolean(bManagementVO);
		
		return RestUpdateDeliveryBooleanReuslt;
	}

	// === 소분류 [ DEFAULTCATEGORY ] 필드 {퀵유무} ==
	// 4. 매장 관리에 기본 카테고리를 비둥기식으로 수정해주는 메서드입니다.
	public int updateDefaultCategory(HttpServletRequest req, BManagementVO bManagementVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bManagementVO.setEstid(estid);
		
		int RestUpdateDefaultCategoryReuslt = bManagementDAO.updateDefaultCategory(bManagementVO);
		
		return RestUpdateDefaultCategoryReuslt;
	}

	
	
	
	// ===== 중분류 [BMenu] 테이블 ====
	
	// 통합
	public int bMenuRestProcessing(HttpServletRequest req, BMenuVO bMenuVO, String processing) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    bMenuVO.setEstid(estid);
		
 	    int result = 0;
 	    switch(processing) {
 	    	
 	    	case "insertBMenu" :
 	    		result = bMenuDAO.insertBMenu(bMenuVO);
 	    		break;
 	    	
 	    	case "updateBMenu" :
 	    		result = bMenuDAO.updateBMenu(bMenuVO);
 	    		break;
 	    		
 	    	case "deleteBMenu" :
 	    		result = bMenuDAO.deleteBMenu(bMenuVO);
 	    		break;
 	    }
		return result;
	}

	
	// 0. 메장 메뉴를 비동기식으로 새로이 입력해주는 메서드입니다.
	public int insertBMenu(HttpServletRequest req, BMenuVO bMenuVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bMenuVO.setEstid(estid);
		
		int RestInsertBMenuReuslt = bMenuDAO.insertBMenu(bMenuVO);
		return RestInsertBMenuReuslt;
	}
	
	
	// 1. 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	public int updateBMenu(HttpServletRequest req, BMenuVO bMenuVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bMenuVO.setEstid(estid);
		
		int RestUpdateBMenuReuslt = bMenuDAO.updateBMenu(bMenuVO);
		 
		return RestUpdateBMenuReuslt;
	}

	// 2. 매장 메뉴를 비동기식으로 삭제해주는 메서드입니다.
	public int deleteBMenu(HttpServletRequest req, BMenuVO bMenuVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		
		bMenuVO.setEstid(estid);
		
		int RestDeleteBMenuReuslt = bMenuDAO.deleteBMenu(bMenuVO);
		
		return RestDeleteBMenuReuslt;
	}
	
	
	
	
	

	// ===== 중분류 [BDELIVERYAREA] 테이블 ====	
	
	// 1. 배달 지역을 비동기식으로 수정해주는 메서드입니다.
	public int updateBDeliveryArea(HttpServletRequest req, BDeliveryAreaVO bDeliveryAreaVO) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		bDeliveryAreaVO.setEstid(estid);
		
		int RestUpdateBDeliveryAreaReuslt = bDeliveryAreaDAO.updateBDeliveryArea(bDeliveryAreaVO);
		
		return RestUpdateBDeliveryAreaReuslt;
	}


	// ========================= 대분류 [일정관리] ================================
	
	
	
	// ===== 중분류 [BSCHEDULETIME] 테이블 ==== { 매장 시간 관리 }
	
	// 0. 매장 시간관리를 비동기식으로 수정해주는 메서드입니다.
	public int updateBScheduleTime(BScheduleTimeVO bScheduleTimeVO) {
		
		// 이 메서드는 기존에 온라인계약할 당시에 사용하는 메서드와 똑같이 사용되기 때문에 재사용합니다.
		int RestUpdateBScheduleTimeReuslt = bScheduleTimeDAO.updateConstract(bScheduleTimeVO);

		return RestUpdateBScheduleTimeReuslt;
	}	
	
	
	
	// ===== 중분류 [BSCHEDULEDAYS] 테이블 ==== { 매장 일정 관리 }
	
	
	/* 
	   *  ※※※※※※※※※ [ 해당 메서드를 사용할 때 주의사항 ] ※※※※※※※※※※※
	 * 포함되는 메서드 @updateBScheduleDays / @insertBScheduleDays
	 * 
	 * 반드시 규격에 맞는 형식으로 데이터를 입력할 수 있도록 도와주세요.
	 * 
	 *  ex) javascript
	 *  
	 *  필드명 반드시 소문자로 부탁드립니다.
	 *  
	 *  ob = {
	 *  	estid 		: 매장 estid명 ,
	 *  	wherefield  : 삭제 혹은 추가하는 필드명 ,  ex) firstweek , secondweek 등등
	 *  	changeparam : 삭제 혹은 추가하는 데이터 ,  ex) 토/, 일/, 월/    ※여기서 주의해야할 포인트는 반드시 '토' + '/' 를 붙인 상태에서 데이터값을 보내줘야함.
	 *  }
	 *  
	 * 
	 */
	// 1. 매장 일정관리를 비동기식으로 삭제해주는 메서드입니다.
	public int deleteBScheduleDays(HashMap<String,String> obj) {
		
		int RestDeleteBScheduleDaysReuslt = bScheduleDaysDAO.deleteBScheduleDays(obj);
		
		return RestDeleteBScheduleDaysReuslt;
	
	}


	// 2. 매장 일정관리를 비동기식으로 추가해주는 메서드입니다.
	public int insertBScheduleDays(HashMap<String, String> obj) {

		int RestInsertBScheduleDaysReuslt = bScheduleDaysDAO.insertBScheduleDays(obj);
		
		return RestInsertBScheduleDaysReuslt;
	}


	// 3. 매장 일정관리에 공휴일 휴일 여부를 수정해주는 메서드입니다. 필드  { 휴일 유무  }
	public int updateHoliday(BScheduleDaysVO bScheduleDaysVO) {
		
		int RestUpdateHolidayReuslt = bScheduleDaysDAO.updateHoliday(bScheduleDaysVO);
		
		return RestUpdateHolidayReuslt;
	}

	
	
	
	
	// ===== 중분류 [BTEMPHOLIDAY] 테이블 ==== { 매장 임시 휴무일 }
	
	
	/* 
	 * @사용되는 파라메타값 
	 * 
	 * changeparamter 값 : beginday, endday
	 * where 값 : estid, num
	 * 
	 */
	// 1. 매장 임시 휴무일을 수정해주는 메서드입니다. 
	public int updateBTempHoliday(BTempHolidayVO bTempHolidayVO) {
		int RestUpdateBTempHolidayReuslt = bTempHolidayDAO.updateBTempHoliday(bTempHolidayVO);
		
		return RestUpdateBTempHolidayReuslt;
	}


	// 2. 매장 임시 휴무일을 삭제해주는 메서드입니다.
	public int deleteBTempHoliday(BTempHolidayVO bTempHolidayVO) {
		int RestDeleteHolidayReuslt = bTempHolidayDAO.deleteBTempHoliday(bTempHolidayVO);
		
		return RestDeleteHolidayReuslt;
	}


	// 3. 매장 임시 휴무일에 새 데이터를 입력해주는 메서드입니다.
	public int insertBTempHoliday(BTempHolidayVO bTempHolidayVO) {
		int RestInsertHolidayReuslt = bTempHolidayDAO.insertBTempHoliday(bTempHolidayVO);
		
		return RestInsertHolidayReuslt;
	}



	// ===== 중분류 [BTEMPSUSPENSION] 테이블 ==== { 매장 임시 휴무일 }

	/*
	 * @사용되는 파라메타값
	 * 
	 * changeparamter 값 : beginday, endday, reason 
	 * where 값 : estid, num
	 * 
	 */
	// 1. 매장 임시 중지을 수정해주는 메서드입니다.
	public int updateBTempSuspension(BTempSuspensionVO bTempSuspensionVO) {
		int RestUpdateBTempSuspensionReuslt = bTempSuspensionDAO.updateBTempSuspension(bTempSuspensionVO);

		return RestUpdateBTempSuspensionReuslt;
	}

	// 2. 매장 임시 중지을 삭제해주는 메서드입니다.
	public int deleteBTempSuspension(BTempSuspensionVO bTempSuspensionVO) {
		int RestDeleteBTempSuspensionReuslt = bTempSuspensionDAO.deleteBTempSuspension(bTempSuspensionVO);

		return RestDeleteBTempSuspensionReuslt;
	}

	// 3. 매장 임시 중지에 새 데이터를 입력해주는 메서드입니다.
	public int insertBTempSuspension(BTempSuspensionVO bTempSuspensionVO) {
		int RestInsertBTempSuspensionReuslt = bTempSuspensionDAO.insertBTempSuspension(bTempSuspensionVO);

		return RestInsertBTempSuspensionReuslt;
	}




	
	

}
