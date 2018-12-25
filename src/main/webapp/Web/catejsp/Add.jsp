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
<title>分类信息添加</title>
</head>
<body>
<fieldset class="layui-elem-field">
  		<legend>添加</legend>
  			<div class="layui-field-box">
    	<form class="layui-form" onsubmit="return false;">
    	<div class="layui-form-item">
    		<label class="layui-form-label">上级</label>
    			<div class="layui-input-block">
     				 <select name="parentcode"></select>
    			</div>
 		 </div>
		<div class="layui-form-item">
    		<label class="layui-form-label">分类编号</label>
    			<div class="layui-input-block">
     				 <input type="text" name="code" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
 		 </div>
		
		<div class="layui-form-item">
   		 	<label class="layui-form-label">分类名称</label>
    			<div class="layui-input-inline">
      				<input type="text" name="name" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
  		</div>
		
		<div class="layui-form-item">
    		<label class="layui-form-label">分类描述</label>
   			 <div class="layui-input-block">
      			<input type="text" name="descr" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    		</div>
  		</div>
  		<div class="layui-form-item">
    		<div class="layui-input-block">
      			<input type="button" class="layui-btn" lay-submit lay-filter="add" value = "确定"/>
      			<input type="reset" class="layui-btn layui-btn-primary" value = "重置"/>
    		</div>
  		</div>
  			</form>
  			</div>
	</fieldset>
<script type="text/javascript">
$(function(){
	ajax("/B2cMarket/category/renderselect.do", {}, "json", function(data){
		var html = "<option value = '无上级'>无上级</option>";
		$.each(data,function(i,dom){
			html += "<option value= '"+dom.code+"'>"+dom.name+"</option>"
		})
		$("select[name='parentcode']").html(html);
		form.render('select');
	})
})
formSubmit("/B2cMarket/category/add.do", 'submit(add)', "text", function(data){
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