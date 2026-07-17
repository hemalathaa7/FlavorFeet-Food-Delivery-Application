package com.tap.Model;

import java.sql.Timestamp;

public class user {
	int userId;
	String userName;
	String password;
	String email;
	String adress;
	String role;
	Timestamp createDate;
	Timestamp lastLoginDate;
	

	
	public user() {
		// TODO Auto-generated constructor stub
	}



	public user(int userId, String userName, String password, String email, String adress, String role,
			Timestamp createDate, Timestamp lastLoginDate) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.adress = adress;
		this.role = role;
		this.createDate = createDate;
		this.lastLoginDate = lastLoginDate;
	}



	public user(int userId, String userName, String password, String email, String adress, String role) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.adress = adress;
		this.role = role;
		
	}

	


	public int getUserId() {
		return userId;
	}



	public void setUserId(int userId) {
		this.userId = userId;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getAdress() {
		return adress;
	}



	public void setAdress(String adress) {
		this.adress = adress;
	}



	public String getRole() {
		return role;
	}



	public void setRole(String role) {
		this.role = role;
	}



	public Timestamp getCreateDate() {
		return createDate;
	}



	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}



	public Timestamp getLastLoginDate() {
		return lastLoginDate;
	}



	public void setLastLoginDate(Timestamp lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}



	@Override
	public String toString() {
		return "user [userId=" + userId + ", userName=" + userName + ", password=" + password + ", email=" + email
				+ ", adress=" + adress + ", role=" + role + ", createDate=" + createDate + ", lastLoginDate="
				+ lastLoginDate + "]";
	}
	
	
	
}