package com.drumtong.business.dao;

import com.drumtong.business.vo.ReviewList;

public interface BBusinessReviewDAO {

	int updateReply(ReviewList reviewList);

	int deleteReply(ReviewList reviewList);

	int insertNewReview(ReviewList review);

}
