package com.drumtong.customer.controller.laundry;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BInformationVO;


@Service
public class RestCustomerLaundryService {
	@Autowired BInformationDAO bInformationDAO;		
	
	
	public List<BInformationVO> BusinessMapInfo(){
		
		// 사업장의 위도와 경도를 받아온다.
		return bInformationDAO.selectBusinessMapInfo();
	}

}
