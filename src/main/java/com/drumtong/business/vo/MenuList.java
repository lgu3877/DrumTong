package com.drumtong.business.vo;

import java.util.HashMap;
import java.util.List;

public class MenuList {
	private String estid;
	private HashMap<String, HashMap<String, List<BMenuVO>>> menuList;
	
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public HashMap<String, HashMap<String, List<BMenuVO>>> getMenuList() {
		return menuList;
	}
	public void setMenuList(HashMap<String, HashMap<String, List<BMenuVO>>> menuList) {
		this.menuList = menuList;
	}
	
	
}
