package com.cjf.market.goods.mapper;

import java.util.List;

import com.cjf.market.goods.model.ImageModel;

public interface ImageMapper {
	int insert(ImageModel im);
	int delete(ImageModel im);
	int update(ImageModel im);
	int update1(ImageModel im);
	List<ImageModel> select(ImageModel im);
	int count(ImageModel im);
	List<ImageModel> selectall(ImageModel im);
}
