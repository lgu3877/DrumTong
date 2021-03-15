package com.drumtong.system.dao;

import java.util.HashMap;

import com.drumtong.system.vo.SVirtualAccoutVO;

public interface SVirtualAccoutDAO {

	int insert(SVirtualAccoutVO sVirtualAccoutVO);

	int refund(HashMap<String, String> map);
	
}
