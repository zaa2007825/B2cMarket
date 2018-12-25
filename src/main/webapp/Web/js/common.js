/**
 * 
 */
var form = layui.form
var $ = layui.jquery
var layer = layui.layer
var element = layui.element
var laypage = layui.laypage
var carousel = layui.carousel
mm = layui.mm;

function openLayer(url, end){
	layer.open({
		type: 2,
		area: ['800px','400px'],
		fixed: false,
		maxmin: true,
		end : end,
		shadeClose: true,
		content: "/B2cMarket" + url
	})
}
function ajax(url, field, dataType, func) {
	$.ajax({
		url : url,
		traditional:true,
		data : field,
		dataType : dataType,
		type : 'post',
		success : func
	});
}
function setPageInfo8(elem, count, curr, limit, jump){
	laypage.render({
		elem : elem,
		count : count,
		curr : curr,
		limit : limit,
		limits : [8, 16, 24],
		layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
		jump : jump
	});
}
function setPageInfo(elem, count, curr, limit, jump){
	laypage.render({
		elem : elem,
		count : count,
		curr : curr,
		limit : limit,
		layout : [ 'count', 'prev', 'page', 'next', 'limit', 'skip' ],
		jump : jump
	});
}
function formSubmit(url,submit,dataType,func){
	form.on(submit,function(data){
		ajax(url, data.field, dataType, func)
	})
}
function logoutopenConfirm(fuc){
	layer.confirm('确定登出吗', {icon: 3, title:'提示'}, fuc);       
}
function deleteopenConfirm(fuc){
	layer.confirm('确定删除吗', {icon: 3, title:'提示'}, fuc)
}
function payopenConfirm(fuc){
	layer.confirm('确认支付吗', {icon: 3, title:'提示'}, fuc)
}