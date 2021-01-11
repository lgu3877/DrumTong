package com.drumtong.customer.controller.laundry;

import java.util.HashMap;
import java.util.List;

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
	public String setBookmark(@RequestBody HashMap<String, String> param) {
		return svc.setBookmark(param);
	}
	
	@RequestMapping("customerDetail/rest/addCoupon/")
	@PostMapping(produces="application/json; charset=utf8")
	public String setCoupon(@RequestBody HashMap<String, String> param) {
		return svc.setCoupon(param);
	}
	
	@RequestMapping("customerSearch/rest/clusterer/${address}/")
	@GetMapping(produces="application/json; charset=utf8")	
	public String clusterer(@PathVariable("address")String address){
//		
////		테스트코드
//		
//		return;
//		
		System.out.println("addresss : " + address);
	    // 실제 코드
		List<BInformationVO> list = svc.BusinessMapInfo(address);
		try {
			return list != null
					? new ObjectMapper().writeValueAsString(list):null;
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
