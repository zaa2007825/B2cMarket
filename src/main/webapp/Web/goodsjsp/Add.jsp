<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
      <%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<%@ include file = '/Web/Header.jsp'%>
<meta charset="UTF-8">
<title>商品信息添加</title>
</head>
<body>
<fieldset class="layui-elem-field">
  		<legend>添加</legend>
  			<div class="layui-field-box">
    	<form class="layui-form" onsubmit="return false;">
    	<div class="layui-form-item">
    		<label class="layui-form-label">所属一级分类</label>
    			<div class="layui-input-inline">
     				 <select name="categorycode1" lay-filter = "categorycode1"></select>
    			</div>
    		<label class="layui-form-label">所属二级分类</label>
    			<div class="layui-input-inline">
     				 <select name="categorycode"></select>
    			</div>
 		 </div>
		<div class="layui-form-item">
    		<label class="layui-form-label">商品编号</label>
    			<div class="layui-input-inline">
     				 <input type="text" name="code" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
    		<label class="layui-form-label">商品名称</label>
    			<div class="layui-input-inline">
      				<input type="text" name="name" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
 		 </div>	
		<div class="layui-form-item">
   		 	<label class="layui-form-label">商品价格</label>
    			<div class="layui-input-inline">
      				<input type="text" name="price" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
    		<label class="layui-form-label">商品描述</label>
   			 <div class="layui-input-inline">
      			<input type="text" name="descr" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    		</div>
  		</div>
  		<div class="layui-form-item">
   		 	<label class="layui-form-label">商品数量</label>
    			<div class="layui-input-inline">
      				<input type="text" name="ammount" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
    		<label class="layui-form-label">商品状态</label>
    			<div class="layui-input-inline">
     				 <select name="cond">
     				 	<option value = "on">上架</option>
     				 	<option value = "off">下架</option>
     				 </select>
    			</div>
  		</div>
  		<div class="layui-form-item">
    		<div class="layui-input-inline">
      			<input type="button" class="layui-btn" lay-submit lay-filter="add" style= "position:absolute;left: 100px;" value = "确定"/>
      			<input type="reset" class="layui-btn layui-btn-primary" style= "position:absolute;left: 180px;" value = "重置"/>
    		</div>
  		</div>
  			</form>
  			</div>
	</fieldset>
<script type="text/javascript">
$(function(){
	ajax("/B2cMarket/goods/renderselect1.do", {}, "json", function(data){
		var html = "<option value = ''>一级分类</option>";
		$.each(data,function(i,dom){
			html += "<option value= '"+dom.code+"'>"+dom.name+"</option>"
		})
		$("select[name='categorycode1']").html(html);
		form.render('select');
	})
	
})
form.on("select(categorycode1)",function(data){
	ajax("/B2cMarket/goods/renderselect2.do", {code:data.value}, "json", function(data){
		var html = "<option value = ''>二级分类</option>";
		$.each(data,function(i,dom){
			html += "<option value= '"+dom.code+"'>"+dom.name+"</option>"
		})
		$("select[name='categorycode']").html(html);
		form.render('select');
	})
})
formSubmit("/B2cMarket/goods/add.do", 'submit(add)', "text", function(data){
	if(data == 1){
		layer.msg("添加成功")
	}
	if(data == 0){
		layer.msg("商品编号已存在")
	}
})
</script>
</body>
</html>