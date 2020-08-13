package com.drumtong.customer.controller.laundry;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.drumtong.business.vo.BInformationVO;


@RestController
@RequestMapping("customer/laundry/")
public class RestCustomerLaundryController {
	
	@Autowired RestCustomerLaundryService svc;
//	
//	@RequestMapping("customerSearch/rest/clusterer/")
//	@GetMapping(produces="application/json; charset=utf8")	
//	public String clusterer(){
//		
////		테스트코드
//		
//		return;
//		

	    // 실제 코드
//		List<BInformationVO> list = svc.BusinessMapInfo();
//		return list != null
//				? new ObjectMapper().writeValueAsString(list)
//				: null;
//	}
}
