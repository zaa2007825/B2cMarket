package com.cjf.market.category.controller;

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
import com.cjf.market.user.model.UserModel;

@Controller
@RequestMapping("/category")
public class CategoryController {
	@Autowired
	@Qualifier("categoryService")
	private CategoryService cs;
	
	@RequestMapping(value = "add", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String add(CategoryModel cm) {
		return cs.add(cm);
	}
	@RequestMapping(value = "renderselect", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String renderselect() {
		CategoryModel cm = new CategoryModel();
		List<CategoryModel> list = cs.selectall(cm);
		return new JSONArray(list).toString();
	}
	@RequestMapping(value = "selectall", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String selectall(CategoryModel cm) {
		CategoryModel cmo = new CategoryModel();
		cmo.setCode(cm.getCode());
		cmo.setName("%"+cm.getName()+"%");
		cmo.setPageOn(true);
		cmo.setPageIndex(cm.getPageIndex());
		cmo.setPageLimit(cm.getPageLimit());
		List<CategoryModel> list = cs.selectall(cmo);
		int count = cs.selectcount(cmo);
		JSONObject jso = new JSONObject();
		jso.put("list", list);
		jso.put("count", count);
		return jso.toString();
	}
	@RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String delete(String code) {
		return cs.delete(code);
	}
	@RequestMapping("/openupdate")
	public String openupdate(CategoryModel cm, Model model) {
		List<CategoryModel> list = cs.selectall(cm);
		CategoryModel cm1 = list.get(0);
		model.addAttribute("updco", cm1.getCode());
		model.addAttribute("updna", cm1.getName());
		model.addAttribute("upddes", cm1.getDescr());
		model.addAttribute("updpar", cm1.getParentcode());
		return "catejsp/Update";
	}
	@RequestMapping(value = "update", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String update(CategoryModel cm) {
		return cs.update(cm);
	}
	@RequestMapping(value = "select1", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String select1(CategoryModel cm) {
		CategoryModel cm1 = new CategoryModel();
		cm1.setParentcode("无上级");
		 List<CategoryModel> list = cs.selectall(cm1);
		 JSONObject jso = new JSONObject();
		 jso.put("list1", list);
		 return jso.toString();
	}
	@RequestMapping(value = "select2", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String select2(CategoryModel cm) {
		CategoryModel cm1 = new CategoryModel();
		cm1.setParentcode(cm.getCode());
		 List<CategoryModel> list = cs.selectall(cm1);
		 JSONObject jso = new JSONObject();
		 jso.put("list2", list);
		 return jso.toString();
	}
}
