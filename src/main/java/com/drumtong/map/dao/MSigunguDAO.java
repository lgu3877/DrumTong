package com.drumtong.map.dao;


import java.util.ArrayList;
import java.util.List;

import com.drumtong.map.vo.MSigunguVO;


// 시군구 DAO
public interface MSigunguDAO {

	List<MSigunguVO> getsigunguxy();

	ArrayList<String> selectMSigunguAddressB(String sido);
	
}
