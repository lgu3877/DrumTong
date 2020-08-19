package com.drumtong.business.dao;

import java.util.List;

import com.drumtong.business.vo.BImageVO;

public interface BImageDAO {
	List<BImageVO> selectImageList(String estid);
}
