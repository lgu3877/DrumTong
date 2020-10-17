package com.drumtong.security;

import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BBusinessDAO;
import com.drumtong.business.dao.BEstablishmentDAO;
import com.drumtong.business.dao.BImageDAO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.customer.dao.CCustomerDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;

@Component
public class SerialUUID {

	static CCustomerDAO cCustomerDAO;
	static BBusinessDAO bBusinessDAO;
//	static BCouponDAO bCouponDAO;
	static BEstablishmentDAO bEstablishmentDAO;

	// AWS S3 저장 파일명 지정용
	static BImageDAO bImageDAO;
	static BImageVO bImageVO;
	
	@Autowired CCustomerDAO BeancCustomerDAO;
	@Autowired BBusinessDAO BeanbBusinessDAO;
//	@Autowired BCouponDAO BeanbCouponDAO;
	@Autowired BEstablishmentDAO BeanbEstablishmentDAO;
	
	// AWS S3 저장 파일명 지정용
	@Autowired BImageDAO BeanbImageDAO;
	
	@PostConstruct
	private void init() {
		this.cCustomerDAO = BeancCustomerDAO;
		this.bBusinessDAO = BeanbBusinessDAO;
//		this.bCouponDAO = BeanbCouponDAO;
		this.bEstablishmentDAO = BeanbEstablishmentDAO;
		
		// AWS S3 저장 파일명 지정용
		this.bImageDAO = BeanbImageDAO;
	}
	
	public static void forAWS(BImageVO VO) {
		bImageVO = new BImageVO();
		bImageVO.setEstid(VO.getEstid());
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
					
				case "BBusiness" : result = bBusinessDAO.confirm(SerialUUID);
					break;
//					
//				case "BCoupon" : result = bCouponDAO.confirm(SerialUUID);
//					break;
//					
				case "BEstablishment" : result = bEstablishmentDAO.confirm(SerialUUID);
					 break;
					 
				case "BImage" : 
					System.out.println("UUID 실행 " + bImageVO.getEstid() +"/"+ SerialUUID);
					bImageVO.setStoreimg(bImageVO.getEstid() +"/"+ SerialUUID);
					result = bImageDAO.confirm(bImageVO);
					System.out.println("confirm result : " + result);
					break;
			}
		}
		
		return SerialUUID;
		
	}
}
