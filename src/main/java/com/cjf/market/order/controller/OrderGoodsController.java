package com.cjf.market.order.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjf.market.goods.model.GoodsModel;
import com.cjf.market.order.model.OrderGoodsModel;
import com.cjf.market.order.model.OrderModel;
import com.cjf.market.order.service.OrderGoodsService;



@Controller
@RequestMapping("/ordergoods")
public class OrderGoodsController {
	@Autowired
	@Qualifier("orderGoodsService")
	private OrderGoodsService ogs;
	
	@RequestMapping(value = "selectall", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String selectall(OrderGoodsModel ogm) {
		List<OrderGoodsModel> list = ogs.selectall(ogm);
		JSONArray jso = new JSONArray(list);
		return jso.toString();
	}
	@RequestMapping("/delete")
	public String delete(OrderGoodsModel ogm) {
		ogs.delete(ogm);
		return "orderjsp/OrderGoods";
	}
	@RequestMapping(value = "add", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String add(OrderGoodsModel ogm) {
		 return ogs.add(ogm);
	}
}
