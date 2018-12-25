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
<title>用户信息维护</title>
</head>
<body>
<fieldset class="layui-elem-field">
	<div class="layui-field-box" style= "padding-right:100px;padding-left:50px;">
  		<legend>个人信息</legend>
  			<form class="layui-form" onsubmit="return false;">
				<div class="layui-form-item">
    				<label class="layui-form-label">账号</label>
    			<div class="layui-input-block">
     				 <input type="text" name="account" value ="${updac}" readonly="on" class="layui-input">
    			</div>
 		 		</div>
 		 		<div class="layui-form-item">
    				<label class="layui-form-label">姓名</label>
    			<div class="layui-input-block">
     				 <input type="text" name="username" value ="${updna}" autocomplete="off" class="layui-input">
    			</div>
 		 		</div>
		
		<div class="layui-form-item">
    		<div class="layui-input-block">
      			<button class="layui-btn" lay-submit lay-filter="updateuser">确定</button>
    		</div>
  		</div>
	</form>
	</div>
	</fieldset>
<script type="text/javascript">
formSubmit("/B2cMarket/user/update.do", 'submit(updateuser)', "text", function(data){
	if(data == 0){
		layer.msg('修改成功')
	}
})
</script>
</body>
</html>