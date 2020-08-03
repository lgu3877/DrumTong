package com.drumtong.customer.vo;

public class CPrivateDataVO {
	private String memberid;
	private String id;
	private String pw;
	private String name;
	private String birth;
	private char genderboolean;		// Value : M or W 
	private String phonenum;
	private String mainaddress;
	private String detailaddress;
	private String mainreceiptaddress;
	private String detailreceiptaddress;
	private String email;
	
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	
	public char getGenderboolean() {
		return genderboolean;
	}
	public void setGenderboolean(char genderboolean) {
		this.genderboolean = genderboolean;
	}
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	public String getMainaddress() {
		return mainaddress;
	}
	public void setMainaddress(String mainaddress) {
		this.mainaddress = mainaddress;
	}
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}
