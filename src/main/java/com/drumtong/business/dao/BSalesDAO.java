package com.drumtong.business.dao;

import java.util.HashMap;
import com.drumtong.business.vo.StatisticsData;

public interface BSalesDAO {

	//	주문현황 페이지에 필요한 구매정보 데이터를 가져와줍니다. 
//	List<BSalesVO> selectBSales(String estid);

	// 주문수 통계
	int CountOrder(StatisticsData statisticsData);

	// 주문금액 통계
	int CountPrice(StatisticsData statisticsData);
	
	// 메인 프리뷰 주문 수(요청, 처리중, 완료) 데이터
	HashMap<String, Integer> getMainPreviewOrder(String estid);

	// 메인 프리뷰 매출(오늘, 이번주, 이번달) 데이터
	HashMap<String, Integer> getMainPreviewPrice(String estid);
	
	// 세탁물 판매량(오늘, 이번주, 이번달) 데이터
	HashMap<String, Integer> getMainPreviewLaundry(String estid);
	
	

}
