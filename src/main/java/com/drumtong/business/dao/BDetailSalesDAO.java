package com.drumtong.business.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.BDetailSalesVO;
import com.drumtong.business.vo.EteNums;

public interface BDetailSalesDAO {
	
	//	주문현황 페이지에 필요한 구매정보 데이터를 가져와줍니다. ( 비지니스 주문현황)
	List<BDetailSalesVO> selectBDetailSalesListBusiness(HashMap<String, String> map);
	
	//	주문목록 페이지에 필요한 구매정보 데이터를 가져와줍니다. ( 고객 주문 목록)
	List<BDetailSalesVO> selectBDetailSalesListCustomer(String salecode);
	
	
	// 중복제거한 서브메뉴와 메인메뉴를 가져와줍니다.
	List<String> selectDistinctCategory(HashMap<String, String> map);
	
	List<BDetailSalesVO> selectBDetailSalesMenu(HashMap<String, String> map);

	List<EteNums> calcEte(HashMap<String, String> map);
}
