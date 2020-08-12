package com.drumtong.system.vo;

public class SCustomerBoardVO {
	private String notice;
	private int num;
	private String title;
	private String content;
	private String registdate;
	private String updatedate;
	private char deleteboolean;
	private String deletedate;
	
	public String getNotice() {
		return notice;
	}
	public void setNotice(String notice) {
		this.notice = notice;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public char getDeleteboolean() {
		return deleteboolean;
	}
	public void setDeleteboolean(char deleteboolean) {
		this.deleteboolean = deleteboolean;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getDeletedate() {
		return deletedate;
	}
	public void setDeletedate(String deletedate) {
		this.deletedate = deletedate;
	}
	
	
}
