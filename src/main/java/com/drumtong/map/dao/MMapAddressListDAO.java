package com.drumtong.map.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public interface MMapAddressListDAO {

	// 시도 select문  [건욱]
	List<String> selectMMapAddressA();
	
	// 시,군,구 select문 [건욱]
	ArrayList<String> selectMMapAddressB(String sido);
	
	//	읍,면,동 select문 [건욱]
	ArrayList<String> selectMMapAddressC(HashMap<String,String> data);
}
