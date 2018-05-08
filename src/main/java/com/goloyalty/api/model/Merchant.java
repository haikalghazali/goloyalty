package com.goloyalty.api.model;

import java.util.Date;

public class Merchant {
	private String merchant_id;
	private String merchant_name;
	private String company_no;
	private String representative_name;
	private String representative_email;
	private String representative_mobile;
	private String address;
	private String postcode;
	private String state;
	private String country;
	private String active;
	private String inst_id;
	private Date inst_dtm;
	private String mdf_id;
	private Date mdf_dtm;
	
	public Merchant(String merchant_id, String merchant_name, String company_no, String representative_name,
			String representative_email, String representative_mobile, String address, String postcode, String state,
			String country, String active, String inst_id, Date inst_dtm, String mdf_id, Date mdf_dtm) {
		super();
		this.merchant_id = merchant_id;
		this.merchant_name = merchant_name;
		this.company_no = company_no;
		this.representative_name = representative_name;
		this.representative_email = representative_email;
		this.representative_mobile = representative_mobile;
		this.address = address;
		this.postcode = postcode;
		this.state = state;
		this.country = country;
		this.active = active;
		this.inst_id = inst_id;
		this.inst_dtm = inst_dtm;
		this.mdf_id = mdf_id;
		this.mdf_dtm = mdf_dtm;
	}

	public String getMerchant_id() {
		return merchant_id;
	}
	
	public void setMerchant_id(String merchant_id) {
		this.merchant_id = merchant_id;
	}
	
	public String getMerchant_name() {
		return merchant_name;
	}
	
	public void setMerchant_name(String merchant_name) {
		this.merchant_name = merchant_name;
	}
	
	public String getCompany_no() {
		return company_no;
	}
	
	public void setCompany_no(String company_no) {
		this.company_no = company_no;
	}
	
	public String getRepresentative_name() {
		return representative_name;
	}
	
	public void setRepresentative_name(String representative_name) {
		this.representative_name = representative_name;
	}
	
	public String getRepresentative_email() {
		return representative_email;
	}
	
	public void setRepresentative_email(String representative_email) {
		this.representative_email = representative_email;
	}
	
	public String getRepresentative_mobile() {
		return representative_mobile;
	}
	
	public void setRepresentative_mobile(String representative_mobile) {
		this.representative_mobile = representative_mobile;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getPostcode() {
		return postcode;
	}
	
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
	
	public String getCountry() {
		return country;
	}
	
	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getActive() {
		return active;
	}
	
	public void setActive(String active) {
		this.active = active;
	}
	
	public String getInst_id() {
		return inst_id;
	}
	
	public void setInst_id(String inst_id) {
		this.inst_id = inst_id;
	}
	
	public Date getInst_dtm() {
		return inst_dtm;
	}
	
	public void setInst_dtm(Date inst_dtm) {
		this.inst_dtm = inst_dtm;
	}
	
	public String getMdf_id() {
		return mdf_id;
	}
	
	public void setMdf_id(String mdf_id) {
		this.mdf_id = mdf_id;
	}
	
	public Date getMdf_dtm() {
		return mdf_dtm;
	}
	
	public void setMdf_dtm(Date mdf_dtm) {
		this.mdf_dtm = mdf_dtm;
	}
	
	@Override
	public String toString() {
		return "Merchant [merchant_id=" + merchant_id + ", merchant_name=" + merchant_name + ", company_no="
				+ company_no + ", representative_name=" + representative_name + ", representative_email="
				+ representative_email + ", representative_mobile=" + representative_mobile + ", address=" + address
				+ ", postcode=" + postcode + ", state=" + state + ", country=" + country + ", active=" + active
				+ ", inst_id=" + inst_id + ", inst_dtm=" + inst_dtm + ", mdf_id=" + mdf_id + ", mdf_dtm=" + mdf_dtm
				+ "]";
	}
}
