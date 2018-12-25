package com.cjf.market.util.mapperutil;
import java.util.List;
import com.cjf.market.goods.model.GoodsModel;
public interface mapper<T> {
	int insert(T gm);
	int delete(T gm);
	int update(T gm);
	List<T> select(T gm);
	int count(T gm);
	List<T> selectall(T gm);
}
