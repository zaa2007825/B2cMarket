<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/B2cMarket/Web/res/static/css/main.css">
<%@ include file = '/Web/Header.jsp'%>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<title>商城主页</title>
</head>
<body id="list-cont">
<%@ include file = '/Web/Userjsp/UserHeader.jsp'%>
  <div class="content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href='/B2cMarket/goods/gotousergoods.do?code=' class="active">所有商品</a>
          </div>
        </div>
      </div>
    </div>
    <div class="category-con">
      <div class="category-inner-con w1200">
        <div class="category-type">
          <h3>全部分类</h3>
        </div>
        <div class="category-tab-content">
          <div class="nav-con">
            <ul class="normal-nav layui-clear" id = "all">
            </ul>
          </div>
        </div>
      </div>
      <div class="category-banner">
        <div class="w1200">
          <img src="../image/banner1.png" width="1400px" height="500px">
        </div>
      </div>
    </div>
    <div class="floors">
      <div class="sk">
        <div class="sk_inner w1200">
          <div class="sk_hd">
            <a href="javascript:;">
              <img src="../image/s_img1.jpg">
            </a>
          </div>
          <div class="sk_bd">
            <div class="layui-carousel" id="test1">
              <div carousel-item>
                <div class="item-box">
                  <div class="item">
                    <a href="/B2cMarket/goods/gotousergoodsdetails.do?code=pgsjxs"><img src="../image/s_img2.png"></a>
                    <div class="title">iphoneXS</div>
                    <div class="price">
                      <span>￥8699</span>
                      <del>￥9900</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../image/s_img3.png"></a>
                    <div class="title">iPad Pro</div>
                    <div class="price">
                      <span>￥6499</span>
                      <del>￥8099</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../image/s_img4.png"></a>
                    <div class="title">iWatch</div>
                    <div class="price">
                      <span>￥2999</span>
                      <del>￥3199</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../image/s_img5.png"></a>
                    <div class="title">Mac Book Air</div>
                    <div class="price">
                      <span>￥9499</span>
                      <del>￥11099</del>
                    </div>
                  </div>
                </div>
                <div class="item-box">
                  <div class="item">
                    <a href="javascript:;"><img src="../image/s_img6.png"></a>
                    <div class="title">Mac Mini</div>
                    <div class="price">
                      <span>￥6499</span>
                      <del>￥8899</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../image/s_img7.png"></a>
                    <div class="title">小米笔记本</div>
                    <div class="price">
                      <span>￥3999</span>
                      <del>￥4199</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../image/s_img8.png"></a>
                    <div class="title">小米MIX3</div>
                    <div class="price">
                      <span>￥2999</span>
                      <del>￥3299</del>
                    </div>
                  </div>
                  <div class="item">
                    <a href="javascript:;"><img src="../image/s_img9.png"></a>
                    <div class="title">小米电视</div>
                    <div class="price">
                      <span>￥1199</span>
                      <del>￥1399</del>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>    
      </div>
    </div>
<%@ include file = '/Web/Userjsp/UserFoot.jsp'%>
<script type="text/javascript">
     var carousel = layui.carousel
     mm = layui.mm;
     var option = {
        elem: '#test1'
        ,width: '100%' //设置容器宽度
        ,arrow: 'always'
        ,height:'298' 
        ,indicator:'none'
      }
      carousel.render(option);
     
$(function(){
	ajax("/B2cMarket/category/select1.do", {}, "json", function(data){
		var html = $("#all").html();
		$.each(data.list1, function(i, dom){
			html += "<li class='nav-item'>"
			html += "<div class='title' id = '"+dom.code+"'>"+dom.name+"</div>"
			html += "<div class='test' id ='aaa"+dom.code+"'></div>"
			html += "<i class='layui-icon layui-icon-right'></i></li>"
			ajax("/B2cMarket/category/select2.do", {code:dom.code}, "json", function(data){
				$.each(data.list2, function(i, dom1){
					var html1 = $("#aaa"+dom1.parentcode).html();
					html1 += "<a href = '/B2cMarket/goods/gotousergoods.do?code="+dom1.code+"'>"+dom1.name+"</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp"
					$("#aaa"+dom1.parentcode).html(html1)
					
				})
			})
			$("#all").html(html)
		})
		
	})
})
</script>
</body>
</html>