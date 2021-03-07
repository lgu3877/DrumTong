package com.drumtong.customer.dao;

import java.util.HashMap;

import com.drumtong.customer.vo.CCouponVO;

public interface CCouponDAO {

	CCouponVO selectCheck(HashMap<String, String> param);
	
	int insertCoupon(HashMap<String, String> param);

	int useCoupon(HashMap<String, String> map);

}
