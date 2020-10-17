package com.drumtong.business.controller.mainmanagement;

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
	
	
	// === 소분류 [ Introduction ] 필드 {매장소개글} ==
	// 1. 매장 관리에 매장 소개글을 비동기식으로 수정해주는 메서드입니다.
	@RequestMapping("Introduction/rest/updateIntroduction/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateIntroduction(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateIntroduction(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 0
				? "true"
				: "false";
	}
	
	// === 소분류 [ DeliveryBoolean ] 필드 {배달유무} ==
	// 2. 매장 관리에 배달유무를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("DeliveryBoolean/rest/updateDeliveryBoolean/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateDeliveryBoolean(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateDeliveryBoolean(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 0
				? "true"
				: "false";
	}
	

	// === 소분류 [ QuickBoolean ] 필드 {퀵유무} ==
	// 3. 매장 관리에 퀵여부를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("QuickBoolean/rest/updateQuickBoolean/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateQuickBoolean(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateQuickBoolean(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 0
				? "true"
				: "false";
	}
	
		
		
	// DetailCategory는 추후에 작성하도록 
	// 받아오는 데이터 타입이 어떻게 되는지 보고 결정하도록한다.
	// === 소분류 [ DEFAULTCATEGORY ] 필드 {퀵유무} ==
	// 4. 매장 관리에 카테고리를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("DefaultCategory/rest/updateDefaultCategory/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateDefaultCategory(@PathVariable("param")BManagementVO bManagementVO) {
		
		int result = svc.updateDefaultCategory(bManagementVO);
		System.out.println(result + " : result 값 입니다");
		return result == 0
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
//		return result == 0
//				? "true"
//				: "false";
//	}	
	
	
	// ===== 중분류 [BMenu] 테이블 ====	
	
	// 1. 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("BMenu/rest/updateBMenu/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String updateBMenu(@PathVariable("param")BMenuVO bMenuVO) {
		
		int result = svc.updateBMenu(bMenuVO);
		System.out.println(result + " : result 값 입니다");
		return result == 0
				? "true"
				: "false";
	}	
	
	// 2. 매장 메뉴를 비둥기식으로 수정해주는 메서드입니다.
	@RequestMapping("BMenu/rest/deleteBMenu/{param}")
	@GetMapping(produces="application/json; charset=utf8")
	public String deleteBMenu(@PathVariable("param")BMenuVO bMenuVO) {
		
		int result = svc.deleteBMenu(bMenuVO);
		System.out.println(result + " : result 값 입니다");
		return result == 0
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
		return result == 0
				? "true"
				: "false";
	}
	
	
	// ========================= 대분류 [일정관리] ================================
	
	
	
	
	
	
}
