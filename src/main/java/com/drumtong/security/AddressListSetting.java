package com.drumtong.security;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BDeliveryAreaDAO;
import com.drumtong.business.vo.BDeliveryAreaVO;

@Component // [건욱]
public class AddressListSetting {
//	static MMapAddressListDAO mMapAddressListDAO;
	
	static BDeliveryAreaDAO bDeliveryAreaDAO;
	
	
	
//	@Autowired MMapAddressListDAO BeanMapAddressListDAO;
	
	
	
	@Autowired BDeliveryAreaDAO BeanDeliveryAreaDAO;
	
	
	@PostConstruct
	private void init() {
//		this.mMapAddressListDAO = BeanMapAddressListDAO;
		this.bDeliveryAreaDAO = BeanDeliveryAreaDAO;
	}
	
//	public static HashMap<String, HashMap<String , ArrayList<String>>> getAddressList() {
//
//		 HashMap<String, HashMap<String , ArrayList<String>>> addressList = new HashMap<String, HashMap<String , ArrayList<String>>>();
//		 
//		 // 시도 데이터 리스트
//		 List<String> addressa = mMapAddressListDAO.selectMMapAddressA();
//		 
//		 
//		 // 시도 데이터 리스트를 해체시켜준다.
//		 for(String sido : addressa) {
//			 
//
//			 // 시군구 읍면동을 담을 리스트를 선언해준다.
//			 HashMap<String,ArrayList<String>> sigunguEmdList = new HashMap<String,ArrayList<String>>();
//				 
//			 
//   		 // 해당 시도의 시군구 데이터를 가져와준다.
//			 ArrayList<String> sigunguList = mMapAddressListDAO.selectMMapAddressB(sido);
//			 
//			 
//			 
//			 
//			 // 시군구 리스트를 해체시켜준다.
//			 for ( String sigungu : sigunguList ) {
//				
//				// 읍면동 필요한 서치데이터를 담을 HashMap이다. [시도] [시군구] 필드가 들어가게 된다.
//				HashMap<String,String> searchData = new HashMap<String,String>();
//				
//				// HashMap에 [시도]와 [시군구] 데이터를 담아준다.
//				searchData.put("addressa", sido);
//				searchData.put("addressb", sigungu);
//				
//				// 해당 시군구에 해당되는 읍면동의 리스트를 가져와준다.
//				sigunguEmdList.put(sigungu, mMapAddressListDAO.selectMMapAddressC(searchData));
//				
//			 }
//			 
//			 // 해당 시도에 시군구 읍면동을 넣어준다.
//			 addressList.put(sido, sigunguEmdList);
//		 }
//		 
//		 
//		 
//		 
//		
//		return addressList;
//				
//	}
	
	public static HashMap<String, HashMap<String , ArrayList<String>>> getAddressList(String estid) {
		 HashMap<String, HashMap<String , ArrayList<String>>> addressList = new HashMap<String, HashMap<String , ArrayList<String>>>();
		 
		 System.out.println("실행");
		 
		 // 시도 데이터 리스트
		 List<String> addressa = bDeliveryAreaDAO.selectAddressA(estid);
		 BDeliveryAreaVO vo = new BDeliveryAreaVO();
		 vo.setEstid(estid);
		 
		 // 시도 데이터 리스트를 해체시켜준다.
		 for(String sido : addressa) {
			 
			 
			 // 시군구 읍면동을 담을 리스트를 선언해준다.
			 HashMap<String,ArrayList<String>> sigunguEmdList = new HashMap<String,ArrayList<String>>();
				 
			 
			 // 해당 시도의 시군구 데이터를 가져와준다.
			 vo.setAddressa(sido);
			 ArrayList<String> sigunguList = bDeliveryAreaDAO.selectAddressB(vo);
			 
			 
			 
			 
			 // 시군구 리스트를 해체시켜준다.
			 for ( String sigungu : sigunguList ) {
				
				
				// HashMap에 [시도]와 [시군구] 데이터를 담아준다.
				vo.setAddressb(sigungu);
				
				// 해당 시군구에 해당되는 읍면동의 리스트를 가져와준다.
				sigunguEmdList.put(sigungu, bDeliveryAreaDAO.selectAddressC(vo));
				
			 }
			 
			 // 해당 시도에 시군구 읍면동을 넣어준다.
			 addressList.put(sido, sigunguEmdList);
		 }
		 
		 
		 
		 
		
		return addressList;
				
	}
}
