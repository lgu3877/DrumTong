package com.drumtong.business.vo;

public class BEstablishmentVO {
	private String bpersonid;
	private String estid;
	private String registdate;
	private String updatedate;
	private char deleteboolean;
	private String deletedate;
	
	public String getBpersonid() {
		return bpersonid;
	}
	public void setBpersonid(String bpersonid) {
		this.bpersonid = bpersonid;
	}
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getRegistdate() {
		return registdate;
	}
	public void setRegistdate(String registdate) {
		this.registdate = registdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
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
