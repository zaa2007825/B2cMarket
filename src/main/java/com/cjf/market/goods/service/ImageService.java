package com.cjf.market.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.cjf.market.goods.mapper.ImageMapper;
import com.cjf.market.goods.model.ImageModel;

@Service
public class ImageService {
	@Autowired
	@Qualifier("imageMapper")
	private ImageMapper ip;
	public void insert(ImageModel im) {
		ip.insert(im);
	}
	public List<ImageModel> select(String code) {
		ImageModel im = new ImageModel();
		im.setCode(code);
		return ip.select(im);
	}
	public int delete(String url) {
		ImageModel im = new ImageModel();
		im.setUrl(url);
		return ip.delete(im);
	}
	public List<ImageModel> selecturl(String url) {
		ImageModel im = new ImageModel();
		im.setUrl(url);
		return ip.select(im);
	}
	public List<ImageModel> selectall(ImageModel im) {
		return ip.select(im);
	}
	public int update(ImageModel im) {
		return ip.update(im);
	}
	public int update1(ImageModel im) {
		return ip.update1(im);
	}
}
