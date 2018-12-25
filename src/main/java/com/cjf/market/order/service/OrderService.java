package com.cjf.market.order.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cjf.market.goods.model.GoodsModel;
import com.cjf.market.order.mapper.OrderMapper;
import com.cjf.market.order.model.OrderModel;



@Service
public class OrderService {
	@Autowired
	@Qualifier("orderMapper")
	private OrderMapper op;

	public List<OrderModel> selectall(OrderModel omo) {
		return op.select(omo);
	}

	public int selectcount(OrderModel omo) {
		return op.count(omo);
	}

	public List<OrderModel> select(OrderModel om) {
		return op.select(om);
	}

	public String update(OrderModel om) {
		String i = "";
		i += op.update(om);
		return i;
	}

	public void delete(OrderModel om) {
		op.delete(om);
	}

	public String add(OrderModel om) {
		Date day=new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = df.format(day);
		om.setTime(time);
		om.setCond("alreadypay");
		return ""+op.insert(om);
	}
}
