package com.drumtong.business.controller.mainmanagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.drumtong.business.service.mainmanagement.RestBusinessMainManagementService;
import com.drumtong.business.vo.BDeliveryAreaVO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuUpdateVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.BScheduleDaysVO;
import com.drumtong.business.vo.BScheduleTimeVO;
import com.drumtong.business.vo.BTempHolidayVO;
import com.drumtong.business.vo.BTempSuspensionVO;
import com.google.gson.Gson;

/*
 *  [건욱]
 *  해당 RestController는 매장 관리를 할 때
 *  어떠한 수정이 이루어지면 비동기식으로 재빠르게 화면에 띄울 수 있게 도와주는 컨트롤러 입니다.
 *  모든 관리는 비동기식으로 수정되며 획기적이면서 빠르게 사용자는 수정할 수 있습니다.
 */
@RestController
@RequestMapping("business/mainmanagement/")
public class RestBusinessMainManagementController {
	
	@Autowired RestBusinessMainManagementService svc;
	
	
	// ========================= 대분류 [매장관리] ================================
	
	
	// BManagement 테이블 통합 실행 함수 
	@RequestMapping("BManagement/rest/{processing}/")
	@PostMapping(produces="application/json; charset=utf8")
	public String bManagementRestProcessing(HttpServletRequest req, @RequestBody BManagementVO bManagementVO,
											@PathVariable("processing")String processing) {
		System.out.println("통합함수 실행..");
		int result = svc.bManagementRestProcessing(req, bManagementVO, processing);
		return result == 1
				? "true"
				: "false";

	}
	
	// ===== 중분류 [BImage] 테이블 ====
	// 1. 매장 이미지를 비둥기식으로 수정해주는 메서드입니다.
	// 추후에 결정 JS 파일을 보고
	@RequestMapping("BImage/rest/updateStoreIMG/")
	@PostMapping(produces="charset=utf8", consumes =  { "multipart/form-data" } )
//	@PostMapping(produces="application/json; charset=utf8", consumes = MediaType.MULTIPART_FORM_DATA_VALUE )
//	@PostMapping(produces="charset=utf8")
	public String updateStoreIMG(HttpServletRequest req, MultipartHttpServletRequest mpf ) {
		System.out.println("Bimage Rest Controller 실행...");
		int result = svc.updateBImage(mpf,req);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}	
		
		
	
	
		
	
	// ===== 중분류 [BInformation] 테이블 ====
	    
