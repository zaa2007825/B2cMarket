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
<title>管理员主页</title>
</head>
<body>
<form class="layui-form" method= 'post' onsubmit ='return false;'>
		<div class="layui-form-item">
    		<label class="layui-form-label">账号</label>
    		<div class="layui-input-block" style = 'padding-right:600px;'>
      			<input type="text" name="account"  placeholder="请输入想查找的账号"  autocomplete="off" class="layui-input">
    			<button class="layui-btn" id ="add">添加</button>
				<button class="layui-btn" lay-submit lay-filter="select" id ="select">查询</button>
    			<input type = "hidden" name = 'action' value = 'select'/>
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
      				<th>账号</th>
      				<th>姓名</th>
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
	openLayer('/Web/jsp/Add.jsp', function(){
		$("#select").click()
	})
});
formSubmit("/B2cMarket/user/select.do", 'submit(select)', "json", function(data){
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
		html +="<td>"+dom.account+"</td>"
		html +="<td>"+dom.username+"</td>"
		html +="<td><button id='update' class='layui-btn' lay-submit lay-filter='update' onclick = 'upda(\""+dom.account+"\")'>修改</button><button id='delete' class='layui-btn' lay-submit lay-filter='delete' onclick ='dele(\""+dom.account+"\")'>删除</button></td></tr>"
	})
		$("#tbody").html(html);
})
function dele(account){
		deleteopenConfirm(function(index){
			layer.close(index);
			location.href = "/B2cMarket/user/delete.do?account="+account
		})
	}
function upda(account){
	openLayer("/user/openupdate.do?account="+account,function(){
		$("#select").click()
	})
}
</script>
</body>
</html>