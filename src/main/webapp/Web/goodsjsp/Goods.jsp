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
<title>商品信息维护</title>
</head>
<body>
<form class="layui-form" method= 'post' onsubmit ='return false;'>
		<div class="layui-form-item">
    		<div class="layui-input-inline">
      			<input type="text" name="code"  placeholder="请输入想查找的商品编号"  autocomplete="off" class="layui-input">
    		</div>
    		<div class="layui-input-inline">
    			<input type="text" name="name"  placeholder="请输入想查找的商品名称"  autocomplete="off" class="layui-input">
    		</div>
    		<div class="layui-input-inline">
      			<button class="layui-btn" id ="add">添加</button>	
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
      				<th>商品编号</th>
      				<th>商品名称</th>
      				<th>商品价格</th>
      				<th>商品描述</th>
      				<th>商品数量</th>
      				<th>商品状态</th>
      				<th>所属分类编号</th>
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
$("#add").click(function(){
	openLayer('/Web/goodsjsp/Add.jsp', function(){
		$("#select").click()
	})
});
formSubmit("/B2cMarket/goods/selectall.do", 'submit(select)', "json", function(data){
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
		html +="<td>"+dom.name+"</td>"
		html +="<td>"+dom.price+"</td>"
		html +="<td>"+dom.descr+"</td>"
		html +="<td>"+dom.ammount+"</td>"
		if(dom.cond == "on"){
			html +="<td>上架中</td>"
		}
		if(dom.cond == "off"){
			html +="<td>下架中</td>"
		}
		html +="<td>"+dom.categorycode+"</td>"
		html +="<td><button id='update' class='layui-btn' lay-submit lay-filter='update' onclick = 'upda(\""+dom.code+"\")'>修改</button><button id='delete' class='layui-btn' lay-submit lay-filter='delete' onclick ='dele(\""+dom.code+"\")'>删除</button><button id='img' class='layui-btn' lay-submit lay-filter='img' onclick = 'uplo(\""+dom.code+"\")'>上传图片</button></td></tr>"
	})
		$("#tbody").html(html);
})
function dele(code){
	deleteopenConfirm(function(index){
		layer.close(index);
		location.href = "/B2cMarket/goods/delete.do?code="+code
	})
}
function upda(code){
	openLayer("/goods/openupdate.do?code="+code,function(){
		$("#select").click()
	})
}
function uplo(code){
	openLayer('/Web/goodsjsp/Img.jsp?code='+code, function(){
		$("#select").click()
	})
}
</script>
</body>
</html>