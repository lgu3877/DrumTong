package com.drumtong.business.vo;

public class BTempSuspensionVO {
	private String estid;
	private String beginday;
	private String endday;
	private String updatebeginday;	// PK 가 estid,beginday,endday로 구성되어 있기 떄문에
	private String updateendday;	// Update문을 사용할 때 추가되는 데이터는 기존의 날짜와 구분시켜서 받아와야합니다.
	private String reason;
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getBeginday() {
		return beginday;
	}
	public void setBeginday(String beginday) {
		this.beginday = beginday;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public String getUpdatebeginday() {
		return updatebeginday;
	}
	public void setUpdatebeginday(String updatebeginday) {
		this.updatebeginday = updatebeginday;
	}
	public String getUpdateendday() {
		return updateendday;
	}
	public void setUpdateendday(String updateendday) {
		this.updateendday = updateendday;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	
	
}
