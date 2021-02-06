package com.drumtong.map.vo;

public class MEmdVO extends MCoordValueVO {
	
	// 읍면동 코드
	private String emdcode;
	
	// 읍면동
	private String addressc;
	
	// 시군구
	private String addressb;
	
	// 시도
	private String addressa;
	
	// 해당 지역에 세탁소가 몇 개 인지 구분할 수 있는 필드 ex) 망미동 (13개)
	private String count;
	
	
	
	public String getEmdcode() {
		return emdcode;
	}
	public void setEmdcode(String emdcode) {
		this.emdcode = emdcode;
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
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
}
