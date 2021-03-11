package com.drumtong.security;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BInformationDAO;
import com.drumtong.business.vo.BInformationVO;
import com.drumtong.map.dao.MEmdDAO;
import com.google.gson.Gson;

@Component
public class SearchAutoComplete {

	@Autowired MEmdDAO beanMEmdDAO;
	@Autowired BInformationDAO beanBInformationDAO;
	
	static MEmdDAO mEmdDAO;
	static BInformationDAO bInformationDAO;
	
	@PostConstruct
	public void init() {
		mEmdDAO = beanMEmdDAO;
		bInformationDAO = beanBInformationDAO;
	}
	
	public static String getSearchAutoJsonVer(String searchWord) {
		return new Gson().toJson(searchAuto(searchWord));
	}
	
	// 직접 접근하는 부분
	public static HashMap<String, List> searchAuto(String searchWord) {
		String[] SearchList = searchWord.split(" ");
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("addressList", getAddressList(SearchList));
		map.put("laundryList", getLaundryList(searchWord));
		return map;
	}
	
	// map 과 비교
	private static List<String> getAddressList(String[] SearchList) {
		return mEmdDAO.searchAutoComplete(SearchList);
	}

	// binformation 과 비교
	private static List<BInformationVO> getLaundryList(String searchWord) {
		return bInformationDAO.searchAutoComplete(searchWord);
	}
}
