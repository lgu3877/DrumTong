package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BSalesVO;

public interface BSalesDAO {

	//	주문현황 페이지에 필요한 구매정보 데이터를 가져와줍니다. 
	List<BSalesVO> selectBSales(String estid);
	
	

}
