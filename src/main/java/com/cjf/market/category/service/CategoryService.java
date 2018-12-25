package com.cjf.market.category.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cjf.market.category.mapper.CategoryMapper;
import com.cjf.market.category.model.CategoryModel;
import com.cjf.market.user.model.UserModel;

@Service
public class CategoryService {
	@Autowired
	@Qualifier("categoryMapper")
	private CategoryMapper cp;

	public String add(CategoryModel cm) {
		String i = "";
		CategoryModel cmo = new CategoryModel();
		cmo.setCode(cm.getCode());
		List<CategoryModel> list = cp.select(cmo);
		if(list == null || list.isEmpty()) {
			i += cp.insert(cm);
		}else {
			i += 0;
		}
		return i;
	}

	public List<CategoryModel> selectall(CategoryModel cm) {
		return cp.select(cm);
	}

	public int selectcount(CategoryModel cm) {
		return cp.count(cm);
	}

	public String delete(String code) {
		String i = "";
		CategoryModel cm = new CategoryModel();
		CategoryModel cm1 = new CategoryModel();
		cm.setParentcode(code);
		cm1.setCode(code);
		List<CategoryModel> list = cp.select(cm);
		System.out.println(list);
		if(list == null || list.isEmpty()) {
			i += cp.delete(cm1);
		}else {
			i += 0;
		}
		return i;
	}

	public String update(CategoryModel cm) {
		String i = "";
		i += cp.update(cm);
		return i;
	}
	
}
