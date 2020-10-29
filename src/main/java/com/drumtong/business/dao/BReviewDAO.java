package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BReviewVO;

public interface BReviewDAO {
	
	// 사업장에 해당하는 메인 리뷰를 불러온다.
	List<BReviewVO> selectReview(String estid);

	List<BReviewVO> selectNoReply(String estid);
	
}
