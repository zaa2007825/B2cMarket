package com.cjf.market.order.model;

public class OrderGoodsModel extends Pager{
	Integer id;
	String ordercode;
	String goodscode;
	String goodsimage;
	String goodsname;
	String ammount;
	String price;
	
	public OrderGoodsModel() {
		super();
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getOrdercode() {
		return ordercode;
	}

	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}

	public String getGoodscode() {
		return goodscode;
	}

	public void setGoodscode(String goodscode) {
		this.goodscode = goodscode;
	}

	public String getGoodsimage() {
		return goodsimage;
	}

	public void setGoodsimage(String goodsimage) {
		this.goodsimage = goodsimage;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public String getAmmount() {
		return ammount;
	}

	public void setAmmount(String ammount) {
		this.ammount = ammount;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public OrderGoodsModel(Integer id, String ordercode, String goodscode, String goodsimage, String goodsname,
			String ammount, String price) {
		super();
		this.id = id;
		this.ordercode = ordercode;
		this.goodscode = goodscode;
		this.goodsimage = goodsimage;
		this.goodsname = goodsname;
		this.ammount = ammount;
		this.price = price;
	}

	@Override
	public String toString() {
		return "OrderGoodsModel [id=" + id + ", ordercode=" + ordercode + ", goodscode=" + goodscode + ", goodsimage="
				+ goodsimage + ", goodsname=" + goodsname + ", ammount=" + ammount + ", price=" + price + "]";
	}

	
	
	
}
