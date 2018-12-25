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
<title>购物车页面</title>
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
        <div class="th th-chk">
          <div class="select-all">
            <div class="cart-checkbox">
              <input class="check-all check" id="allCheckked" type="checkbox" value="true" onclick = "allcheck()">
            </div>
          <label>&nbsp;&nbsp;全选</label>
          </div>
        </div>
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
        <div class="th th-op">
          <div class="th-inner">
            操作
          </div>
        </div>  
      </div>
		
		<div class="OrderList">
        <div class="order-content" id="list-cont">
        </div>
      </div>

      <div class="FloatBarHolder layui-clear">
        <div class="th th-chk">
          <div class="select-all">
            <label>&nbsp;&nbsp;已选<span class="Selected-pieces">0</span>件</label>
          </div>
        </div>
        <div class="th Settlement">
          <button class="layui-btn" onclick = "pay()">下单</button>
        </div>
        <div class="th total">
          <p>应付：<span class="pieces-total" id = "priceall">0.00</span></p>
        </div>
      </div>
    </div>
  </div>
<%@ include file = '/Web/Userjsp/UserFoot.jsp'%>
<script type="text/javascript">
		function select(){
			ajax("/B2cMarket/shopcart/selectall.do", {account: "${per.account}"}, "json", function(data){
				var html = $("#list-cont").html()
				$.each(data, function(i, dom){
					var price = (parseFloat(dom.price)).toFixed(2)
					html += '<ul class="item-content layui-clear"><li class="th th-chk"><div class="select-all"><div class="cart-checkbox"><input class="CheckBoxShop check" onclick="javascript:ins(\''+dom.id+'\')" id="selectthis'+dom.id+'" name = "selectone" type="checkbox" num="all" value="'+dom.id+'"></div></div></li>'
					html += "<li class='th th-item'><div class='item-cont'><img src='/image/"+dom.url+"' style = 'width:156px;'>"
					html += "<div class='text'><div class='title'>"+dom.name+"</div><p><span>白色</span></div></div></li>"
					html += "<li class='th th-price'><span class='th-su' id = 'price"+dom.id+"'>"+price+"</span></li>"
					html += "<li class='th th-amount'><div class='box-btn layui-clear'><button class='less layui-btn' id = 'num"+dom.id+"' onclick='i(\""+dom.id+"\")'>-</button><input class='Quantity-input' style='width:50px;' name='num"+dom.id+"' value='"+dom.ammount+"' disabled='disabled'><button class='add layui-btn' onclick='d(\""+dom.id+"\")'>+</button></div></li>"
					html += "<li class='th th-sum'><span class='sum' id = 'sumall"+dom.id+"'>"+(parseFloat(parseInt(dom.ammount)*parseInt(dom.price))).toFixed(2)+"</span></li>"
					html += "<li class='th th-op'><span class='dele-btn' id = 'delete' onclick = 'dele(\""+dom.id+"\")'>删除</span></li></ul>"
				})
				$("#list-cont").html(html)
			})
		}
	select()
	function i(id) {
		var a = parseInt($("input[name = 'num"+id+"']").val());
		if (a == 1) {
			
		} else {
			$("input[name = 'num"+id+"']").val(a - 1);
		}
		var am = $("input[name = 'num"+id+"']").val()
		var pr = parseInt($("#price"+id).html())
		var sum1 = parseInt($("#sumall"+id).html())
		ajax("/B2cMarket/shopcart/update.do", {id:id, ammount:am}, "json", function(data){
			var html = "";
			html += (am*pr).toFixed(2)
			$("#sumall"+id).html(html)
			if($("#selectthis"+id).prop("checked")){
				var sum2 = parseInt($("#sumall"+id).html())
				var priceall = parseInt($("#priceall").html())
				var priceallall = priceall+(sum2-sum1)
				$("#priceall").html(priceallall.toFixed(2))
			}
		})
	};

	function d(id) {
// 		$("#num"+id).prop("class", "layui-btn");
// 		$("#num"+id).attr("onclick", "i(\""+id+"\")")
		$("input[name = 'num"+id+"']").val(parseInt($("input[name = 'num"+id+"']").val()) + 1);
		var am = $("input[name = 'num"+id+"']").val()
		var pr = parseInt($("#price"+id).html())
		var sum1 = parseInt($("#sumall"+id).html())
		ajax("/B2cMarket/shopcart/update.do", {id:id, ammount:am}, "json", function(data){
			var html = "";
			html += (am*pr).toFixed(2)
			$("#sumall"+id).html(html)
			if($("#selectthis"+id).prop("checked")){
				var sum2 = parseInt($("#sumall"+id).html())
				var priceall = parseInt($("#priceall").html())
				var priceallall = priceall+(sum2-sum1)
				$("#priceall").html(priceallall.toFixed(2))
			}
		})
	};
	
	function ins(id){
		if($("input[id^='selectthis']:checked").length==$("input[id^='selectthis']").length){
			$("#allCheckked").prop("checked","checked")
		}
		$(".Selected-pieces").html($("input[name='selectone']:checked").length)
		if($("#selectthis"+id).prop("checked")){
			var html = parseInt($("#priceall").html());
			html += parseInt($("#sumall"+id).html())
			$("#priceall").html(html.toFixed(2))
		}else{
			$("#allCheckked").prop("checked", "")
			var html = parseInt($("#priceall").html());
			html -= parseInt($("#sumall"+id).html())
			$("#priceall").html(html.toFixed(2))
		}
	}
	function allcheck(){
		if($("#allCheckked").prop("checked")){
			$("input[name = 'selectone']").prop("checked","checked")
 			var length = $("input[name = 'selectone']:checked").length
 			$(".Selected-pieces").html(length)
			var sum = 0;
			$("span[id^= 'sumall']").each(function(i, dom){
				sum += parseFloat($(dom).html());
			})
			$("#priceall").html(sum.toFixed(2));
		}else{
			$("input[name = 'selectone']").prop("checked","")
			$("#priceall").html(0)
			$(".Selected-pieces").html(0)
		}
	}
	function dele(id){
		ajax("/B2cMarket/shopcart/delete.do", {id:id}, "text", function(data){
			if(data == 1){
				layer.msg("删除成功")
			}
			location.href = "/B2cMarket/Web/Afterloginjsp/Shopcart.jsp"
		})
	}
	function pay(){
		if($("input[name='selectone']:checked").size() == 0){
			layer.msg("没有想买的商品没办法下单")
		}else{
			var ids = '';
			$("input[name='selectone']:checked").each(function(i, dom){
				ids += dom.value + ','
			})
			location.href = "/B2cMarket/order/openorder.do?ids="+ids
		}
	}
</script>
</body>
</html>