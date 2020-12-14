package com.drumtong.business.dao;

import java.util.HashMap;

import com.drumtong.business.vo.StatisticsData;

public interface BHitsDAO {

	// 원하는 기간에 맞는 조회수 구하기
	int CountHit(StatisticsData statisticsData);

	// 메인 프리뷰에서 사용하는 방문량
	HashMap<String, Integer> getMainPreviewHits(String estid);

}
