package com.cjf.market.order.mapper;

import java.util.List;

import com.cjf.market.order.model.OrderModel;


public interface OrderMapper {
	int insert(OrderModel om);
	int delete(OrderModel om);
	int update(OrderModel om);
	List<OrderModel> select(OrderModel om);
	int count(OrderModel om);
	List<OrderModel> selectall(OrderModel om);
}
