<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册</title>
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
            <img src="../Web/image/main.png">
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
            <legend>账号注册</legend>
            <div class="layui-form-item">
              <div class="layui-inline ">
                <div class="layui-input-inline">
                  <p>账号</p>
                  <input type="text" name="account" id="account" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline ">
                <div class="layui-input-inline">
                  <p>密码</p>
                  <input type="password" name="password" id="password" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline">
                <div class="layui-input-inline">
                  <p>确认密码</p>
                  <input id="password1" type="password" name="password1" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
              <div class="layui-inline">
                <div class="layui-input-inline">
                  <p>用户名</p>
                  <input id="username" type="text" name="username" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div>
            </div>
            <div class="layui-form-item login-btn">
              <div class="layui-input-inline">
                <button class="layui-btn layui-btn-warm"  lay-submit lay-filter="reg" >确定</button>
              	<input type="reset" class="layui-btn layui-btn-primary" value = "重置"/>
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
      <p class="coty">母婴商城版权所有 &copy; 2012-2020</p>
    </div>
  </div>
<script type="text/javascript">
 	formSubmit("/B2cMarket/user/register.do",'submit(reg)',"text",function(data){
		if(data == 1){
			layer.msg("注册成功")
			location.href = "/B2cMarket/Web/Login.jsp"
		}
		if(data == 0){
			layer.msg("账号已存在")
		}
		if(data == 2){
			layer.msg("两次输入的密码不同")
		}
	})
</script>
</body>
</html>