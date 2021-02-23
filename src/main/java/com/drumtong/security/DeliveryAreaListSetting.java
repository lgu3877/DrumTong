package com.drumtong.security;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.stereotype.Component;

import com.drumtong.business.vo.BDeliveryAreaVO;

@Component
public class DeliveryAreaListSetting {
	
	public static List<BDeliveryAreaVO> selectBDeliveryAreaList(HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>> bindingObject, String type) {
		List<BDeliveryAreaVO> bDeliveryAreaList = dataBinding(bindingObject, type);
		
		return bDeliveryAreaList;
	}
	
	
	private static List<BDeliveryAreaVO> dataBinding(HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>> bindingObject, String type) {
		List<BDeliveryAreaVO> bDeliveryAreaList = new ArrayList<BDeliveryAreaVO>();
		HashMap<String, HashMap<String, ArrayList<String>>> test = new HashMap<String, HashMap<String, ArrayList<String>>>();
		
		
		for(Entry<String, HashMap<String, HashMap<String, ArrayList<String>>>> entry : bindingObject.entrySet()) {
			
			
			System.out.println("실행 데이터 바인딩 배달지역 foreach");
			System.out.println(entry.getKey());
			System.out.println(entry.getValue());
			
			
		}
		
		
		
		
		return null;
	}
	

}
