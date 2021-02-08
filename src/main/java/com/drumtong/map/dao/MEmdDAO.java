package com.drumtong.map.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.drumtong.map.vo.MSigunguVO;
//건욱
public interface MEmdDAO {
	
	
//	읍면동을 select하는 함수입니다.
	ArrayList<String> selectMEmdAddressC(HashMap<String,String> data);

	// emdcode count를 1 추가한다.[영경]
	int addCount(String emdcode);
	
	// emdcode count를 1 빼준다.[영경]
	int delCount(String emdcode);

	// 읍면동 Select REST [건욱]
	List<MSigunguVO> selectEmd();
	
}
