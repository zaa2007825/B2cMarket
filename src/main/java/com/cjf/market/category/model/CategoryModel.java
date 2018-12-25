package com.cjf.market.category.model;

public class CategoryModel extends Pager{
	private Integer id;
	private String code;
	private String name;
	private String descr;
	private String parentcode;
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
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public String getParentcode() {
		return parentcode;
	}
	public void setParentcode(String parentcode) {
		this.parentcode = parentcode;
	}
	public CategoryModel(Integer id, String code, String name, String descr, String parentcode) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.descr = descr;
		this.parentcode = parentcode;
	}
	public CategoryModel() {
		super();
	}
	@Override
	public String toString() {
		return "CategoryModel [id=" + id + ", code=" + code + ", name=" + name + ", descr=" + descr + ", parentcode="
				+ parentcode + "]";
	}
	
}
