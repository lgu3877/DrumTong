package com.drumtong.map.vo;

import java.util.ArrayList;
import java.util.HashMap;

public class MMapAddressListVO {
//	// 읍,면,동
	private String addressc;
//	// 시,군,구
	private String addressb;
//	// 시,도
	private String addressa;
	
	
//					시,도                           시,군,구			      읍,면,동
	private HashMap<String, HashMap<String , ArrayList<String>>> addressList;

	
	public HashMap<String, HashMap<String , ArrayList<String>>> getAddressList() {
		return addressList;
	}

	public void setAddressList(HashMap<String, HashMap<String , ArrayList<String>>> addressList) {
		this.addressList = addressList;
	}

	public String getAddressc() {
		return addressc;
	}

	public void setAddressc(String addressc) {
		this.addressc = addressc;
	}

	public String getAddressb() {
		return addressb;
	}

	public void setAddressb(String addressb) {
		this.addressb = addressb;
	}

	public String getAddressa() {
		return addressa;
	}

	public void setAddressa(String addressa) {
		this.addressa = addressa;
	}
	
	
	
}
