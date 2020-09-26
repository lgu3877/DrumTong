package com.drumtong.business.vo;

import com.drumtong.security.PrivateData;

public class BPrivateDataVO extends PrivateData{
	private String bpersonid;
	private String delegatecrn;
	
	public String getBpersonid() {
		return bpersonid;
	}
	public void setBpersonid(String bpersonid) {
		this.bpersonid = bpersonid;
	}
	public String getDelegatecrn() {
		return delegatecrn;
	}
	public void setDelegatecrn(String delegatecrn) {
		this.delegatecrn = delegatecrn;
	}
	
	
}
