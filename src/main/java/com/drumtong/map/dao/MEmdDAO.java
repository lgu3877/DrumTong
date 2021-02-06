package com.drumtong.map.dao;

import java.util.ArrayList;
import java.util.HashMap;
//건욱
public interface MEmdDAO {
	
	
//	읍면동을 select하는 함수입니다.
	ArrayList<String> selectMEmdAddressC(HashMap<String,String> data);
	
}
