package com.cjf.market.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cjf.market.goods.mapper.GoodsMapper;
import com.cjf.market.goods.model.GoodsModel;
@Service
public class GoodsService {
	
	@Autowired
	@Qualifier("goodsMapper")
	private GoodsMapper gp;
	
	public String add(GoodsModel gm) {
		String i = "";
		List<GoodsModel> list = gp.select(gm);
		if(list == null || list.isEmpty()) {
			i += gp.insert(gm);
		}else {
			i += 0;
		}
		return i;
	}

	public List<GoodsModel> select(GoodsModel cm) {
		return gp.selectall(cm);
	}
	public List<GoodsModel> selectall(GoodsModel cm) {
		return gp.select(cm);
	}

	public int selectcount(GoodsModel gmo) {
		return gp.count(gmo);
	}

	public void delete(String code) {
		GoodsModel gm = new GoodsModel();
		gm.setCode(code);
		gp.delete(gm);
	}

	public String update(GoodsModel gm) {
		String i = "";
		i += gp.update(gm);
		return i;
	}
}
