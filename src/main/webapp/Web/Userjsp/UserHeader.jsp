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
<title>Insert title here</title>
</head>
<body>
<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="/B2cMarket/Web/Userjsp/UserIndex.jsp">首页</a>
      </p>
      <div class="sn-quick-menu" id = "head">
      </div>
    </div>
  </div>


  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
          <a href="#" title="CJF商城">
            <img src="/B2cMarket/Web/image/main.png" style = "width:150px;">
          </a>
        </h1>
        <div class="mallSearch">
          <form class="layui-form" onsubmit="return false;">
            <input type="text" id="goodsname" name="goodsname" autocomplete="off" class="layui-input" placeholder="请输入需要的商品">
            <button class="layui-btn" id ="select">
                <i class="layui-icon layui-icon-search"></i>
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
	var name = "${per.username}"
	var html = "";
	if(name == null || name == ""){
		html += "<div class='login'><a href='javascript:;'>用户&nbsp;["+name+"]</a></div>"
		html += "<div class='login'><a href='/B2cMarket/Web/Login.jsp'>登录</a></div>"
		html += "<div class='login'><a href='/B2cMarket/Web/Register.jsp'>注册</a></div>"
		html += "<div class='login'><a href='/B2cMarket/Web/Afterloginjsp/OrderInformation.jsp'>我的订单</a></div>"
		html += "<div class='sp-cart'><a href='/B2cMarket/Web/Afterloginjsp/Shopcart.jsp'>购物车</a></div>"
	}else{
		html += "<div class='login'><a href='javascript:;'>用户&nbsp;["+name+"]</a></div>"
		html += "<div class='login'><a href='/B2cMarket/Web/Login.jsp'>切换账号</a></div>"
		html += "<div class='login'><a href='/B2cMarket/Web/Register.jsp'>注册</a></div>"
		html += "<div class='login'><a href='/B2cMarket/user/logout.do'>注销</a></div>"
		html += "<div class='login'><a href='/B2cMarket/Web/Afterloginjsp/OrderInformation.jsp'>我的订单</a></div>"
		html += "<div class='sp-cart'><a href='/B2cMarket/Web/Afterloginjsp/Shopcart.jsp'>购物车</a></div>"
	}
	$("#head").html(html)
	$("#select").click(function(){
		var name = $("#goodsname").val();
		location.href = "/B2cMarket/Web/Userjsp/UserGoods.jsp?name="+name
	})
</script>
</body>
</html>