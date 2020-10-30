package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BBusinessReviewVO;

public interface BBusinessReviewDAO {

	// 사업장에 해당하는 사업자 리뷰를 불러온다.
	List<BBusinessReviewVO> selectReview(String estid);

}
