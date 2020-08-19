package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BInformationVO;
import com.drumtong.customer.vo.CCustomerVO;

public interface BInformationDAO {

	BInformationVO selectCustomerDetail(String estid);
	
	// 사업장의 위도와 경도를 받아온다.
	List<BInformationVO> selectBusinessMapInfo();

	List<BInformationVO> selectBookmark(String memberid);

}
