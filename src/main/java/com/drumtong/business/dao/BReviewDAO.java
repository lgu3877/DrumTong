package com.drumtong.business.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.OrderList;
import com.drumtong.business.vo.ReviewList;

public interface BReviewDAO {
	
	// 사업장에 해당하는 메인 리뷰의 개수 불러온다.
	int selectReviewNum(HashMap<String, String> estid);

	// 페이지별 리뷰 불러오기
	List<ReviewList> selectReview(HashMap<String, String> map);

	int updateReplyConfirm(ReviewList reviewList);

	int updateReportConfirm(ReviewList reviewList);

	int deleteReportConfirm(ReviewList reviewList);

	int checkReview(OrderList li);
}
