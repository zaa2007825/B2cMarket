package com.cjf.market.order.model;

public class OrderModel extends Pager{
	Integer id;
	String code;
	String account;
	String username;
	String time;
	String address;
	String cond;
	
	@Override
	public String toString() {
		return "OrderModel [id=" + id + ", code=" + code + ", account=" + account + ", username=" + username + ", time="
				+ time + ", address=" + address + ", cond=" + cond + "]";
	}

	public OrderModel(Integer id, String code, String account, String username, String time, String address,
			String cond) {
		super();
		this.id = id;
		this.code = code;
		this.account = account;
		this.username = username;
		this.time = time;
		this.address = address;
		this.cond = cond;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCond() {
		return cond;
	}

	public void setCond(String cond) {
		this.cond = cond;
	}

	public OrderModel() {
		super();
	}
	
}
