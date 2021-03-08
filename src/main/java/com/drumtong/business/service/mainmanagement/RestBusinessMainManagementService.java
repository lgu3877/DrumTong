package com.drumtong.business.service.mainmanagement;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.drumtong.business.dao.BDeliveryAreaDAO;
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
import com.drumtong.business.vo.BMenuUpdateVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.BPrivateDataVO;
import com.drumtong.business.vo.BScheduleDaysVO;
import com.drumtong.business.vo.BScheduleTimeVO;
import com.drumtong.business.vo.BTempHolidayVO;
import com.drumtong.business.vo.BTempSuspensionVO;
import com.drumtong.map.dao.MEmdDAO;
import com.drumtong.map.dao.MSidoDAO;
import com.drumtong.map.dao.MSigunguDAO;
import com.drumtong.security.AwsServiceImpl;
import com.drumtong.security.DeliveryAreaListSetting;
import com.drumtong.security.Login;
import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

// [건욱]
@Service
public class RestBusinessMainManagementService {
	
	
	// 매장관리 테이블
	@Autowired BManagementDAO bManagementDAO;
	@Autowired BMenuDAO	bMenuDAO;
	@Autowired BDeliveryAreaDAO bDeliveryAreaDAO;
	@Autowired BInformationDAO bInformationDAO;
	@Autowired AwsServiceImpl aws;
	
	
	
	// 일정관리 테이블
	@Autowired BScheduleTimeDAO bScheduleTimeDAO;
	@Autowired BScheduleDaysDAO bScheduleDaysDAO;
	@Autowired BTempHolidayDAO bTempHolidayDAO;
	@Autowired BTempSuspensionDAO bTempSuspensionDAO;
	
	// 지도 데이터 테이블
	
	// 시군구 테이블 
	@Autowired MSigunguDAO mSigunguDAO;
	
	// 시도 테이블
	@Autowired MEmdDAO mEmdDAO;
	// ========================= 대분류 [매장관리] ================================
	
	
	// 통합 메뉴 업데이트
	public int bManagementRestProcessing(HttpServletRequest req, BManagementVO bManagementVO, 
										String processing) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    bManagementVO.setEstid(estid);
 	    int result = 0;

 	    
 	    switch(processing) {
 	    	
 	    	// ===== 중분류 [BManagement] 테이블 ====
 		 	    
 			// === 소분류 [ Introduction ] 필드 {매장소개글} ==
 			// 1. 매장 관리에 매장 소개글을 비동기식으로 수정해주는 메서드입니다.
 	    	case "updateIntroduction" :
 	    		result = bManagementDAO.updateIntroduction(bManagementVO);
 	    		break;
 	    	

 	    	// === 소분류 [ DeliveryBoolean ] 필드 {배달유무} ==
 	    	// 2. 매장 관리에 배달유무를 비둥기식으로 수정해주는 메서드입니다.
 	    	case "updateDeliveryBoolean" :
 	    		result = bManagementDAO.updateDeliveryBoolean(bManagementVO);	
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
 	    
 	    
 	   // S3와 DB에 경로를 나타낼 bpersonid입니다. 
 	    // 저장될 때는 다음과 같이 저장됩니다.
 	    // ex) bpersonid 값 / estid 값 / 저장 형식 타입 (3가지로 나뉨) / 파일이름 (estid형식) 
 	    BPrivateDataVO bPrivateDataVO = (BPrivateDataVO)Session.getAttribute("bLogin");
 	    String bpersonid = bPrivateDataVO.getBpersonid();
 	    
 	    
 	    String folderName = "business/" + bpersonid + "/" + estid; 
 	    
		int RestUpdateBImageResult = aws.multipleUpload(mpf,folderName,bImageVO, req);
		return RestUpdateBImageResult;
	}
	
	
	

	
	
	
	// ===== 중분류 [BMenu] 테이블 ====

	// 메뉴 수정
	public List<BMenuVO> updateMenu(HttpServletRequest req, BMenuUpdateVO bMenuUpdateVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bMenuUpdateVO.setEstid(estid);
 	    
 	    int updateBMenuResult = bMenuDAO.updateBMenu(bMenuUpdateVO);
		
		return updateBMenuResult == 1  ? bMenuDAO.select(estid) : null;
	}
	
	
	// 메뉴 삭제
	public List<BMenuVO> deleteMenu(HttpServletRequest req, BMenuVO bMenuVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bMenuVO.setEstid(estid);
 	    
 	    int deleteBMenuResult = bMenuDAO.deleteBMenu(bMenuVO);
 	    
 	    return deleteBMenuResult == 1  ? bMenuDAO.select(estid) : null ;
	}
	
	
	// 통합
	public List<BMenuVO> bMenuRestProcessing(HttpServletRequest req, List<BMenuVO> ListBMenuVO, String processing) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
		
 	    int result = 0;
 	    
 	    
 	    
