package com.cjf.market.goods.model;

public class ImageModel extends Pager{
	private Integer id;
	private String code;
	private String url;
	private String type;
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
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ImageModel(Integer id, String code, String url, String type) {
		super();
		this.id = id;
		this.code = code;
		this.url = url;
		this.type = type;
	}
	public ImageModel() {
		super();
	}
	@Override
	public String toString() {
		return "ImageModel [id=" + id + ", code=" + code + ", url=" + url + ", type=" + type + "]";
	}
	
}
