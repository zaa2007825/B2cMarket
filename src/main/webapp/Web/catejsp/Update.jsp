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
<title>分类信息维护</title>
</head>
<body>
<fieldset class="layui-elem-field" style="margin: 20px;padding:15px;">
    <legend>分类信息修改</legend>

<form class="layui-form" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">上级编号</label>
        <div class="layui-input-inline">
            <select name="parentcode" lay-verify="" lay-search>
            </select>     
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类编号</label>
        <div class="layui-input-inline">
            <input type="text" name="code" 
            lay-verify="required" placeholder="请输入编号" 
            autocomplete="off" class="layui-input" value ="${updco}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类名称</label>
        <div class="layui-input-inline">
            <input type="text" name="name" 
            lay-verify="required" placeholder="请输入名称" 
            autocomplete="off" class="layui-input" value ="${updna}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类描述</label>
        <div class="layui-input-inline">
            <input type="text" name="descr"
            lay-verify="required" placeholder="请输入名称" 
            autocomplete="off" class="layui-input" value = "${upddes}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
            <input type="button" class="layui-btn" 
            lay-submit lay-filter="update" value="确定" />
        </div>
    </div>
</form>
</fieldset>
<script type="text/javascript">
	$(function(){
		ajax("/B2cMarket/category/renderselect.do", {}, "json", function(data){
			var html = "<option value = '无上级'>无上级</option>";
			$.each(data, function(i, dom){
				html += "<option value ='"+dom.code+"'>"+dom.name+"</option>"
			})
			
				$("select[name = 'parentcode']").html(html);
				form.render('select');
			var parentcode = "${updpar}"
			$("option[value='"+parentcode+"']").prop("selected", "selected")
			form.render('select');
	        $("input[name='code']").prop("readonly","readonly");
		})
		
	})
formSubmit("/B2cMarket/category/update.do","submit(update)", "text", function(data){
	if(data == 1){
		layer.msg('修改成功');
	}
})
</script>
</body>
</html>