	// === 소분류 [ MainLocation, DetailLocation ] 필드 {매장소개글} ==
	// 1.매장 정보에 [매장 주소]를 변경해주는 함수입니다. (위도 경도도 같이 수정해줍니다)
	@RequestMapping("BInformation/rest/updateLocation/")
	@PostMapping(produces="application/json; charset=utf8")
	public String updateLocation(HttpServletRequest req, @RequestBody BInformationVO bInformationVO) {
		int result = svc.updateLocation(req,bInformationVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}	
	
	
	
	
	
	// ===== 중분류 [BMenu] 테이블 ====	
	
	
	
	
	// 메뉴 수정 
	@RequestMapping("BMenu/rest/updateMenu/")
	@PostMapping(produces="application/json; charset=utf8")
	public String updateMenu(HttpServletRequest req, @RequestBody BMenuUpdateVO bMenuUpdateVO ) {
		int result = svc.updateMenu(req, bMenuUpdateVO);
		return result == 1
				? "true"
				: "false";
	}

	// 메뉴 삭제
	@RequestMapping("BMenu/rest/deleteMenu/")
	@PostMapping(produces="application/json; charset=utf8")
	public List<BMenuVO> deleteMenu(HttpServletRequest req, @RequestBody BMenuVO bMenuVO ) {
		return svc.deleteMenu(req, bMenuVO);
	}

	
	
	@RequestMapping("BMenu/rest/{processing}/")
	@PostMapping(produces="application/json; charset=utf8")
	public List<BMenuVO> bMenuRestProcessing(HttpServletRequest req, @RequestBody List<BMenuVO> ListBMenuVO, 
									  @PathVariable("processing")String processing) {
		return svc.bMenuRestProcessing(req, ListBMenuVO, processing);
	}


	
	
	

	// ==== 대분류 [DrumtongMap Database]
	// ==== 중분류 [MSigungu] 테이블
	
	// 시도에 대한 시군구데이터를 추출해줍니다.
	// 이렇게 REST로 추출해주는 이유는 다음과 같습니다.
	// 1. 모든 지역데이터를 한꺼번에 Get방식으로 전달해주면 Client쪽에 부담이 심함
	// 2. 분할 데이터로 전달시에 부담을 덜수있음.
	@RequestMapping("BManagement/rest/selectMMapAddressB/{sido}/")
	@GetMapping(produces = "application/json; charset=utf8")
//	public String selectMMapAddressB(@PathVariable("sido") String sido) {
	public ArrayList<String> selectMMapAddressB(@PathVariable("sido") String sido) {
		return svc.selectMMapAddressb(sido);
	}
	
	// ==== 중분류 [MEmd] 테이블
	
	// 시도 시군구에 대한 읍면동데이터를 추출해줍니다.
	@RequestMapping("BManagement/rest/selectMMapAddressC/")
	@PostMapping(produces = "application/json; charset=utf8")
	public ArrayList<String> selectMMapAddressC(@RequestBody HashMap<String, String> sidoSigungu) {
		return svc.selectMMapAddressc(sidoSigungu);
		
	}
	
	
	// ===== 중분류 [BDELIVERYAREA] 테이블 ====	
	
	// 1. 배달 지역을 비동기식으로 수정해주는 메서드입니다.
	@RequestMapping("BDeliveryArea/rest/updateBDeliveryArea/")
	@PostMapping(produces="application/json; charset=utf8")
	public String updateBDeliveryArea(HttpServletRequest req, @RequestBody HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>> bDeliveryAreaList)  {
		
		int result = svc.updateBDeliveryArea(req,bDeliveryAreaList);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	
	
	
	
	
	// ========================= 대분류 [일정관리] ================================
	
	
	
	// ===== 중분류 [BSCHEDULETIME] 테이블 ==== { 매장 시간 관리 }
	
	// 0. 매장 시간관리를 비동기식으로 수정해주는 메서드입니다.
	@RequestMapping("BScheduleTime/rest/updateBScheduleTime/{param}")
	@GetMapping(produces = "application/json; charset=utf8")
	public String updateBScheduleTime(@PathVariable("param") BScheduleTimeVO bScheduleTimeVO) {

		int result = svc.updateBScheduleTime(bScheduleTimeVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1 ? "true" : "false";
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
	@RequestMapping("BScheduleDays/rest/deleteBScheduleDays/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateBScheduleDays(@PathVariable("param")HashMap<String, String> obj) {
		
		int result = svc.deleteBScheduleDays(obj);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}

	// 2. 매장 일정관리를 비동기식으로 추가해주는 메서드입니다.
	@RequestMapping("BScheduleDays/rest/insertBScheduleDays/{param}")
	@GetMapping(produces = "application/json; charset=utf8")
	public String insertBScheduleDays(@PathVariable("param") HashMap<String, String> obj) {

		int result = svc.insertBScheduleDays(obj);
		System.out.println(result + " : result 값 입니다");
		return result == 1 ? "true" : "false";
	}
	
	
	
	
	
	// 3. 매장 일정관리에 공휴일 휴일 여부를 수정해주는 메서드입니다. 필드  { 휴일 유무  }
	@RequestMapping("BScheduleDays/rest/updateHoliday/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateHoliday(@PathVariable("param")BScheduleDaysVO bScheduleDaysVO) {
		
		int result = svc.updateHoliday(bScheduleDaysVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
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
	@RequestMapping("BTempHoliday/rest/updateBTempHoliday/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateBTempHoliday(@PathVariable("param")BTempHolidayVO bTempHolidayVO) {
		
		int result = svc.updateBTempHoliday(bTempHolidayVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	
	
	// 2. 매장 임시 휴무일을 삭제해주는 메서드입니다.
	@RequestMapping("BTempHoliday/rest/deleteBTempHoliday/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String deleteBTempHoliday(@PathVariable("param")BTempHolidayVO bTempHolidayVO) {
		
		int result = svc.deleteBTempHoliday(bTempHolidayVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	// 3. 매장 임시 휴무일에 새 데이터를 입력해주는 메서드입니다.
	@RequestMapping("BTempHoliday/rest/insertBTempHoliday/{param}")
	@GetMapping(produces = "application/json; charset=utf8")
	public String insertBTempHoliday(@PathVariable("param") BTempHolidayVO bTempHolidayVO) {

		int result = svc.insertBTempHoliday(bTempHolidayVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1 ? "true" : "false";
	}
	

	

	// ===== 중분류 [BTEMPSUSPENSION] 테이블 ==== { 매장 임시 휴무일 }

	/* 
	 * @사용되는 파라메타값 
	 * 
	 * changeparamter 값 : beginday, endday, reason
	 * where 값 : estid, num
	 * 
	 */
	// 1. 매장 임시 중지를 수정해주는 메서드입니다. 
	@RequestMapping("BTempSuspension/rest/updateBTempSuspension/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateBTempSuspension(@PathVariable("param")BTempSuspensionVO bTempSuspensionVO) {
		
		int result = svc.updateBTempSuspension(bTempSuspensionVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	
	
	// 2. 매장 임시 중지를 삭제해주는 메서드입니다.
	@RequestMapping("BTempSuspension/rest/deleteBTempSuspension/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String deleteBTempSuspension(@PathVariable("param")BTempSuspensionVO bTempSuspensionVO) {
		
		int result = svc.deleteBTempSuspension(bTempSuspensionVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	// 3. 매장 임시 중지에 새 데이터를 입력해주는 메서드입니다.
	@RequestMapping("BTempSuspension/rest/insertBTempSuspension/{param}")
	@GetMapping(produces = "application/json; charset=utf8")
	public String insertBTempSuspension(@PathVariable("param") BTempSuspensionVO bTempSuspensionVO) {

		int result = svc.insertBTempSuspension(bTempSuspensionVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1 ? "true" : "false";
	}
	
	
}
