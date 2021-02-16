package com.drumtong.business.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.OrderList;
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

	// 주문 목록 데이터 Bsales, BDetailSales, Binformation Join되어있음. (business 쪽에서는 estid로 호출 customer쪽에서는 memberid로 호출합니다.)
	List<OrderList> selectOrderList(HashMap<String, String> param);

	// 주문목록 업데이트
	int updateOrderList(HashMap<String, String> map);

	//주문목록 삭제
	int deleteOrderList(HashMap<String, String> map);

	// 방문횟수 조회
	int visits(HashMap<String, String> paramVisit);
	
	

}
