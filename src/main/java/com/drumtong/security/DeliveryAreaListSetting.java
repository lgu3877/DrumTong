package com.drumtong.security;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;

import com.drumtong.business.vo.BDeliveryAreaVO;


// [건욱]


// 해당 클래스는 클라이언트가 요청하는 배달지역 데이터를 처리해주는 역할을 해주고있다.
// 프론트에서 전달되는 데이터 형식은 다음과 같다. (해당 데이터는 예시 데이터이다.)
/*
		add:
			경기도:
				광주시: (3) ["역동", "중대동", "탄벌동"]
				남양주시: (8) ["삼패동", "도농동", "금곡동", "수동면", "다산동", "수석동", "조안면", "일패동"]
				성남시 중원구: (5) ["갈현동", "상대원동", "금광동", "도촌동", "여수동"]
				
			인천광역시:
				계양구: (5) ["상야동", "박촌동", "임학동", "방축동", "작전동"]
				
			충청남도:
				청양군: (3) ["정산면", "대치면", "청양읍"]
				
			충청북도:
				단양군: (4) ["영춘면", "적성면", "단성면", "어상천면"]
				
		remove:
			충청남도:
				청양군: (2) ["청남면", "비봉면"]
			충청북도:
				단양군: ["대강면"]
 */
@Component
public class DeliveryAreaListSetting {
	
	public static List<BDeliveryAreaVO> selectBDeliveryAreaList(String estid, HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>> bindingObject, String type) {
		List<BDeliveryAreaVO> bDeliveryAreaList = dataBinding(estid, bindingObject, type);
		
		return bDeliveryAreaList;
	}
	
	
	private static List<BDeliveryAreaVO> dataBinding(String estid,HashMap<String,HashMap<String,HashMap<String,ArrayList<String>>>> bindingObject, String type) {
		List<BDeliveryAreaVO> bDeliveryAreaList = new ArrayList<BDeliveryAreaVO>();
		
		
		Iterator<String> typeKeys = bindingObject.keySet().iterator();	// {add, remove}
		
		while(typeKeys.hasNext()) {
			String typeKey = typeKeys.next();
			
			
			
			// 매개변수로 전달된 type이 일치해야만 밑에 코드를 실행시켜준다.
			if(typeKey.equals(type)) {
				
				// 해당 코드는 시도/시군구/읍면동을 bDeliveryAreaList에 data를 넣어주는 코드이다.
				Iterator<String> sidoKeys = bindingObject.get(typeKey).keySet().iterator(); // sido [시도]
				while(sidoKeys.hasNext()) {
					String sidoKey = sidoKeys.next();
					Iterator<String> sigKeys = bindingObject.get(typeKey).get(sidoKey).keySet().iterator(); // sigungu [시군구]
					while(sigKeys.hasNext()) {
						String sigKey = sigKeys.next();
						Iterator<String> emdKeys = bindingObject.get(typeKey).get(sidoKey).get(sigKey).iterator(); // EMd [읍면동]
						while(emdKeys.hasNext()) {
							String emdKey = emdKeys.next();
							BDeliveryAreaVO bDeliveryAreaVO = new BDeliveryAreaVO();
							bDeliveryAreaVO.setEstid(estid);
							bDeliveryAreaVO.setAddressa(sidoKey);
							bDeliveryAreaVO.setAddressb(sigKey);
							bDeliveryAreaVO.setAddressc(emdKey);
							
							bDeliveryAreaList.add(bDeliveryAreaVO);
						}
							
					}
				}
				
			}
			
			
		}
		
		
		
		return bDeliveryAreaList;
	}
	

}
