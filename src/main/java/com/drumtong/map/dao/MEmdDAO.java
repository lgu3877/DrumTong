package com.drumtong.map.dao;

import java.util.ArrayList;
import java.util.HashMap;
//건욱
public interface MEmdDAO {
	
	
//	읍면동을 select하는 함수입니다.
	ArrayList<String> selectMEmdAddressC(HashMap<String,String> data);

	// emdcode count를 1 추가한다.[영경]
	int addCount(String emdcode);
	
}
