package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BCustomerReviewVO;

public interface BCustomerReviewDAO {
	
	// 사업장에 해당하는 고객 리뷰를 불러온다.
	List<BCustomerReviewVO> selectReview(String estid);

	List<BCustomerReviewVO> selectNoReply(String estid);

}
