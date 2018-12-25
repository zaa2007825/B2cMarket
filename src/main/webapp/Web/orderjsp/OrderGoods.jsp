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
<title>订单商品信息维护</title>
</head>
<body>
	<form class="layui-form" method= 'post' onsubmit ='return false;'>
		<div class="layui-form-item">
    		<div class="layui-input-inline">
    			<button class="layui-btn" id ="add">添加</button>
    		</div>
  		</div>
		<table class="layui-table">
  			<colgroup>
    			<col width="15%">
    			<col width="15%">
    			<col width="10%">
    			<col width="10%">
    			<col width="15%"> 
  			</colgroup>
  			<thead>
    			<tr>
      				<th>订单</th>
      				<th>商品</th>
      				<th>数量</th>
      				<th>价格</th>
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
		ajax("/B2cMarket/ordergoods/selectall.do", {ordercode:"${oco}"}, "json", function(data){
			var html = "";
			$.each(data,function(i, dom){
				html +="<tr><td>"+dom.ordercode+"</td>"
				html +="<td>"+dom.goodscode+"</td>"
				html +="<td>"+dom.ammount+"</td>"
				html +="<td>"+dom.price+"</td>"
				html +="<td><button id='delete' class='layui-btn' lay-submit lay-filter='delete' onclick ='dele(\""+dom.id+"\")'>删除</button></td></tr>"
			})
				$("#tbody").html(html);
		})
	})
function dele(id){
	deleteopenConfirm(function(index){
		layer.close(index);
		location.href = "/B2cMarket/ordergoods/delete.do?id="+id
	})
}
	$("#add").click(function(){
		var html = "";
		html += "<tr><td>"+'${oco}'+"<input type='hidden' name='ordercode' value='${oco}'/></td>"
		html +="<td><select name = 'goodscode'></select></td>"
		html +="<td><input type = 'text' name = 'ammount' class = 'layui-input' placeholder='数量'/></td>"
		html +="<td><input type = 'text' name = 'price' class = 'layui-input' placeholder='金额'/></td>"
		html +="<td><button id='save' class='layui-btn' lay-submit lay-filter='save' onclick = 'sa(this)'>保存</button><button id='cancel' class='layui-btn' lay-submit lay-filter='cancel' onclick = 'canc()'>取消</button></td></tr>"
		$("#tbody").append(html)
		ajax("/B2cMarket/goods/ordergoodsadd.do", {}, "json", function(data){
			var html = "";
			$.each(data, function(i, dom){
				html += "<option value ='"+dom.code+"'>"+dom.name+"</option>"
			})
			$("select[name = 'goodscode']").html(html);
			form.render('select');
		})
	})
	function canc(){
		$("#cancel").parent().parent().remove()
	}
// 	formSubmit("/B2cMarket/ordergoods/add.do", "submit(save)", "text", function(data){
// 		if(data == 1){
// 			layer.msg("添加成功")
// 		}
// 		location.href = "/B2cMarket/Web/orderjsp/OrderGoods.jsp"
// 	})
	function sa(obj){
		var tr = $(obj).parent().parent()
		var select = tr.find("select").val()
		var code = tr.find("input[name='ordercode']").val()
		var ammount = tr.find("input[name='ammount']").val()
		var price = tr.find("input[name='price']").val()
		ajax("/B2cMarket/ordergoods/add.do", {ordercode:code, goodscode:select, ammount:ammount, price:price}, "text", function(data){
			if(data == 1){
				layer.msg("添加成功")
			}
			location.href = "/B2cMarket/Web/orderjsp/OrderGoods.jsp"
		})
	}
</script>
</body>
</html>