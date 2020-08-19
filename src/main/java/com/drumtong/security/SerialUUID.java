package com.drumtong.security;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.drumtong.customer.dao.CCustomerDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;

public class SerialUUID {

	@Autowired static CCustomerDAO cCustomerDAO;
//	@Autowired static BBusinessDAO bBusinessDAO;
//	@Autowired static BCouponDAO bCouponDAO;
//	@Autowired static BEstablishment bEstablishment;
	
	// SerialUUID 생성코드
	public static String getSerialUUID(String TableName, String FieldName) {
		int result = 0;
		String SerialUUID = "";
		while(result != 1) {
			SerialUUID = FieldName + "_" + UUID.randomUUID().toString().replace("-", "");
			switch(TableName) {
				case "CPrivateData" : result = cCustomerDAO.confirm(SerialUUID);
					break;
					
//				case "BBusinessDAO" : result = bBusinessDAO.confirm(SerialUUID);
//					break;
//					
//				case "BCouponDAO" : result = bCouponDAO.confirm(SerialUUID);
//					break;
//					
//				case "BEstablishment" : result = bEstablishment.confirm(SerialUUID);
//					 break;
			}
		}
		return FieldName + "_" + UUID.randomUUID().toString().replace("-", "");
	}
}
