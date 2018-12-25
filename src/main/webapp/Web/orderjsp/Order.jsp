<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
    <%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file = '/Web/Header.jsp'%>
<title>订单信息管理</title>
</head>
<body>
<form class="layui-form" method= 'post' onsubmit ='return false;'>
		<div class="layui-form-item">
    		<div class="layui-input-inline">
      			<input type="text" name="code"  placeholder="请输入想查找的订单编号"  autocomplete="off" class="layui-input">
    		</div>
    		<div class="layui-input-inline">
    			<input type="text" name="account"  placeholder="请输入想查找的用户账号对应的订单信息"  autocomplete="off" class="layui-input">
    		</div>
    		<div class="layui-input-inline">	
      			<button class="layui-btn" lay-submit lay-filter="select" id ="select">查询</button>
    		</div>
  		</div>
		<table class="layui-table">
  			<colgroup>
    			<col width="150">
    			<col width="200">
    			<col>
  			</colgroup>
  			<thead>
    			<tr>
      				<th>序号</th>
      				<th>订单编号</th>
      				<th>订单账号</th>
      				<th>订单时间</th>
      				<th>订单地址</th>
      				<th>订单状态</th>
      				<th>操作</th>
    			</tr> 
  			</thead>
  			<tbody id = 'tbody'>
  			</tbody>
		</table>
		<div id="page" class = "layui-col-md6 layui-col-md-offset2"></div>
		<input type = "hidden" name = 'currpage' value = '1'/>
		<input type = "hidden" name = 'limipage' value = '10'/>
	</form>
<script type="text/javascript">
	$(function(){
		$("#select").click()
	})
	formSubmit("/B2cMarket/order/selectall.do", 'submit(select)', "json", function(data){
	var curr = $("input[name ='currpage']").val();
	var limit = $("input[name ='limipage']").val();
	setPageInfo("page", data.count, curr, limit, function(obj, first){
		    $("input[name ='currpage']").val(obj.curr);
		    $("input[name ='limipage']").val(obj.limit);
		    if(!first){
		    	$("#select").click()
		    }
	})
	var html = "";
	$.each(data.list,function(i, dom){
		html += "<tr><td>"+(i+1+(curr-1)*limit)+"</td>"
		html +="<td>"+dom.code+"</td>"
		html +="<td>"+dom.account+"</td>"
		html +="<td>"+dom.time+"</td>"
		html +="<td>"+dom.address+"</td>"
		if(dom.cond == "alreadypay"){
			html +="<td>已付款</td>"
		}
		if(dom.cond == "notpay"){
			html +="<td>待付款</td>"
		}
		html +="<td><button id='update' class='layui-btn' lay-submit lay-filter='update' onclick = 'upda(\""+dom.code+"\")'>修改</button><button id='delete' class='layui-btn' lay-submit lay-filter='delete' onclick ='dele(\""+dom.code+"\")'>删除</button><button id='ordergoods' class='layui-btn' lay-submit lay-filter='ordergoods' onclick = 'og(\""+dom.code+"\")'>订单商品信息</button></td></tr>"
	})
		$("#tbody").html(html);
})
function upda(code){
	openLayer("/order/openupdate.do?code="+code,function(){
		$("#select").click()
	})
}
function dele(code){
	deleteopenConfirm(function(index){
		layer.close(index);
		location.href = "/B2cMarket/order/delete.do?code="+code
	})
}
function og(code){
	openLayer("/order/openordergoods.do?code="+code,function(){
		$("#select").click()
	})
}
</script>
</body>
</html>