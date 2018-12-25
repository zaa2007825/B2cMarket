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
<title>商品分类维护</title>
</head>
<body>
<form class="layui-form" method= 'post' onsubmit ='return false;'>
		<div class="layui-form-item">
    		<div class="layui-input-inline">
      			<input type="text" name="code"  placeholder="请输入想查找的分类编号"  autocomplete="off" class="layui-input">
    		</div>
    		<div class="layui-input-inline">
    			<input type="text" name="name"  placeholder="请输入想查找的分类名称"  autocomplete="off" class="layui-input">
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
      				<th>分类编号</th>
      				<th>分类名称</th>
      				<th>分类描述</th>
      				<th>上级编号</th>
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
	openLayer('/Web/catejsp/Add.jsp', function(){
		$("#select").click()
	})
});
formSubmit("/B2cMarket/category/selectall.do", 'submit(select)', "json", function(data){
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
		html +="<td>"+dom.descr+"</td>"
		html +="<td>"+dom.parentcode+"</td>"
		html +="<td><button id='update' class='layui-btn' lay-submit lay-filter='update' onclick = 'upda(\""+dom.code+"\")'>修改</button><button id='delete' class='layui-btn' lay-submit lay-filter='delete' onclick ='dele(\""+dom.code+"\")'>删除</button></td></tr>"
	})
		$("#tbody").html(html);
})
function dele(code){
	deleteopenConfirm(function(index){
		layer.close(index);
		ajax("/B2cMarket/category/delete.do", {code:code}, "text", function(data){
			if(data == 1){
				layer.msg("删除成功")
			}
			if(data == 0){
				layer.msg("无法删除其下仍有类别")
			}
		})
	})
}
function upda(code){
	openLayer("/category/openupdate.do?code="+code,function(){
		$("#select").click()
	})
}
</script>
</body>
</html>