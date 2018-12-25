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
<title>商品详情页</title>
</head>
<body>
<%@ include file = '/Web/Userjsp/UserHeader.jsp'%>
<div class="content content-nav-base datails-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href='/B2cMarket/goods/gotousergoods.do?code=' class="active">所有商品</a>
          </div>
        </div>
      </div>
    </div>
    <div class="data-cont-wrap w1200" id = "details">
    </div>
  </div>
  <%@ include file = '/Web/Userjsp/UserFoot.jsp'%>
<script type="text/javascript">
var code = '${code1}'
	ajax("/B2cMarket/goods/usergoodsdetails.do", {code:code}, "json", function(data){
		var html = $("#details").html()
		$.each(data, function(i, dom){
			html += "<div class='product-intro layui-clear'>"
			html += "<div class='preview-wrap' id = 'imgm'></div>"
			html += "<div class='itemInfo-wrap'><div class='itemInfo'>"
			html += "<div class='title'><h4>"+dom.name+"</h4>"
			html += "<span><i class='layui-icon layui-icon-rate-solid'></i>收藏</span></div>"
			html += "<div class='summary'><p class='activity'><span>价格</span><strong class='price'><i>￥</i>"+dom.price+"</strong></p></div>"
			html += "<div class='choose-attrs'><div class='color layui-clear'><span class='title'>颜&nbsp;&nbsp;&nbsp;&nbsp;色</span> <div class='color-cont'><span class='btn'>白色</span> <span class='btn active'>黑色</span></div></div></div><div class='box-btn layui-clear'><button class='less layui-btn' id='num' onclick='i()'>-</button><input class='layui-input-inline Quantity-input' style='height:34px;width:64px;' type='' name='num' value='1' disabled='disabled'><button class='add layui-btn' id='num2' onclick='d()'>+</button></div>"
			html += "<div class='choose-btns'><button id = 'addtoshopcart' class='layui-btn  layui-btn-danger car-btn'><i class='layui-icon layui-icon-cart-simple'></i>加入购物车</button></div></div></div></div>"
			html += "<div class='layui-clear'><div class='aside'><h4>热销推荐</h4><div class='item-list'><div class='item'><a href = '/B2cMarket/goods/gotousergoodsdetails.do?code=pgsjxs'><img src='/B2cMarket/Web/image/s_img10.png' style= 'width:327px;height:105px;'></a><p><span>iphoneXS</span><span class='pric'>￥9999.00</span></p></div><div class='item'><img src='/B2cMarket/Web/image/s_img10.png' style= 'width:327px;height:105px;'><p><span>iphoneXS</span><span class='pric'>￥9999.00</span></p></div></div></div><div class='detail'><h4>详情</h4>"
			html += "<div class='item' id = 'imgnm'></div></div></div>"
		})
		$("#details").html(html)
		ajax("/B2cMarket/image/select.do", {code:code}, "json", function(data){
		$.each(data, function(i, dom){
			if(dom.type == "m"){
				var html = $("#imgm").html()
				html += "<img src='/image/"+dom.url+"' style = 'width:384px;height:500px'>"
				$("#imgm").html(html)
			}
			if(dom.type == "nm"){
				var html = $("#imgnm").html()
				html += "<img src='/image/"+dom.url+"' style = 'width:400px;'>"
				$("#imgnm").html(html)
			}
		})
	})
		$("#addtoshopcart").click(click)
	})
	
	function i() {
			var a = parseInt($(".Quantity-input").val());
			if (a == 1) {
				$(".Quantity-input").val(a - 1);
				$("#num").prop("class", "layui-btn layui-btn-disabled");
				$("#num").prop("onclick", "")
			} else {
				$(".Quantity-input").val(a - 1);
			}
		};

		function d() {
			$("#num").prop("class", "layui-btn");
			$("#num").attr("onclick", "i()")
			$(".Quantity-input").val(parseInt($(".Quantity-input").val()) + 1);
		};
	function click(){
			var account = "${per.account}"
			var ammount = $('input[name="num"]').val()
			ajax("/B2cMarket/shopcart/add.do",{account:"${per.account}", code:code, ammount:ammount}, "text", function(data){
				if(data == 1){
					layer.msg("添加成功")
				}
			})
		}
	
</script>
</body>
</html>