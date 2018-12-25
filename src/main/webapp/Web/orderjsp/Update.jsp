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
<title>订单信息维护</title>
</head>
<body>
<fieldset class="layui-elem-field">
  		<legend>修改</legend>
  			<div class="layui-field-box">
    	<form class="layui-form" onsubmit="return false;">
		<div class="layui-form-item">
    		<label class="layui-form-label">订单编号</label>
    			<div class="layui-input-inline">
     				 <input type="text" name="code" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input" value = "${updco}">
    			</div>
    		<label class="layui-form-label">订单账号</label>
    			<div class="layui-input-inline">
      				<input type="text" name="account" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input" value = "${updac}">
    			</div>
 		 </div>	
		<div class="layui-form-item">
   		 	<label class="layui-form-label">订单时间</label>
    			<div class="layui-input-inline">
      				<input type="text" name="time" required lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input" value = "${updtim}">
    			</div>
    		<label class="layui-form-label">订单地址</label>
   			 <div class="layui-input-inline">
      			<input type="text" name="address" required  lay-verify="required" placeholder="必填" autocomplete="off" class="layui-input" value = "${updaddr}">
    		</div>
  		</div>
  		<div class="layui-form-item">
    		<label class="layui-form-label">订单状态</label>
    			<div class="layui-input-inline">
     				 <select name="cond">
     				 	<option value = "notpay">待付款</option>
     				 	<option value = "alreadypay">已付款</option>
     				 </select>
    			</div>
  		</div>
  		<div class="layui-form-item">
    		<div class="layui-input-inline">
      			<input type="button" class="layui-btn" lay-submit lay-filter="update" style= "position:absolute;left: 100px;" value = "确定"/>
      			<input type="reset" class="layui-btn layui-btn-primary" style= "position:absolute;left: 180px;" value = "重置"/>
    		</div>
  		</div>
  			</form>
  			</div>
	</fieldset>
<script type="text/javascript">
	$(function(){
		var cond = "${updcon}"
			$("option[value='"+cond+"']").prop("selected", "selected")
			form.render('select');
		$("input[name='code']").prop("readonly","readonly");
		$("input[name='account']").prop("readonly","readonly");
		$("input[name='time']").prop("readonly","readonly");
	})
	formSubmit("/B2cMarket/order/update.do", "submit(update)", "text", function(data){
		if(data == 1){
			layer.msg("修改成功")
		}
	})
</script>
</body>
</html>