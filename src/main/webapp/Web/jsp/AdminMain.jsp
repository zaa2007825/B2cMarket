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
<title>管理员界面</title>
</head>
<body class='layui-layout-body'>
<div class='layui-layout layui-layout-admin'>
<div class='layui-header'>
	<div class='layui-logo'>CJF商城</div>
<ul class="layui-nav layui-bg-cyan layui-layout-left">
		<li class='layui-nav-item layui-nav-itemed'><a href='/B2cMarket/Web/jsp/AdminIndex.jsp'>主页</a></li>
	</ul>
<ul class='layui-nav layui-bg-black layui-layout-right'>
		<li class='layui-nav-item'><a href='javascript:;'><img src="/B2cMarket/Web/image/1104.jpg" class="layui-nav-img">用户&nbsp;[${per.username}]</a>
		<dl class="layui-nav-child">
      		<dd><a href="javascript:openUserLayer();">个人信息</a></dd>
      		<dd><a href="javascript:openPasswordLayer();">修改密码</a></dd>
      		<dd><a href="javascript:openconfirm();">注销</a></dd>
    	</dl>
		</li>
		<li class='layui-nav-item'><a href='/B2cMarket/Web/Login.jsp'>登录</a></li>
		<li class='layui-nav-item'><a href='/B2cMarket/Web/Register.jsp'>注册</a></li>
</ul>
	</div>
	<div class='layui-side layui-bg-black'>
	<div class='layui-side-scroll'>
	<ul class="layui-nav layui-bg-black layui-nav-tree">
		<li class='layui-nav-item layui-this'><a href='javascript:;' class='abcd' data-url='/Web/jsp/AdminIndex.jsp'>用户信息管理</a></li>
		<li class='layui-nav-item'><a href='javascript:;' class='abcd' data-url ='/Web/catejsp/category.jsp'>商品分类管理</a></li>
		<li class='layui-nav-item'><a href='javascript:;' class='abcd' data-url ='/Web/goodsjsp/Goods.jsp'>商品信息管理</a></li>
		<li class='layui-nav-item'><a href='javascript:;' class='abcd' data-url ='/Web/orderjsp/Order.jsp'>订单信息管理</a></li>
	</ul>
	</div>
	</div>
	<div class='layui-body'>
		<iframe name='rightframe' width='100%' height='100%' src=''></iframe>
	</div>
	</div>
<script type="text/javascript" src="/B2cMarket/Web/res/layui/layui.all.js"></script>
<script type="text/javascript">
	$(".abcd").click(function(){
		window.open("/B2cMarket" + $(this).data("url"),"rightframe")
	})
	$(".abcd:first").click()
	function openUserLayer(){
		openLayer("/user/openupdateysf.do?account=${per.account}",function(){
			location.href = "/B2cMarket/Web/jsp/AdminMain.jsp"
		})
	}
	function openPasswordLayer(){
		openLayer('/user/openupdateysf.do?account=${per.account}',function(){
			location.href = '/B2cMarket/Web/jsp/AdminMain.jsp'
		})
	}
	function openconfirm(){
		logoutopenConfirm(function(index){
			  layer.close(index);
			  location.href = "/B2cMarket/user/logout.do"
			})
	}
</script>
</body>
</html>