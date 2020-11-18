package com.drumtong.business.dao;

import java.util.HashMap;
import java.util.List;

import com.drumtong.business.vo.BCouponVO;

public interface BCouponDAO {

	List<BCouponVO> select(String estid);

	List<BCouponVO> selectUsableCoupon(HashMap<String, String> map);

	int insertCoupon(BCouponVO bcouponvo);

	int confirm(String serialUUID);

	int deleteCoupon(BCouponVO bcouponvo);

}
