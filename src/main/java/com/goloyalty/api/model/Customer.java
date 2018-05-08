package com.goloyalty.api.model;

public class Customer {
	private String user_id;
	private String username;
	private String firstname;
	private String lastname;
	private String dob;
	private String email;
	private String mobile_number;
	private Role user_role;
	
	public Customer(String user_id, String username, String firstname, String lastname, String dob, String email,
			String mobile_number, Role user_role) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.email = email;
		this.mobile_number = mobile_number;
		this.user_role = user_role;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile_number() {
		return mobile_number;
	}

	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}

	public Role getUser_role() {
		return user_role;
	}

	public void setUser_role(Role user_role) {
		this.user_role = user_role;
	}
	
	
}
