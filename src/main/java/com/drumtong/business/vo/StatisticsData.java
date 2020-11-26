package com.drumtong.business.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class StatisticsData {
	private String estid;
	private Date startdate;
	private Date enddate;
	private String start;
	private String end;
	private int value;
	
	public StatisticsData() {}
	public StatisticsData(String estid, Date startdate, Date enddate) {
		this.estid = estid;
		setStartdate(startdate);
		setEnddate(enddate);
	}
	public StatisticsData(String estid, int value, Date startdate, Date enddate) {
		this.estid = estid;
		this.value= value;
		setStartdate(startdate);
		setEnddate(enddate);
	}
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
		setStart(new SimpleDateFormat("yyyy-MM-dd").format(startdate));
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
		setEnd(new SimpleDateFormat("yyyy-MM-dd").format(enddate));
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	
}
