package com.drumtong.business.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.BDetailSalesVO;

public interface BDetailSalesDAO {
	
	//	주문현황 페이지에 필요한 구매정보 데이터를 가져와줍니다. ( 비지니스 주문현황)
	List<BDetailSalesVO> selectBDetailSalesListBusiness(HashMap<String, String> map);
	
	//	주문목록 페이지에 필요한 구매정보 데이터를 가져와줍니다. ( 고객 주문 목록)
	List<BDetailSalesVO> selectBDetailSalesListCustomer(String salecode);

}
