package com.goloyalty.api.model;

import java.util.Date;

public class Deal {
	private String deal_id;
	private String deal_name;
	private String deal_description;
	private Merchant merchant;
	private Date deal_start_dt;
	private Date deal_end_dt;
	private String deal_quantity;
	private String deal_quantity_user;
	private String deal_location;
	private String deal_approval_status;
	private String active;
	private String inst_id;
	private Date inst_dtm;
	private String mdf_id;
	private Date mdf_dtm;
	
	public Deal(String deal_id, String deal_name, String deal_description, Merchant merchant, Date deal_start_dt,
			Date deal_end_dt, String deal_quantity, String deal_quantity_user, String deal_location,
			String deal_approval_status, String active, String inst_id, Date inst_dtm, String mdf_id, Date mdf_dtm) {
		super();
		this.deal_id = deal_id;
		this.deal_name = deal_name;
		this.deal_description = deal_description;
		this.merchant = merchant;
		this.deal_start_dt = deal_start_dt;
		this.deal_end_dt = deal_end_dt;
		this.deal_quantity = deal_quantity;
		this.deal_quantity_user = deal_quantity_user;
		this.deal_location = deal_location;
		this.deal_approval_status = deal_approval_status;
		this.active = active;
		this.inst_id = inst_id;
		this.inst_dtm = inst_dtm;
		this.mdf_id = mdf_id;
		this.mdf_dtm = mdf_dtm;
	}

	public String getDeal_id() {
		return deal_id;
	}
	
	public void setDeal_id(String deal_id) {
		this.deal_id = deal_id;
	}
	
	public String getDeal_name() {
		return deal_name;
	}
	
	public void setDeal_name(String deal_name) {
		this.deal_name = deal_name;
	}
	
	public String getDeal_description() {
		return deal_description;
	}
	
	public void setDeal_description(String deal_description) {
		this.deal_description = deal_description;
	}
	
	public Merchant getMerchant() {
		return merchant;
	}
	
	public void setMerchant(Merchant merchant) {
		this.merchant = merchant;
	}
	
	public Date getDeal_start_dt() {
		return deal_start_dt;
	}
	
	public void setDeal_start_dt(Date deal_start_dt) {
		this.deal_start_dt = deal_start_dt;
	}
	
	public Date getDeal_end_dt() {
		return deal_end_dt;
	}
	
	public void setDeal_end_dt(Date deal_end_dt) {
		this.deal_end_dt = deal_end_dt;
	}
	
	public String getDeal_quantity() {
		return deal_quantity;
	}
	
	public void setDeal_quantity(String deal_quantity) {
		this.deal_quantity = deal_quantity;
	}
	
	public String getDeal_quantity_user() {
		return deal_quantity_user;
	}
	
	public void setDeal_quantity_user(String deal_quantity_user) {
		this.deal_quantity_user = deal_quantity_user;
	}
	
	public String getDeal_location() {
		return deal_location;
	}
	
	public void setDeal_location(String deal_location) {
		this.deal_location = deal_location;
	}
	
	public String getDeal_approval_status() {
		return deal_approval_status;
	}
	
	public void setDeal_approval_status(String deal_approval_status) {
		this.deal_approval_status = deal_approval_status;
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
		return "Deal [deal_id=" + deal_id + ", deal_name=" + deal_name + ", deal_description=" + deal_description
				+ ", merchant=" + merchant + ", deal_start_dt=" + deal_start_dt + ", deal_end_dt=" + deal_end_dt
				+ ", deal_quantity=" + deal_quantity + ", deal_quantity_user=" + deal_quantity_user + ", deal_location="
				+ deal_location + ", deal_approval_status=" + deal_approval_status + ", active=" + active + ", inst_id="
				+ inst_id + ", inst_dtm=" + inst_dtm + ", mdf_id=" + mdf_id + ", mdf_dtm=" + mdf_dtm + "]";
	}
}
