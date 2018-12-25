<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = '/Web/Header.jsp' %>
<title>添加</title>
</head>
<body>
<fieldset class="layui-elem-field">
  		<legend>添加</legend>
  			<div class="layui-field-box">
    			<form class="layui-form" onsubmit="return false;">
		<div class="layui-form-item">
    		<label class="layui-form-label">账号</label>
    			<div class="layui-input-block">
     				 <input type="text" name="account" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
 		 </div>
		
		<div class="layui-form-item">
   		 	<label class="layui-form-label">密码</label>
    			<div class="layui-input-inline">
      				<input type="password" name="password" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
    			</div>
  		</div>
		
		<div class="layui-form-item">
    		<label class="layui-form-label">姓名</label>
   			 <div class="layui-input-block">
      			<input type="text" name="username" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input">
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
formSubmit("/B2cMarket/user/add.do", 'submit(add)', "text", function(data){
	if(data == 1){
		layer.msg("添加成功")
	}
	if(data == 0){
		layer.msg("账号已存在")
	}
})
</script>
</body>
</html>