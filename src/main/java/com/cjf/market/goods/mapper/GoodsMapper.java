package com.cjf.market.goods.mapper;

import java.util.List;

import com.cjf.market.goods.model.GoodsModel;

public interface GoodsMapper {
	int insert(GoodsModel gm);
	int delete(GoodsModel gm);
	int update(GoodsModel gm);
	List<GoodsModel> select(GoodsModel gm);
	int count(GoodsModel gm);
	List<GoodsModel> selectall(GoodsModel gm);
}
