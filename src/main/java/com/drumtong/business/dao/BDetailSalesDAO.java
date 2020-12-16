package com.drumtong.business.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.BDetailSalesVO;

public interface BDetailSalesDAO {
	
//	주문현황 페이지에 필요한 구매정보 데이터를 가져와줍니다.
	List<BDetailSalesVO> selectBDetailSalesList(HashMap<String, String> map);

}
