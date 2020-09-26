package com.drumtong.customer.vo;

import com.drumtong.security.PrivateData;

public class CPrivateDataVO extends PrivateData{
	private String memberid;
	private String mainreceiptaddress;
	private String detailreceiptaddress;
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMainreceiptaddress() {
		return mainreceiptaddress;
	}
	public void setMainreceiptaddress(String mainreceiptaddress) {
		this.mainreceiptaddress = mainreceiptaddress;
	}
	public String getDetailreceiptaddress() {
		return detailreceiptaddress;
	}
	public void setDetailreceiptaddress(String detailreceiptaddress) {
		this.detailreceiptaddress = detailreceiptaddress;
	}
	
	
}
