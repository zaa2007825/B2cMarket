package com.cjf.market.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cjf.market.order.mapper.OrderGoodsMapper;
import com.cjf.market.order.model.OrderGoodsModel;

@Service
public class OrderGoodsService {
	@Autowired
	@Qualifier("orderGoodsMapper")
	private OrderGoodsMapper ogp;

	public List<OrderGoodsModel> selectall(OrderGoodsModel ogm) {
		return ogp.select(ogm);
	}

	public void delete(OrderGoodsModel ogm) {
		ogp.delete(ogm);
	}

	public String add(OrderGoodsModel ogm) {
		String i = "";
		OrderGoodsModel ogm1 = new OrderGoodsModel();
		OrderGoodsModel ogm2 = new OrderGoodsModel();
		ogm1.setGoodscode(ogm.getGoodscode());
		List<OrderGoodsModel> list = ogp.select(ogm1);
		ogm2.setOrdercode(ogm.getOrdercode());
		if(list == null || list.isEmpty()) {
			i += ogp.insert(ogm);
		}else {
			ogm2.setGoodscode(ogm.getGoodscode());
			OrderGoodsModel ogm3 = list.get(0);
			int og2 = Integer.parseInt(ogm3.getAmmount());
			int og1 = Integer.parseInt(ogm.getAmmount());
			int og = og1 + og2;
			ogm2.setAmmount(og+"");
			int pr1 = Integer.parseInt(ogm3.getPrice());
			int pr2 = Integer.parseInt(ogm.getPrice());
			int pr = pr1 + pr2;
			ogm2.setPrice(pr+"");
			i += ogp.update(ogm2);
		}
		return i;
	}

	public String addorder(OrderGoodsModel ogm) {
		return ""+ogp.insert(ogm);
	}
	
}
