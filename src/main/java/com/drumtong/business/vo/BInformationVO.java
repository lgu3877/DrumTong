package com.drumtong.business.vo;

import com.drumtong.map.vo.MCoordValueVO;

public class BInformationVO extends MCoordValueVO {
	private String estid;
	private String taxation;
	private String crn;
	private String brandnaming;
	private String representative;
	private String mainlocation;
	private String detaillocation;
	private String reportcard;
	private String license;
	private String status;
	private String premiumboolean;
	private String emdcode;
	
	public String getEmdcode() {
		return emdcode;
	}
	public void setEmdcode(String emdcode) {
		this.emdcode = emdcode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPremiumboolean() {
		return premiumboolean;
	}
	public void setPremiumboolean(String premiumboolean) {
		this.premiumboolean = premiumboolean;
	}
	public String getEstid() {
		return estid;
	}
	public void setEstid(String estid) {
		this.estid = estid;
	}
	public String getTaxation() {
		return taxation;
	}
	public void setTaxation(String taxation) {
		this.taxation = taxation;
	}
	public String getCrn() {
		return crn;
	}
	public void setCrn(String crn) {
		this.crn = crn;
	}
	public String getBrandnaming() {
		return brandnaming;
	}
	public void setBrandnaming(String brandnaming) {
		this.brandnaming = brandnaming;
	}
	public String getRepresentative() {
		return representative;
	}
	public void setRepresentative(String representative) {
		this.representative = representative;
	}
	public String getMainlocation() {
		return mainlocation;
	}
	public void setMainlocation(String mainlocation) {
		this.mainlocation = mainlocation;
	}
	public String getDetaillocation() {
		return detaillocation;
	}
	public void setDetaillocation(String detaillocation) {
		this.detaillocation = detaillocation;
	}
	public String getReportcard() {
		return reportcard;
	}
	public void setReportcard(String reportcard) {
		this.reportcard = reportcard;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	
}
