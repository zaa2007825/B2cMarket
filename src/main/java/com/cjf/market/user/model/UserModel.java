package com.cjf.market.user.model;

public class UserModel extends Pager{
	private Integer id;
	private String account;
	private String username;
	private String password;
	private String admin;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public UserModel(Integer id, String account, String username, String password, String admin) {
		super();
		this.id = id;
		this.account = account;
		this.username = username;
		this.password = password;
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "UserModel [id=" + id + ", account=" + account + ", username=" + username + ", password=" + password
				+ ", admin=" + admin + "]";
	}
	public UserModel() {
		
	}
	
	
}
