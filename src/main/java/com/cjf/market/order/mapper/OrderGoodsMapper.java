package com.cjf.market.order.mapper;

import java.util.List;

import com.cjf.market.order.model.OrderGoodsModel;

public interface OrderGoodsMapper {
	int insert(OrderGoodsModel ogm);
	int delete(OrderGoodsModel ogm);
	int update(OrderGoodsModel ogm);
	List<OrderGoodsModel> select(OrderGoodsModel ogm);
	int count(OrderGoodsModel ogm);
	List<OrderGoodsModel> selectall(OrderGoodsModel ogm);
}
