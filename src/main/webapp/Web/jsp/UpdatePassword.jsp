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
<title>修改密码</title>
</head>
<body>
<fieldset class="layui-elem-field">
	<div class="layui-field-box" style= "padding-right:100px;padding-left:50px;">
  		<legend>修改密码</legend>
  			<form class="layui-form" onsubmit="return false;">
				<div class="layui-form-item">
    				<label class="layui-form-label">账号</label>
    			<div class="layui-input-block">
     				 <input type="text" name="account" value ="${updpasac}" readonly="on" class="layui-input">
    			</div>
 		 		</div>
 		 		<div class="layui-form-item">
    				<label class="layui-form-label">旧密码</label>
    			<div class="layui-input-block">
     				 <input type="text" name="oldpassword" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
 		 		</div>
 		 	<div class="layui-form-item">
   		 			<label class="layui-form-label">新密码</label>
    			<div class="layui-input-inline">
      				<input type="password" name="newpassword" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
    			<div class="layui-form-mid layui-word-aux">6-12位字母或者数字</div>
  			</div>
  			<div class="layui-form-item">
   		 			<label class="layui-form-label">确认新密码</label>
    			<div class="layui-input-inline">
      				<input type="password" name="newpassword1" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
  			</div>
		
		<div class="layui-form-item">
    		<div class="layui-input-block">
      			<button class="layui-btn" lay-submit lay-filter="updatepassword">确定</button>
    		</div>
  		</div>
	</form>
	</div>
	</fieldset>
<script type="text/javascript">
formSubmit("/B2cMarket/user/updatepassword.do","submit(updatepassword)","text",function(data){
	if(data == 0){
		layer.msg("两次密码输入不同!")
	}
	if(data == 2){
		layer.msg("新旧密码不能相同!")
	}
	if(data == 1){
		layer.msg("修改成功")
	}
})
</script>
</body>
</html>