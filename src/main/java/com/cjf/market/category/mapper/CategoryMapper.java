package com.cjf.market.category.mapper;

import java.util.List;

import com.cjf.market.category.model.CategoryModel;

public interface CategoryMapper {
	int insert(CategoryModel cm);
	int delete(CategoryModel cm);
	int update(CategoryModel cm);
	List<CategoryModel> select(CategoryModel cm);
	int count(CategoryModel cm);
	List<CategoryModel> selectall(CategoryModel cm);
}
