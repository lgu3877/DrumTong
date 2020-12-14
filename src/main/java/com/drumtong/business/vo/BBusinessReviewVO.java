package com.drumtong.business.vo;

public class BBusinessReviewVO {
	private String memberid;
	private String estid;
	private String salecode;
	private String content;
	private String registdate;
	private String updaatedate;
	private char deleteboolean;
	private String deletedate;
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getSalecode() {
		return salecode;
	}
	public void setSalecode(String salecode) {
		this.salecode = salecode;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getUpdaatedate() {
		return updaatedate;
	}
	public void setUpdaatedate(String updaatedate) {
		this.updaatedate = updaatedate;
	}
	public char getDeleteboolean() {
		return deleteboolean;
	}
	public void setDeleteboolean(char deleteboolean) {
		this.deleteboolean = deleteboolean;
	}
	public String getDeletedate() {
		return deletedate;
	}
	public void setDeletedate(String deletedate) {
		this.deletedate = deletedate;
	}
	
}
