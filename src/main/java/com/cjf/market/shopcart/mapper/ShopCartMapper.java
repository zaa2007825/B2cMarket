package com.cjf.market.shopcart.mapper;

import java.util.List;

import com.cjf.market.shopcart.model.ShopCartModel;



public interface ShopCartMapper {
	int insert(ShopCartModel scm);
	int delete(ShopCartModel scm);
	int update(ShopCartModel scm);
	List<ShopCartModel> select(ShopCartModel scm);
	List<ShopCartModel> selectall(ShopCartModel scm);
}
