<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/B2cMarket/Web/res/static/css/main.css">
<%@ include file = '/Web/Header.jsp'%>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>商品列表页</title>
</head>
<body>
  <%@ include file = '/Web/Userjsp/UserHeader.jsp'%>
  <div class="content content-nav-base commodity-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href='/B2cMarket/goods/gotousergoods.do?code=' class="active">所有商品</a>
          </div>
        </div>
      </div>
    </div>
    <div class="commod-cont-wrap">
      <div class="commod-cont w1200 layui-clear">
        <div class="right-cont-wrap">
          <div class="right-cont">
            <div class="prod-number">
            </div>
            <div class="cont-list layui-clear" id="list-cont" style= "width: 1640px;">
              
            </div>
           
            <div id="demo0" style="text-align: center;"></div>
          </div>
        </div>
      </div>
       <div id="page" class = "layui-col-md6 layui-col-md-offset4"></div>
			<input type = "hidden" name = 'currpage' value = '1'/>
			<input type = "hidden" name = 'limipage' value = '8'/>
    </div>
  </div>
  <%@ include file = '/Web/Userjsp/UserFoot.jsp'%>
<script type="text/javascript">
	var code = '${code123}'
	var name = '<%= request.getParameter("name")==null?"":request.getParameter("name")%>'
	function aa(){
		curr = $("input[name ='currpage']").val();
		limit = $("input[name ='limipage']").val();
	ajax("/B2cMarket/goods/usergoods.do", {name:name, categorycode:code, pageIndex:curr, pageLimit:limit}, "json", function(data){
		init(data)
	})
	}
	aa()
	function init(data){
		setPageInfo8("page", data.count, curr, limit, function(obj, first){
			    $("input[name ='currpage']").val(obj.curr);
			    $("input[name ='limipage']").val(obj.limit);
			    if(!first){
					aa()
			    }
		})
		$("#list-cont").html('')
		$.each(data.list, function(i, dom){
			var html = $("#list-cont").html();
			if(dom.cond == "on"){
				html += "<div class='item'>"
					html += "<div class='img' id = 'img"+dom.code+"'></div>"
					html += "<div class='text'><a href='/B2cMarket/goods/gotousergoodsdetails.do?code="+dom.code+"' class='title' id = '"+dom.code+"'>"+dom.name+"</a>"
					html += "<p class='price'><i class = 'layui-icon layui-icon-rmb'></i><span class='pri'>"+dom.price+"</span></p></div></div>"
					$("#list-cont").html(html)
	ajax("/B2cMarket/image/select.do", {code:dom.code}, "json", function(data){
		$.each(data, function(i, dom){
			if(dom.type == "m"){
				var html = $("#img"+dom.code).html();
				html += "<a href='/B2cMarket/goods/gotousergoodsdetails.do?code="+dom.code+"'><img src='/image/"+dom.url+"' style = 'width:279px;height:297px'></a>"
				$("#img"+dom.code).html(html)
			}
		})
	})

			}
		})
	}
</script>
</body>
</html>