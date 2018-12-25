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
<title>订单信息查看</title>
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
       	订单编号
          </div>
        </div>
        <div class="th th-price">
          <div class="th-inner">
            姓名
          </div>
        </div>
        <div class="th th-amount">
          <div class="th-inner">
          收货地址  
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            时间
          </div>
        </div>
        <div class="th th-sum">
          <div class="th-inner">
            状态
          </div>
        </div>
        <div class="th th-addr">
          <div class="th-inner">
            操作
          </div>
        </div>
      </div>
		
		<div class="OrderList">
        <div class="order-content" id="list-cont">
        </div>
      </div>
	 <div id="page" class = "layui-col-md6 layui-col-md-offset4"></div>
			<input type = "hidden" name = 'currpage' value = '1'/>
			<input type = "hidden" name = 'limipage' value = '10'/>
    </div>
  </div>
<%@ include file = '/Web/Userjsp/UserFoot.jsp'%>
<script type="text/javascript">
var account = "${per.username}"
aa()
function aa(){
	var curr = $("input[name ='currpage']").val();
	var limit = $("input[name ='limipage']").val();
	ajax("/B2cMarket/order/orderinformation.do", {account:account, pageIndex:curr, pageLimit:limit}, "json", function(data){
		setPageInfo("page", data.count, curr, limit, function(obj, first){
		    $("input[name ='currpage']").val(obj.curr);
		    $("input[name ='limipage']").val(obj.limit);
		    if(!first){
				aa()
		    }
		})
		$("#list-cont").html('');
		var html = '';
		$.each(data.list, function(i, dom){
			html += "<ul class='item-content layui-clear'><li class='th th-item'><div class='text'><div class='title' style='position: relative;left: 100px;'>"+dom.code+"</div></div>"
			html += "<li class='th th-price'><span class='th-su' id = 'name'>"+dom.username+"</span></li>"
			html += "<li class='th th-amount'><input class='Quantity-input' name='num"+dom.id+"' value='"+dom.address+"' disabled='disabled'></li>"
			html += "<li class='th th-sum'><span class='sum' id = 'time"+dom.id+"'>"+dom.time+"</span></li>"
			if(dom.cond == "alreadypay"){
				html += "<li class='th th-sum'><span class='sum' id = 'cond"+dom.id+"'>已付款</span></li>"
			}
			if(dom.cond == "notpay"){
				html += "<li class='th th-sum'><span class='sum' id = 'cond"+dom.id+"'>未付款</span></li>"
			}
			html += "<li class='th th-op'><div onclick = 'openordergoods(\""+dom.code+"\")'><span class='th-su'>订单商品详情</span></div></ul>"
		})
		$("#list-cont").html(html)
		
	})
}
function openordergoods(code){
	openLayer("/order/openordergoodsinf.do?code="+code,function(){
		location.href = "/B2cMarket/Web/Afterloginjsp/OrderInformation.jsp"
	})
}
</script>
</body>
</html>