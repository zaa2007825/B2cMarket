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
<title>订单商品信息</title>
</head>
<body>
<div class="content content-nav-base shopcart-content">

    <div class="cart w1200">
      <div class="cart-table-th">
        <div class="th th-item">
          <div class="th-inner">
       	订单编号
          </div>
        </div>
        <div class="th th-price">
          <div class="th-inner">
            商品图片
          </div>
        </div>
        <div class="th th-price">
          <div class="th-inner">
            商品名称
          </div>
        </div>
        <div class="th th-amount">
          <div class="th-inner">
          数量  
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            价格
          </div>
        </div>
      </div>
		
		<div class="OrderList">
        <div class="order-content" id="list-cont">
        </div>
      </div>

    </div>
  </div>
<script type="text/javascript">
	var ordercode = "${oco}"
	ajax("/B2cMarket/ordergoods/selectall.do", {ordercode:ordercode}, "json", function(data){
		var html = $("#list-cont").html()
		$.each(data, function(i, dom){
			html += "<ul class='item-content layui-clear'><li class='th th-item'><div class='text'><div class='title' style='position: relative;left: 100px;'>"+dom.ordercode+"</div></div>"
			html += "<li class='th th-pictuer'><div class='item-cont'><img src='/image/"+dom.goodsimage+"'></div></li>"
			html += "<li class='th th-price'><span class='th-su' id = 'goodsname'>"+dom.goodsname+"</span></li>"
			html += "<li class='th th-amount'><div class='box-btn layui-clear'><input class='Quantity-input' name='num"+dom.id+"' value='"+dom.ammount+"' disabled='disabled'></div></li>"
			html += "<li class='th th-sum'><span class='sum' id = 'price"+dom.id+"'>"+(parseFloat(parseInt(dom.ammount)*parseInt(dom.price))).toFixed(2)+"</span></li></ul>"
		})
		$("#list-cont").html(html)
	})
</script>
</body>
</html>