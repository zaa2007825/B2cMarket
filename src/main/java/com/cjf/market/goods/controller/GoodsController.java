package com.cjf.market.goods.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjf.market.category.model.CategoryModel;
import com.cjf.market.category.service.CategoryService;
import com.cjf.market.goods.model.GoodsModel;
import com.cjf.market.goods.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	@Autowired
	@Qualifier("goodsService")
	private GoodsService gs;
	@Autowired
	@Qualifier("categoryService")
	private CategoryService cs;
	
	@RequestMapping(value = "add", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String add(GoodsModel gm) {
		return gs.add(gm);
	}
	@RequestMapping(value = "renderselect1", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String renderselect1() {
		CategoryModel cm = new CategoryModel();
		cm.setParentcode("无上级");
		List<CategoryModel> list = cs.selectall(cm);
		return new JSONArray(list).toString();
	}
	@RequestMapping(value = "renderselect2", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String renderselect2(CategoryModel cm) {
		CategoryModel cm1 = new CategoryModel();
		cm1.setParentcode(cm.getCode());
		List<CategoryModel> list = cs.selectall(cm1);
		return new JSONArray(list).toString();
	}
	@RequestMapping(value = "selectall", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String selectall(GoodsModel gm) {
		GoodsModel gmo = new GoodsModel();
		gmo.setCode(gm.getCode());
		gmo.setName("%"+gm.getName()+"%");
		gmo.setPageOn(true);
		gmo.setPageIndex(gm.getPageIndex());
		gmo.setPageLimit(gm.getPageLimit());
		List<GoodsModel> list = gs.selectall(gmo);
		int count = gs.selectcount(gmo);
		JSONObject jso = new JSONObject();
		jso.put("list", list);
		jso.put("count", count);
		return jso.toString();
	}
	@RequestMapping("/delete")
	public String delete(String code) {
		gs.delete(code);
		return "goodsjsp/Goods";
	}
	@RequestMapping("/openupdate")
	public String openupdate(GoodsModel gm, Model model) {
		List<GoodsModel> list = gs.selectall(gm);
		GoodsModel gm1 = list.get(0);
		model.addAttribute("updco", gm1.getCode());
		model.addAttribute("updna", gm1.getName());
		model.addAttribute("updpri", gm1.getPrice());
		model.addAttribute("upddes", gm1.getDescr());
		model.addAttribute("updamm", gm1.getAmmount());
		model.addAttribute("updcon", gm1.getCond());
		model.addAttribute("updcat2", gm1.getCategorycode());
		CategoryModel cm = new CategoryModel();
		cm.setCode(list.get(0).getCategorycode());
		List<CategoryModel> list1 = cs.selectall(cm);
		model.addAttribute("updcat1", list1.get(0).getParentcode());
		return "goodsjsp/Update";
	}
	@RequestMapping(value = "update", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String update(GoodsModel gm) {
		return gs.update(gm);
	}
	@RequestMapping(value = "ordergoodsadd", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String ordergoodsadd(GoodsModel gm) {
		List<GoodsModel> list = gs.selectall(gm);
		return new JSONArray(list).toString();
	}
	@RequestMapping("/gotousergoods")
	public String gotousergoods(String code, Model model) {
		model.addAttribute("code123", code);
		return "Userjsp/UserGoods";
	}
	@RequestMapping(value = "usergoods", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String usergoods(GoodsModel gm) {
		GoodsModel gmo = new GoodsModel();
		gmo.setName("%"+gm.getName()+"%");
		gmo.setCategorycode(gm.getCategorycode());
		gmo.setPageOn(true);
		gmo.setPageIndex(gm.getPageIndex());
		gmo.setPageLimit(gm.getPageLimit());
		List<GoodsModel> list = gs.selectall(gmo);
//		int count = gs.selectcount(gmo);
		int count = 0;
		for(GoodsModel gmc : list) {
			if(gmc.getCond().equals("on")) {
				count += 1;
			}
		}
		List<GoodsModel> list1 = gs.select(gmo);
		JSONObject jso = new JSONObject();
		jso.put("list", list1);
		jso.put("count", count);
		return jso.toString();
	}
	@RequestMapping("/gotousergoodsdetails")
	public String gotousergoodsdetails(String code, Model model) {
		model.addAttribute("code1", code);
		return "Userjsp/UserGoodsDetails";
	}
	@RequestMapping(value = "usergoodsdetails", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String usergoodsdetails(GoodsModel cm) {
		List<GoodsModel> list = gs.selectall(cm);
		return new JSONArray(list).toString();
	}
}
