package com.drumtong.system.dao;

import java.util.List;

import com.drumtong.system.vo.SImageVO;

public interface SImageDAO {

	// 정적 이미지 List를 가져옵니다. [건욱]
	List<SImageVO> selectSImageSRC(String categoryname);
}
