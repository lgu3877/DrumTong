package com.drumtong.map.vo;

public class MEmdVO extends MCoordValueVO {
	
	// 읍면동 코드
	private String emdcode;
	
	// 읍면동
	private String emdname;
	
	// 시군구
	private String signame;
	
	// 시도
	private String sidoname;
	
	// 해당 지역에 세탁소가 몇 개 인지 구분할 수 있는 필드 ex) 망미동 (13개)
	private String count;
	
	

	public String getEmdcode() {
		return emdcode;
	}

	public void setEmdcode(String emdcode) {
		this.emdcode = emdcode;
	}

	public String getEmdname() {
		return emdname;
	}

	public void setEmdname(String emdname) {
		this.emdname = emdname;
	}

	public String getSigname() {
		return signame;
	}

	public void setSigname(String signame) {
		this.signame = signame;
	}

	public String getSidoname() {
		return sidoname;
	}

	public void setSidoname(String sidoname) {
		this.sidoname = sidoname;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
	
	
	
}
