package com.drumtong.business.controller.mainmanagement;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.drumtong.business.service.mainmanagement.RestBusinessMainManagementService;
import com.drumtong.business.vo.BDeliveryAreaVO;
import com.drumtong.business.vo.BManagementVO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.BScheduleDaysVO;
import com.drumtong.business.vo.BScheduleTimeVO;
import com.drumtong.business.vo.BTempHolidayVO;
import com.drumtong.business.vo.BTempSuspensionVO;

/*
 *  [건욱]
 *  해당 RestController는 매장 관리를 할 때
 *  어떠한 수정이 이루어지면 비동기식으로 재빠르게 화면에 띄울 수 있게 도와주는 컨트롤러 입니다.
 *  모든 관리는 비동기식으로 수정되며 획기적이면서 빠르게 사용자는 수정할 수 있습니다.
 */
@RestController
@RequestMapping("business/mainManagement/")
public class RestBusinessMainManagementController {
	
	@Autowired RestBusinessMainManagementService svc;
	
	
	// ========================= 대분류 [매장관리] ================================
	
	
	// ===== 중분류 [BManagement] 테이블 ====
	
	
	// === 소분류 [ Introduction ] 필드 {매장소개글} ==	[건욱]
	// 1. 매장 관리에 매장 소개글을 비동기식으로 수정해주는 메서드입니다.
	@RequestMapping("BManagement/rest/updateIntroduction/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateIntroduction(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateIntroduction(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	// === 소분류 [ DeliveryBoolean ] 필드 {배달유무} ==	[건욱]
	// 2. 매장 관리에 배달유무를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("BManagement/rest/updateDeliveryBoolean/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateDeliveryBoolean(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateDeliveryBoolean(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	

	// === 소분류 [ QuickBoolean ] 필드 {퀵유무} ==
	// 3. 매장 관리에 퀵여부를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("BManagement/rest/updateQuickBoolean/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateQuickBoolean(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateQuickBoolean(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
		
		
	// DetailCategory는 추후에 작성하도록 
	// 받아오는 데이터 타입이 어떻게 되는지 보고 결정하도록한다.
	// === 소분류 [ DEFAULTCATEGORY ] 필드 {퀵유무} ==
	// 4. 매장 관리에 카테고리를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("BManagement/rest/updateDefaultCategory/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateDefaultCategory(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateDefaultCategory(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}	
	
	
	
	// ===== 중분류 [BImage] 테이블 ====
	// 1. 매장 이미지를 비둥기식으로 수정해주는 메서드입니다.
	// 추후에 결정 JS 파일을 보고
//	@RequestMapping("StoreIMG/rest/updateStoreIMG/")
//	@PostMapping(produces="application/json; charset=utf8")
//	public String updateStoreIMG(@RequestBody MultipartFile file, HashMap<String,String>) {
//		
//		int result = svc.updateStoreIMG(file);
//		System.out.println(result + " : result 값 입니다");
//		return result == 1
//				? "true"
//				: "false";
//	}	
	
	
	// ===== 중분류 [BMenu] 테이블 ====	

	// 0. 메장 메뉴를 비동기식으로 새로이 입력해주는 메서드입니다.
	@RequestMapping("BMenu/rest/insertBMenu/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String insertBMenu(@PathVariable("param")BMenuVO bMenuVO) {
		
		int result = svc.insertBMenu(bMenuVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}
	
	
	
	
	// 1. 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("BMenu/rest/updateBMenu/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateBMenu(@PathVariable("param")BMenuVO bMenuVO) {
		
		int result = svc.updateBMenu(bMenuVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}	
	
	// 2. 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("BMenu/rest/deleteBMenu/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String deleteBMenu(@PathVariable("param")BMenuVO bMenuVO) {
		
		int result = svc.deleteBMenu(bMenuVO);
		System.out.println(result + " : result 값 입니다");
		return result == 1
				? "true"
				: "false";
	}	
	

	// ===== 중분류 [BDELIVERYAREA] 테이블 ====	
	
	// 1. 배달 지역을 비동기식으로 수정해주는 메서드입니다.
	@RequestMapping("BDeliveryArea/rest/updateBDeliveryArea/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateBDeliveryArea(@PathVariable("param")BDeliveryAreaVO bDeliveryAreaVO) {
		
		int result = svc.updateBDeliveryArea(bDeliveryAreaVO);
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
