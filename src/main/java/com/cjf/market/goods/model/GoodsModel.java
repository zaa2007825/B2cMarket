package com.cjf.market.goods.model;

public class GoodsModel extends Pager{
	private Integer id;
	private String code;
	private String name;
	private String price;
	private String descr;
	private String ammount;
	private String cond;
	private String categorycode;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getAmmount() {
		return ammount;
	}
	public void setAmmount(String ammount) {
		this.ammount = ammount;
	}
	public String getCond() {
		return cond;
	}
	public void setCond(String cond) {
		this.cond = cond;
	}
	public String getCategorycode() {
		return categorycode;
	}
	public void setCategorycode(String categorycode) {
		this.categorycode = categorycode;
	}
	public GoodsModel(Integer id, String code, String name, String price, String descr, String ammount, String cond,
			String categorycode) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.price = price;
		this.descr = descr;
		this.ammount = ammount;
		this.cond = cond;
		this.categorycode = categorycode;
	}
	public GoodsModel() {
		super();
	}
	@Override
	public String toString() {
		return "GoodsModel [id=" + id + ", code=" + code + ", name=" + name + ", price=" + price + ", descr=" + descr
				+ ", ammount=" + ammount + ", cond=" + cond + ", categorycode=" + categorycode + "]";
	}
	
	
}
