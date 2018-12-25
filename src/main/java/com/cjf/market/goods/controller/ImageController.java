package com.cjf.market.goods.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.cjf.market.goods.model.ImageModel;
import com.cjf.market.goods.service.ImageService;

@Controller
@RequestMapping("/image")
public class ImageController {
	@Autowired
	@Qualifier("imageService")
	private ImageService is;
	private String PATH = "D:/CjfOffice/workspace/image/";
	@RequestMapping("/upload")
    @ResponseBody
    public String upload(HttpServletRequest request, String code) throws IllegalStateException, IOException {
        // 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        // 检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            // 将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 获取multiRequest 中所有的文件名
            Iterator<String> iter = multiRequest.getFileNames();
            // 一次遍历所有文件
            while (iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    String filename = file.getOriginalFilename();
                    String saveName = UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
                    String path = PATH + saveName;
                    file.transferTo(new File(path));// 上传
                    ImageModel im = new ImageModel();
                    im.setCode(code);
                    im.setUrl(saveName);
                    im.setType("nm");
                    is.insert(im);
                }
            }
        }
        Map<String, String> result = new HashMap<>();
        result.put("code", "0");
        return new JSONObject(result).toString();
    }
	@RequestMapping(value = "select", produces = "application/json;charset=utf-8")
    @ResponseBody
    public String select(String code){
		List<ImageModel> list1 = is.select(code);
		return new JSONArray(list1).toString();
	}
	@RequestMapping(value = "delete", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String delete(String url) {
		String i = "";
		i += is.delete(url);
		return i;
	}
	@RequestMapping(value = "updatetomain", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String updatetomain(ImageModel im) {
		String i = "";
		im.setType("nm");
		is.update1(im);
		ImageModel im1 = new ImageModel();
		im1.setUrl(im.getUrl());
		im1.setType("m");
		i += is.update(im1);
		return i;
	}
}
