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
<title>确认订单界面</title>
</head>
<body>
<%@ include file = '/Web/Userjsp/UserHeader.jsp'%>
<div class="content content-nav-base shopcart-content">
    <div class="main-nav">
      <div class="inner-cont0">
        <div class="inner-cont1 w1200">
          <div class="inner-cont2">
            <a href="/B2cMarket/goods/gotousergoods.do?code=" class="active">所有商品</a>
          </div>
        </div>
      </div>
    </div>

    <div class="cart w1200">
      <div class="cart-table-th">
        <div class="th th-item">
          <div class="th-inner">
            商品
          </div>
        </div>
        <div class="th th-price">
          <div class="th-inner">
            单价
          </div>
        </div>
        <div class="th th-amount">
          <div class="th-inner">
            数量
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            小计
          </div>
        </div>
        <div class="th th-addr">
          <div class="th-inner">
            地址
          </div>
        </div>
      </div>
		
		<div class="OrderList">
        <div class="order-content" id="list-cont">
        </div>
      </div>

      <div class="FloatBarHolder layui-clear">
        <div class="th th-chk">
        </div>
        <div class="th Settlement">
          <button class="layui-btn" onclick = "pay()">确认订单</button>
        </div>
        <div class="th total">
          <p>总计：<span class="pieces-total" id = "priceall">0</span></p>
        </div>
      </div>
    </div>
  </div>
<%@ include file = '/Web/Userjsp/UserFoot.jsp'%>
<script type="text/javascript">
var id = ${a};

$(function(){
// 	for(var i = 0;i<id.length;i++){
// 		alert(id[i]);
// 	}
console.log(typeof id[0]);
	ajax("/B2cMarket/shopcart/select.do", {id:id}, "json", function(data){
		var html = $("#list-cont").html()
		$.each(data, function(i, dom){
			html += "<ul class='item-content layui-clear'><li class='th th-item'><div class='item-cont'><img src='/image/"+dom.url+"' style = 'width:156px;float:right;'></div><div class='text'><div class='title' style='position: relative;left: 235px;'>"+dom.name+"</div></div>"
			html += "<li class='th th-price'><span class='th-su' id = 'price'>"+dom.price+"</span></li>"
			html += "<li class='th th-amount'><div class='box-btn layui-clear'><input class='Quantity-input' name='num"+dom.id+"' value='"+dom.ammount+"' disabled='disabled'></div></li>"
			html += "<li class='th th-sum'><span class='sum' id = 'sumall"+dom.id+"'>"+parseInt(dom.ammount)*parseInt(dom.price)+"</span></li>"
			html += "<li class='th th-op'><div><span class='th-su'><input type = 'text' name = 'addr' value = 'sd'/></span></div></ul>"
		})
		$("#list-cont").html(html)
		var sum = 0;
		$("span[id^= 'sumall']").each(function(i, dom){
			sum += parseFloat($(dom).html());
		})
		$("#priceall").html(sum.toFixed(2));
	})
})
function pay(){
	var id = ${a}
	var acc = '${per.account}';
	var addr = $("input[name = 'addr']").val()
	ajax("/B2cMarket/order/add.do", {account:acc, address:addr, id:id}, "text", function(data){
		if(data == 1){
			layer.msg("下单成功")
			location.href = "/B2cMarket/Web/Afterloginjsp/OrderInformation.jsp"
		}
	})
}
</script>
</body>
</html>