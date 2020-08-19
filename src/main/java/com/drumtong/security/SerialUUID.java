package com.drumtong.security;

import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.customer.dao.CCustomerDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;

@Component
public class SerialUUID {

	static CCustomerDAO cCustomerDAO;
//	static BBusinessDAO bBusinessDAO;
//	static BCouponDAO bCouponDAO;
//	static BEstablishment bEstablishment;
	
	@Autowired CCustomerDAO BeancCustomerDAO;
//	@Autowired BBusinessDAO BeanbBusinessDAO;
//	@Autowired BCouponDAO BeanbCouponDAO;
//	@Autowired BEstablishment BeanbEstablishment;
	
	@PostConstruct
	private void init() {
		this.cCustomerDAO = BeancCustomerDAO;
//		this.bBusinessDAO = BeanbBusinessDAO;
//		this.bCouponDAO = BeanbCouponDAO;
//		this.bEstablishment = BeanbEstablishment
	}
	
	
	
	// SerialUUID 생성코드
	public static String getSerialUUID(String TableName, String FieldName) {
		int result = 1;
		String SerialUUID = "";
		
//		System.out.println("while문 밖에 serailuuid : " + SerialUUID);
		
		while(result == 1) {
			
			SerialUUID = FieldName + "_" + UUID.randomUUID().toString().replace("-", "");
//			System.out.println("while문 안에 serailuuid : " + SerialUUID);
			switch(TableName) {
				case "CPrivateData" : result = cCustomerDAO.confirm(SerialUUID);
					break;
					
//				case "BBusiness" : result = bBusinessDAO.confirm(SerialUUID);
//					break;
//					
//				case "BCoupon" : result = bCouponDAO.confirm(SerialUUID);
//					break;
//					
//				case "BEstablishment" : result = bEstablishment.confirm(SerialUUID);
//					 break;
			}
		}
		
		return SerialUUID;
		
	}
}
