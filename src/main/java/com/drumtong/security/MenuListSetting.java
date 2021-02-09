package com.drumtong.security;

import java.util.HashMap;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.drumtong.business.dao.BMenuDAO;
import com.drumtong.business.vo.BMenuVO;
import com.drumtong.business.vo.MenuList;

// 영경
@Component
public class MenuListSetting {
	static BMenuDAO bMenuDAO;
	
	@Autowired BMenuDAO beanBMenuDAO;
	
	@PostConstruct
	public void init() {
		bMenuDAO = beanBMenuDAO;
	}
	
	// 메뉴를 그룹화
	public static MenuList selectMenuList(String estid) {
		
		// getMainCategory : 메인 카테고리를 생성해주고, 그 외 함수들 실행 후 반환해준다.
		MenuList menuList = getMenuList(estid);
		
		return menuList;
	}

	private static MenuList getMenuList(String estid) {
		MenuList menuList = new MenuList();
		menuList.setEstid(estid);
		// 1. Main 카테고리 값 가지고 오기
		List<String> mainCate = bMenuDAO.selectMaincategories(estid);
		
		menuList.setMenuList(getSubList(mainCate, estid));
		
		//저장
		return menuList;
	}

	private static HashMap<String,HashMap<String,List<BMenuVO>>> getSubList(List<String> mainCate, String estid) {
		HashMap<String,HashMap<String,List<BMenuVO>>> mainMap = new HashMap<String, HashMap<String,List<BMenuVO>>>();
		for(String mc : mainCate) {
			BMenuVO param = new BMenuVO();
			param.setEstid(estid);
			param.setMaincategory(mc);
			List<String> subCate = bMenuDAO.selectSubcategories(param);
			mainMap.put(mc, getMenuNameList(subCate, param));
		}
		return mainMap;
	}

	private static HashMap<String, List<BMenuVO>> getMenuNameList(List<String> subCate, BMenuVO param) {
		HashMap<String,List<BMenuVO>> subMap = new HashMap<String, List<BMenuVO>>();
		for(String sc : subCate) {
			param.setSubcategory(sc);
			List<BMenuVO> menu = bMenuDAO.selectMenu(param);
			subMap.put(sc, menu);
		}
		return subMap;
	}


}
