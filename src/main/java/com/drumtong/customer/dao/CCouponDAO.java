package com.drumtong.customer.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.customer.vo.CCouponVO;
import com.drumtong.customer.vo.CCustomerVO;

public interface CCouponDAO {

	CCouponVO selectCheck(HashMap<String, String> param);
	
	int insertCoupon(HashMap<String, String> param);
}
