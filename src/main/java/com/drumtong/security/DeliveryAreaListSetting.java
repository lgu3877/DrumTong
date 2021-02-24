package com.drumtong.security;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
		
		
		Iterator<String> typeKeys = bindingObject.keySet().iterator();	// {add, remove}
		while(typeKeys.hasNext()) {
			String typeKey = typeKeys.next();
			System.out.println("==============================타입 : " + typeKey + "==============================");
			Iterator<String> sidoKeys = bindingObject.get(typeKey).keySet().iterator();
			while(sidoKeys.hasNext()) {
				String sidoKey = sidoKeys.next();
				Iterator<String> sigKeys = bindingObject.get(typeKey).get(sidoKey).keySet().iterator();
				while(sigKeys.hasNext()) {
					String sigKey = sigKeys.next();
					Iterator<String> emdKeys = bindingObject.get(typeKey).get(sidoKey).get(sigKey).iterator();
					while(emdKeys.hasNext()) {
						String emdKey = emdKeys.next();
						BDeliveryAreaVO bDeliveryAreaVO = new BDeliveryAreaVO();
						bDeliveryAreaVO.setAddressa(sidoKey);
						bDeliveryAreaVO.setAddressb(sigKey);
						bDeliveryAreaVO.setAddressc(emdKey);
					
					}
						
				}
			}
		}
		
		for(Entry<String, HashMap<String, HashMap<String, ArrayList<String>>>> entry : bindingObject.entrySet()) {
			for(Entry<String, HashMap<String, ArrayList<String>>> entry2 : bindingObject.get(entry.getKey()).entrySet()) {
				for(Entry<String, ArrayList<String>> entry3 : bindingObject.get(entry.getKey()).get(entry2.getKey()).entrySet()) {
					System.out.println("이영경3333");
					System.out.println(entry3.getKey());
					System.out.println(entry3.getValue());
				}
				
			}
			
			
		}
		
		
		
		
		return null;
	}
	

}
