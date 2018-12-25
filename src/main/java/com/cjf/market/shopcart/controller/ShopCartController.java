package com.cjf.market.shopcart.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjf.market.category.model.CategoryModel;
import com.cjf.market.shopcart.model.ShopCartModel;
import com.cjf.market.shopcart.service.ShopCartService;

@Controller
@RequestMapping("/shopcart")
public class ShopCartController {
	@Autowired
	@Qualifier("shopCartService")
	private ShopCartService scs;
	
	@RequestMapping("/add")
	public String add(ShopCartModel scm) {
		String i = "";
		ShopCartModel scm1 = new ShopCartModel();
		scm1.setAccount(scm.getAccount());
		scm1.setCode(scm.getCode());
		List<ShopCartModel> list = scs.select(scm1);
		if(list.size() > 0) {
			int m = Integer.parseInt(list.get(0).getAmmount()) + Integer.parseInt(scm.getAmmount());
			scm1.setAmmount(""+m);
			i = scs.update(scm1);
		}else {
			i = scs.add(scm);
		}
		return i;
	}
	@RequestMapping(value = "select", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String select(String[] id) {
		List<ShopCartModel> list = new ArrayList<ShopCartModel>();
		for(String a : id) {
			List<ShopCartModel> list1 = scs.select(a);
			ShopCartModel scm1 = list1.get(0);
			list.add(scm1);
		}
		return new JSONArray(list).toString();
	}
	@RequestMapping(value = "update", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String update(ShopCartModel scm) {
		return scs.update(scm);
	}
	@RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String delete(ShopCartModel scm) {
		return scs.delete(scm);
	}
	
	@RequestMapping(value = "selectall", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<ShopCartModel> selectall(ShopCartModel scm) {
		return scs.select(scm);
	}
}
