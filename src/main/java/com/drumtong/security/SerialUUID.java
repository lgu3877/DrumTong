package com.drumtong.security;

import java.util.UUID;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BBusinessDAO;
import com.drumtong.business.dao.BCouponDAO;
import com.drumtong.business.dao.BEstablishmentDAO;
import com.drumtong.business.dao.BImageDAO;
import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.dao.BPaymentDAO;
import com.drumtong.business.vo.BImageVO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.business.vo.BPaymentVO;
import com.drumtong.customer.dao.CCustomerDAO;
import com.drumtong.customer.dao.CPrivateDataDAO;

@Component
public class SerialUUID {

	static CCustomerDAO cCustomerDAO;
	static BBusinessDAO bBusinessDAO;
	static BCouponDAO bCouponDAO;
	static BEstablishmentDAO bEstablishmentDAO;

	// AWS S3 저장 파일명 지정용
	
	// 매장사진 (주요관리)
	static BImageDAO bImageDAO;
	static BImageVO bImageVO;
	
	// 매장정보 / 결제 (온라인계약)
	static BInformationDAO bInformationDAO;
	static BInformationVO bInformationVO;
	
	static BPaymentDAO bPaymentDAO;
	static BPaymentVO bPaymentVO;
	
	// 고객 프로필사진 저장용
	static CPrivateDataDAO cPrivateDataDAO;
	
	@Autowired CCustomerDAO BeancCustomerDAO;
	@Autowired BBusinessDAO BeanbBusinessDAO;
	@Autowired BCouponDAO BeanbCouponDAO;
	@Autowired BEstablishmentDAO BeanbEstablishmentDAO;
	
	// AWS S3 저장 파일명 지정용
	@Autowired BImageDAO BeanbImageDAO;
	@Autowired BInformationDAO BeanbInformationDAO;
	@Autowired BPaymentDAO BeanbPaymentDAO;
	@Autowired CPrivateDataDAO beancPrivatedataDAO;
	
	@PostConstruct
	private void init() {
		this.cCustomerDAO = BeancCustomerDAO;
		this.bBusinessDAO = BeanbBusinessDAO;
		this.bCouponDAO = BeanbCouponDAO;
		this.bEstablishmentDAO = BeanbEstablishmentDAO;
		
		// AWS S3 저장 파일명 지정용
		this.bImageDAO = BeanbImageDAO;
		this.bInformationDAO = BeanbInformationDAO;
		this.bPaymentDAO = BeanbPaymentDAO;
		this.cPrivateDataDAO = beancPrivatedataDAO;
	}
	
	
	// SerialUUID 생성코드
	public static String getSerialUUID(String TableName, String FieldName) {
		int result = 1;
		String SerialUUID = "";
		
		System.out.println("while문 밖에 serailuuid : " + SerialUUID);
		 
		while(result == 1) {
			
			SerialUUID = FieldName + "_" + UUID.randomUUID().toString().replace("-", "");
			System.out.println("while문 안에 serailuuid : " + SerialUUID);
			switch(TableName) {
				case "CPrivateData" : result = cCustomerDAO.confirm(SerialUUID);
					break;
					
				case "BBusiness" : result = bBusinessDAO.confirm(SerialUUID);
					break;
					
				case "BCoupon" : result = bCouponDAO.confirm(SerialUUID);
					break;
			
				case "BEstablishment" : result = bEstablishmentDAO.confirm(SerialUUID);
					 break;
			
				
				// S3
				case "BImage" : result = bImageDAO.confirm(SerialUUID); 
					break;	 
				
				case "BInformationAboutReportCard" : result = bInformationDAO.ReportCardconfirm(SerialUUID);
					break;
			
				case "BInformationAboutLicense" : result = bInformationDAO.Licenseconfirm(SerialUUID);
					break;
				
				case "BPayment" : result = bPaymentDAO.confirm(SerialUUID);
					break;
				case "CPhotoID" : result = cPrivateDataDAO.confirm(SerialUUID);
					break;
				
			}
		}
		
//		return (TableName.startsWith("C") ? "Customer/" : "Business/") + SerialUUID;
		return SerialUUID;
		
	}
	
//	
//	// AWS S3 저장용 메서드입니다.
//	/*
//	 * 다음과 같은 메서드가 추가적으로 estid 매게변수를 요구하는 이유는 다음과 같다.
//	 * 기존에 생성되는 SerailUUID와 다르게 S3에 저장되기 때문에 파일명 + estid
//	 * 파일명을 셋팅하는 과정에서 필요하기 때문이다. 
//	 * 
//	 */
//	public static String getSerialUUID(String TableName, String FieldName, String estid) {
//		int result = 1;
//		String SerialUUID = "";
//		
////		System.out.println("while문 밖에 serailuuid : " + SerialUUID);
//		
//		while(result == 1) {
//			SerialUUID = FieldName + "_" + UUID.randomUUID().toString().replace("-", "");
//		
//			switch(TableName) {
//		
//			case "BImage" : 
//				result = bImageDAO.confirm(bImageVO);
//				System.out.println("confirm result : " + result);
//				break;
//			
//			//@@@ 중단 다시 시작해야함
//			case "BInformation" :
//				bInformationVO.setReportcard(folderNames + "/" + SerialUUID);
//				result = bInformationDAO.confirm()
//				break;
//			
//			case "BPayment" :
//				break;
//			
//			
//			}
//		}
//
//		return SerialUUID;
//		
//	}
}
