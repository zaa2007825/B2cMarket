package com.cjf.market.order.controller;

import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjf.market.category.model.CategoryModel;
import com.cjf.market.goods.model.GoodsModel;
import com.cjf.market.order.model.OrderGoodsModel;
import com.cjf.market.order.model.OrderModel;
import com.cjf.market.order.service.OrderGoodsService;
import com.cjf.market.order.service.OrderService;
import com.cjf.market.shopcart.model.ShopCartModel;
import com.cjf.market.shopcart.service.ShopCartService;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	@Qualifier("orderService")
	private OrderService os;
	@Autowired
	@Qualifier("orderGoodsService")
	private OrderGoodsService ogs;
	@Autowired
	@Qualifier("shopCartService")
	private ShopCartService scs;
	
	@RequestMapping(value = "selectall", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String selectall(OrderModel om) {
		OrderModel omo = new OrderModel();
		omo.setCode("%"+om.getCode()+"%");
		omo.setAccount(om.getAccount());
		omo.setPageOn(true);
		omo.setPageIndex(om.getPageIndex());
		omo.setPageLimit(om.getPageLimit());
		List<OrderModel> list = os.selectall(omo);
		int count = os.selectcount(omo);
		JSONObject jso = new JSONObject();
		jso.put("list", list);
		jso.put("count", count);
		return jso.toString();
	}
	@RequestMapping("/openupdate")
	public String openupdate(OrderModel om, Model model) {
		List<OrderModel> list = os.select(om);
		OrderModel om1 = list.get(0);
		model.addAttribute("updco", om1.getCode());
		model.addAttribute("updac", om1.getAccount());
		model.addAttribute("updtim", om1.getTime());
		model.addAttribute("updaddr", om1.getAddress());
		model.addAttribute("updcon", om1.getCond());
		return "orderjsp/Update";
	}
	@RequestMapping(value = "update", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String update(OrderModel om) {
		return os.update(om);
	}
	@RequestMapping("/delete")
	public String delete(String code) {
		OrderModel om = new OrderModel();
		om.setCode(code);
		os.delete(om);
		return "orderjsp/Order";
	}
	@RequestMapping("/openordergoods")
	public String openordergoods(OrderModel om, Model model) {
		model.addAttribute("oco", om.getCode());
		return "orderjsp/OrderGoods";
	}
	@RequestMapping("/openorder")
	public String openorder(String ids , Model model) {
		ids.substring(0, ids.length()-1);
		String [] idss = ids.split(",");
		model.addAttribute("a", JSONArray.fromObject(idss));
		return "Afterloginjsp/Order";
	}
	@RequestMapping(value = "add", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String add(OrderModel om, String[] id) {
		String i = "0";
		OrderGoodsModel ogm = new OrderGoodsModel();
		ShopCartModel scm = new ShopCartModel();
		String ordercode = UUID.randomUUID().toString();
		om.setCode(ordercode);
		ogm.setOrdercode(ordercode);
		for(String a : id) {
			scm.setId(Integer.parseInt(a));
			List<ShopCartModel> list = scs.select(scm);
			ShopCartModel scm1 = list.get(0);
			ogm.setAmmount(scm1.getAmmount());
			ogm.setGoodscode(scm1.getCode());;
			ogm.setPrice(scm1.getPrice());
			String b = ""+ogs.addorder(ogm);
			scs.delete(scm);
		}
		String a = ""+os.add(om);
		if(a.equals("1")) {
			i = "1";
		}
		
		return i;
	}
	@RequestMapping(value = "orderinformation", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String orderinformation(OrderModel om) {
		om.setPageOn(true);
		int count = os.selectcount(om);
		List<OrderModel> list = os.select(om);
		JSONObject job = new JSONObject();
		job.put("list", list);
		job.put("count", count);
		return job.toString();
	}
	@RequestMapping("/openordergoodsinf")
	public String openordergoodsinf(OrderModel om, Model model) {
		model.addAttribute("oco", om.getCode());
		return "Afterloginjsp/Ordergoodsinf";
	}
}