 	    for ( BMenuVO bMenuVO : ListBMenuVO ) {
 	    	bMenuVO.setEstid(estid);
 	    	System.out.println(bMenuVO.getQuickprice());
 	    	
 	    	switch(processing) {
 	    	
 	    	// 매장 메뉴를 입력하는 메서드입니다.
 	    	case "insertBMenu" :
 	    		result = bMenuDAO.insertBMenu(bMenuVO);
 	    		break;
 	 	    // 매장 메뉴를 수정하는 메서드입니다. 	    	
 	    	case "updateBMenu" :
// 	    		result = bMenuDAO.updateBMenu(bMenuVO);
 	    		break;
 	    		
 	 	    // 매장 메뉴를 삭제하는 메서드입니다. 	    		
 	    	case "deleteBMenu" :
 	    		result = bMenuDAO.deleteBMenu(bMenuVO);
 	    		break;
 	    	}
 	    }
 	    
 	    
 	    
 	    
 	   return result == 1  ? bMenuDAO.select(estid) : null ;
	}

	
	

 	// ===== 중분류 [BInformation] 테이블 ====
	 	    
	// === 소분류 [ MainLocation, DetailLocation ] 필드 {매장소개글} ==
	// 1.매장 정보에 [매장 주소]를 변경해주는 함수입니다.
	public int updateLocation(HttpServletRequest req, BInformationVO bInformationVO) {
		HttpSession Session = req.getSession();
		BInformationVO vo= (BInformationVO)Session.getAttribute("selectEST");
		String estid= vo.getEstid();
		bInformationVO.setEstid(estid);
		
		
		// * 여기서 EMDCODE의 COUNT란? drumtongMap(지도 DB)에 지역이 가지고있는 고유 번호가 있다. 각각의 지역에는 Count라는 필드가 존재하는데 읍면동 단위에서 
		// 1. 현재 EMDCODE를 BInformation 테이블에서 가져온다.
		String previousEMDCode  = bInformationDAO.selectEMDCode(estid);
		
		System.out.println("previousEMDCode : "  + previousEMDCode);
		
		System.out.println("bInformationVO.getEmdcode() : " + bInformationVO.getEmdcode());
		
		// 바꾸어진 코드에 지역이동이 있다면 Count를 변경 시켜준다.
		if (!previousEMDCode.equals(bInformationVO.getEmdcode())) {
			
			System.out.println("실해애앵");
			
			// 2. 현재 EMDCODE에 해당하는 지역의 Count를 -1 시켜준다.
			int delCountResult = mEmdDAO.delCount(previousEMDCode);

			// 3. 새로 추가된 EMDCODE에 해당하는 지역의 Count를 +1 시켜준다.
			int addCountResul = mEmdDAO.addCount(bInformationVO.getEmdcode());

		}
		
		int RestInsertBMenuReuslt = bInformationDAO.updateLocation(bInformationVO);
		return RestInsertBMenuReuslt;
	}
	
	
	// ==== 대분류 [DrumtongMap Database]
	
	
	// ==== 중분류 [MSidoDAO] 테이블
	// 시도에 대한 시군구데이터를 추출해줍니다.
	// 이렇게 REST로 추출해주는 이유는 다음과 같습니다.
	// 1. 모든 지역데이터를 한꺼번에 Get방식으로 전달해주면 Client쪽에 부담이 심함
	// 2. 분할 데이터로 전달시에 부담을 덜수있음.
	
	// / Addressa = 시도 / Addressb = 시군구 / Addressc = 읍면동 /
	public ArrayList<String> selectMMapAddressb(String sido) {
		System.out.println(sido);
		ArrayList<String> addressbList =  mSigunguDAO.selectMSigunguAddressB(sido);
		
		return addressbList;
	}
	
	

	// ==== 중분류 [MEmd] 테이블
	
	// 시도 시군구에 대한 읍면동데이터를 추출해줍니다.
	public ArrayList<String> selectMMapAddressc(HashMap<String,String> sidoSigungu) {
		
		ArrayList<String> addresscList =  mEmdDAO.selectMEmdAddressC(sidoSigungu);
		
		return addresscList;
	}

	// ===== 중분류 [BDELIVERYAREA] 테이블 ====	
	
	// 1. 배달 지역을 비동기식으로 수정해주는 메서드입니다.
	public int updateBDeliveryArea(HttpServletRequest req, HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>> bDeliveryAreaList) {
		HttpSession Session = req.getSession();
		BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
		String estid= bInformationVO.getEstid();
		
		// 프론트에서 전달받은 데이터를 databinding 시켜준다. [Delete 데이터]
		List<BDeliveryAreaVO> deleteBDeliveryAreaList = DeliveryAreaListSetting.selectBDeliveryAreaList(estid, bDeliveryAreaList, "remove");

		// 프론트에서 전달받은 데이터를 databinding 시켜준다. [Insert 데이터]
		List<BDeliveryAreaVO> insertBDeliveryAreaList = DeliveryAreaListSetting.selectBDeliveryAreaList(estid, bDeliveryAreaList, "add");
		
		
		int result = 0;
		
		// 전달받은 데이터를 Delete -> insert 순으로 시켜준다.
		
		for (BDeliveryAreaVO deleteVO : deleteBDeliveryAreaList) {
			
			result = bDeliveryAreaDAO.deleteBDeliveryAreaList(deleteVO);
			if(result == 0 )
				return 0;
		}
			
			
		for (BDeliveryAreaVO insertVO : insertBDeliveryAreaList) {
			
			result = bDeliveryAreaDAO.insertConstract(insertVO);
			if(result == 0 )
				return 0;
		}
			
		
		
		
		
		
		return result;
	}
	
	
	
	
	// ========================= 대분류 [일정관리] ================================
	
	
	
	// ===== 중분류 [BSCHEDULETIME] 테이블 ==== { 매장 시간 관리 }
	
	// 0. 매장 시간관리를 비동기식으로 수정해주는 메서드입니다.
	public int updateBScheduleTime(HttpServletRequest req, BScheduleTimeVO bScheduleTimeVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bScheduleTimeVO.setEstid(estid);
	   
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
	// 1. 매장 일정관리를 비동기식으로 수정 해주는 메서드입니다..
	public BScheduleDaysVO updateBScheduleDays(HttpServletRequest req,BScheduleDaysVO bScheduleDaysVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bScheduleDaysVO.setEstid(estid);
 	    
 	    
 	    
 	    int RestUpdateBScheduleDaysReuslt = bScheduleDaysDAO.updateConstract(bScheduleDaysVO);
		
 	    
		return RestUpdateBScheduleDaysReuslt == 1 ? bScheduleDaysDAO.selectBScheduleDays(estid) : null;
	}
	
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
	public BTempHolidayVO updateBTempHoliday(HttpServletRequest req, BTempHolidayVO bTempHolidayVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bTempHolidayVO.setEstid(estid);
 	    
 	    
		int RestUpdateBTempHolidayReuslt = bTempHolidayDAO.updateBTempHoliday(bTempHolidayVO);
		
		return RestUpdateBTempHolidayReuslt == 1 ? bTempHolidayDAO.selectBTempHoliday(bTempHolidayVO) : null;
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
	public List<BTempSuspensionVO> updateBTempSuspension(HttpServletRequest req, BTempSuspensionVO bTempSuspensionVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bTempSuspensionVO.setEstid(estid);
 	    
 	    
		int RestUpdateBTempSuspensionReuslt = bTempSuspensionDAO.updateBTempSuspension(bTempSuspensionVO);
		
		System.out.println(RestUpdateBTempSuspensionReuslt);
		
		return RestUpdateBTempSuspensionReuslt == 1 ? bTempSuspensionDAO.selectBTempSuspension(estid) : null;
	}

	// 2. 매장 임시 중지을 삭제해주는 메서드입니다.
	public List<BTempSuspensionVO> deleteBTempSuspension(HttpServletRequest req, BTempSuspensionVO bTempSuspensionVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bTempSuspensionVO.setEstid(estid);
 	    
		int RestDeleteBTempSuspensionReuslt = bTempSuspensionDAO.deleteBTempSuspension(bTempSuspensionVO);
		
		return RestDeleteBTempSuspensionReuslt == 1 ? bTempSuspensionDAO.selectBTempSuspension(estid) : null;
	}

	// 3. 매장 임시 중지에 새 데이터를 입력해주는 메서드입니다.
	public List<BTempSuspensionVO> insertBTempSuspension(HttpServletRequest req, BTempSuspensionVO bTempSuspensionVO) {
		HttpSession Session = req.getSession();
 	    BInformationVO bInformationVO = (BInformationVO)Session.getAttribute("selectEST");
 	    String estid = bInformationVO.getEstid();
 	    
 	    bTempSuspensionVO.setEstid(estid);
 	    
		int RestInsertBTempSuspensionReuslt = bTempSuspensionDAO.insertBTempSuspension(bTempSuspensionVO);
		
		System.out.println(RestInsertBTempSuspensionReuslt);
		return RestInsertBTempSuspensionReuslt == 1 ? bTempSuspensionDAO.selectBTempSuspension(estid) : null;
	}

	// 0. 매장 상태 값을 바꾸어주는 메서드입니다.
	public int changeShopStatus(HttpServletRequest req, HashMap<String,String> obj) {
		HttpSession Session = req.getSession();
 	   	BPrivateDataVO bPrivateDataVO = (BPrivateDataVO)Session.getAttribute("bLogin");
 	    
 	   	int result = bInformationDAO.updateStatus(obj);
 	   	
 	    // 세션 초기화
 	    Login.getInformationList(bPrivateDataVO, Session, bInformationDAO);
 	    
		return result;
	}





	





	
	

}
