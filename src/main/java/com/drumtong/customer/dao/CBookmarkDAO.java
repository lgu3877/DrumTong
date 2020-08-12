package com.drumtong.customer.dao;

import java.util.HashMap;

import com.drumtong.customer.vo.CBookmarkVO;

public interface CBookmarkDAO {
	
//	북마크 추가되어있는지 확인
	CBookmarkVO isCheck(HashMap<String, String> param);

	int insert(HashMap<String, String> param);

	int delete(HashMap<String, String> param);
	
}
