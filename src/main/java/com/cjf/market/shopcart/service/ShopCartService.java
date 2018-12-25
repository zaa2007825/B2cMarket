package com.cjf.market.shopcart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cjf.market.shopcart.mapper.ShopCartMapper;
import com.cjf.market.shopcart.model.ShopCartModel;



@Service
public class ShopCartService {
	@Autowired
	@Qualifier("shopCartMapper")
	private ShopCartMapper scp;

	public String add(ShopCartModel scm) {
		return ""+scp.insert(scm);
	}

	public List<ShopCartModel> select(ShopCartModel scm) {
		return scp.select(scm);
	}

	public String update(ShopCartModel scm) {
		return ""+scp.update(scm);
	}

	public String delete(ShopCartModel scm) {
		return ""+scp.delete(scm);
	}

	public List<ShopCartModel> select(String a) {
		ShopCartModel scm = new ShopCartModel();
		scm.setId(Integer.parseInt(a));
		return scp.select(scm);
	}
}
