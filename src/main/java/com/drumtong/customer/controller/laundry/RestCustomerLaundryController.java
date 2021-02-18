package com.drumtong.customer.controller.laundry;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.service.laundry.RestCustomerLaundryService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
@RequestMapping("customer/laundry/")
public class RestCustomerLaundryController {
	
	@Autowired RestCustomerLaundryService svc;
	
	@RequestMapping("customerDetail/rest/addBookmark/")
	@PostMapping(produces="application/json; charset=utf8")
	public String setBookmark(HttpServletRequest req, @RequestBody HashMap<String, String> param) {
		return svc.setBookmark(req, param);
	}
	
	@RequestMapping("customerDetail/rest/addCoupon/")
	@PostMapping(produces="application/json; charset=utf8")
	public String setCoupon(HttpServletRequest req, @RequestBody HashMap<String, String> param) {
		return svc.setCoupon(req, param);
	}
	
	// =======================================지도에 필요한 세탁소 리스트 가져오기===================================================
	// 좌표를 이용해서 세탁소 리스트를 가져오는 경우[영경]
	@RequestMapping("customerSearch/rest/selectLaundry/coordinate/{latitude}/{longitude}/{premium}/")
	@GetMapping(produces="application/json; charset=utf8")	
	public String selectLaundry(@PathVariable("latitude")String latitude, @PathVariable("longitude")String longitude, @PathVariable("premium")String premium){
		return svc.selectLaundry(latitude,longitude);
	}
	
	// emd 코드를 이용해서 세탁소 리스트를 가져오는 경우[영경]
	@RequestMapping("customerSearch/rest/selectLaundry/emdcode/{emdcode}/{premium}/")
	@GetMapping(produces="application/json; charset=utf8")	
	public String selectLaundry(@PathVariable("emdcode")String emdcode, @PathVariable("premium")String premium){
		return svc.selectLaundry(emdcode, premium);
	}
	// ====================================================================================================================
	
	// 승원씨가 작업한 sido를 가져오는 REST함수입니다
	@RequestMapping(value = "customerMap/rest/sido/", produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PostMapping(produces="application/json; charset=utf8")
	public String getsido() {
		return svc.getsido();
	}

	// 승원씨가 작업한 sido를 가져오는 REST함수입니다
	@RequestMapping(value = "customerMap/rest/sigungu/{sidoname}", produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PostMapping(produces="application/json; charset=utf8")
	public String getsigungu(@PathVariable String sidoname) {
		return svc.getsigungu(sidoname);
	}
	
	
	// 읍면동 Select REST [건욱]
	@RequestMapping(value = "customerMap/rest/emd/", produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PostMapping(produces="application/json; charset=utf8")
	public String getEmd() {
		return svc.getEmd();
	}
	
	// 매장 좌표 Select REST [건욱]
	@RequestMapping(value = "customerMap/rest/selectBInformationCoord/", produces =org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	@PostMapping(produces="application/json; charset=utf8")
	public String selectBInformationCoord() {
		return svc.selectBInformationCoord();
	}
		
	
}
