package com.drumtong.business.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.BCouponVO;
import com.drumtong.customer.vo.CouponList;

public interface BCouponDAO {

	List<BCouponVO> select(String estid);

	List<BCouponVO> selectUsableCoupon(HashMap<String, String> map);

	int insertCoupon(BCouponVO bcouponvo);

	int confirm(String serialUUID);

	int deleteCoupon(BCouponVO bcouponvo);

	// 고객 계정관리의 쿠폰 리스트를 가져와주는 메서드
	List<CouponList> selectCouponList(String memberid);

}
