package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BMenuVO;

public interface BMenuDAO {

	List<BMenuVO> select(String estid);

}
