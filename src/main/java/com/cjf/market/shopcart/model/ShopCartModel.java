package com.cjf.market.shopcart.model;

public class ShopCartModel {
	private Integer id;
	private String account;
	private String code;
	private String ammount;
	private String url;
	private String name;
	private String price;
	public String getUrl() {
		return url;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getAmmount() {
		return ammount;
	}
	public void setAmmount(String ammount) {
		this.ammount = ammount;
	}
	
	@Override
	public String toString() {
		return "ShopCartModel [id=" + id + ", account=" + account + ", code=" + code + ", ammount=" + ammount + ", url="
				+ url + ", name=" + name + ", price=" + price + "]";
	}
	public ShopCartModel(Integer id, String account, String code, String ammount, String url, String name,
			String price) {
		super();
		this.id = id;
		this.account = account;
		this.code = code;
		this.ammount = ammount;
		this.url = url;
		this.name = name;
		this.price = price;
	}
	public ShopCartModel() {
	}
	
}
