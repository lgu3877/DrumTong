package com.drumtong.customer.vo;

public class CAlarmVO {
	private String memberid;
	private char messageboolean;		// Value : Y or N 
	private char emailboolean;			// Value : Y or N 
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public char getMessageboolean() {
		return messageboolean;
	}
	public void setMessageboolean(char messageboolean) {
		this.messageboolean = messageboolean;
	}
	public char getEmailboolean() {
		return emailboolean;
	}
	public void setEmailboolean(char emailboolean) {
		this.emailboolean = emailboolean;
	}
	
	
}
