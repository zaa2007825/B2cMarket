<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="/B2cMarket/Web/res/static/css/main.css">
<%@ include file = '/Web/Header.jsp'%>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
</head>
<body>
	<div class="site-nav-bg">
    <div class="site-nav w1200">
      <p class="sn-back-home">
        <i class="layui-icon layui-icon-home"></i>
        <a href="/B2cMarket/Web/Userjsp/UserIndex.jsp">首页</a>
      </p>
      <div class="sn-quick-menu">
        <div class="login"><a href="Login.jsp">登录</a></div>
        <div class="login"><a href="Register.jsp">注册</a></div>
      </div>
    </div>
  </div>



  <div class="header">
    <div class="headerLayout w1200">
      <div class="headerCon">
        <h1 class="mallLogo">
            <img src="/B2cMarket/Web/image/main.png">
          </a>
        </h1>
      </div>
    </div>
  </div>


  <div class="content content-nav-base  login-content">
    <div class="login-bg">
      <div class="login-cont w1200">
        <div class="form-box">
          <form class="layui-form" onsubmit="return false;">
            <legend>账号密码登录</legend>
            <div class="layui-form-item">
              <div class="layui-inline ">
                <div class="layui-input-inline">
                  <p>账号</p>
                  <input type="text" name="account" id="account" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline ">
                <div class="layui-input-inline">
                  <p>密码</p>
                  <input type="password" name="password" id="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline veri-code">
                <div class="layui-input-inline">
                  <p>验证码</p>
                  <input id="code" type="text" name="code" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input">
                  <img src ='/B2cMarket/CodeServlet?<%=Math.random()%>' onclick= 'this.src="/B2cMarket/CodeServlet?"+ Math.random();'/> 
                </div>
              </div>
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-inline">
                <button class="layui-btn" lay-submit lay-filter="log">登录</button>
                <input type = "button" id ="reg" class="layui-btn layui-btn-normal" value = "注册"/>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <div class="footer">
    <div class="ng-promise-box">
      <div class="ng-promise w1200">
        <p class="text">
          <a class="icon1" href="javascript:;">7天无理由退换货</a>
          <a class="icon2" href="javascript:;">满99元全场免邮</a>
          <a class="icon3" style="margin-right: 0" href="javascript:;">100%品质保证</a>
        </p>
      </div>
    </div>
    <div class="mod_help w1200">                                     
      <p>
        <a href="javascript:;">关于我们</a>
        <span>|</span>
        <a href="javascript:;">帮助中心</a>
        <span>|</span>
        <a href="javascript:;">售后服务</a>
        <span>|</span>
        <a href="javascript:;">产品资讯</a>
        <span>|</span>
        <a href="javascript:;">关于货源</a>
      </p>
      <p class="coty">CJF商城版权所有 &copy; 2018-2025</p>
    </div>
  </div>
<script type="text/javascript">
 	$(function(){
 		$("#reg").click(reg)
 	})
 	function reg(){
 		location.href = "/B2cMarket/Web/Register.jsp"
 	}
 	formSubmit("/B2cMarket/user/login.do",'submit(log)',"text",function(data){
		if(data == "管理员登录"){
			layer.msg("登录成功")
			location.href = "/B2cMarket/Web/jsp/AdminMain.jsp"
		}
		if(data == "普通用户登录"){
			layer.msg("登录成功")
			location.href = "/B2cMarket/Web/Userjsp/UserIndex.jsp"
		}
		if(data == "账号密码错误"){
			layer.msg("账号密码错误")
		}
		if(data == "验证码错误"){
			layer.msg("验证码错误")
		}
	})
</script>
</body>
</html>