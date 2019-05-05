<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta content="text/html; charset=utf-8">
<title>我的购物车</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
<style type="text/css">
body {
	background-color: #F7F7F5;
}
</style>
</head>
<body>
	<div class="container" id="app">
		<div class="row">
			<div class="navbar navbar-inverse navbar-fixed-top">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#"><strong>vivo商城</strong></a>
					</div>
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1" role="navigation"
						aria-expanded="true">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="http://localhost:8080/vivo/cart/get">购物车</a></li>
							<li><a href="">个人中心</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 90px;"></div>
		<div class="row text-center" style="background: #FFFFFF;">
			<h2>我的购物车</h2>
		</div>
		<div style="height: 10px;"></div>
		<div class="row" style="background: #FFFFFF;">
			<div class="col-md-12">
				<table class="table">
					<thead>
						<tr>
							<!-- <th @click="selectedAll()"><input type="checkbox" :checked="isAllChecked"></th> -->
							<th>商品名称</th>
							<th>单价</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody v-for="good in goodsList">
						<tr>
							<!-- <td @click="oneSelected(goods)" v-bind:class="{ set: goods.isChecked }"><input type="checkbox" :checked="goods.isChecked"></td> -->
							<td>{{good.goods.goodsname}}</td>
							<td>{{good.goods.price}}</td>
							<td><input type="number" class="form-control"
								v-model="good.quantity"></td>
							<td>{{good.goods.price*good.quantity}}</td>
							<td>
								<input type="button" value="删除" class="btn btn-default" @click="remove(good)">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div style="height: 10px;"></div>
		<div class="row" style="background: #FFFFFF;">
			<div class="col-md-12">
				<div class="col-xs-6 col-sm-7 col-md-8 text-right">
					<p>
						<strong><h4>
								合计：<span class="text-danger">￥{{sumprice}}</span>
							</h4></strong>
					</p>
				</div>
				<div class="col-xs-6 col-sm-5 col-md-4 text-left">
					<div class="btn-group" role="group" aria-label="...">
						<a href="http://localhost:8080/vivo/myindex/get">
							<button type="button" class="btn btn-info">继续购物</button>
						</a> <a href="http://localhost:8080/vivo/order/get">
							<button type="button" class="btn btn-danger" @click="cash()">去结算</button>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script>
		var vue = new Vue({
			el : "#app",
			data : {
				num : 0,
				goodsList : []
			//全选
			//isAllChecked: false
			},
			computed : {
				sumprice : function() {
					var sum = 0;
					for (var i = 0; i < this.goodsList.length; i++) {
						sum = sum + this.goodsList[i].goods.price
								* this.goodsList[i].quantity;
					}
					return sum;
				}
			},
			methods:{
				remove:function(good){
					alert(good.id);
					$.ajax({
						type:"POST",
						url:"http://localhost:8080/vivo/cart/deletegoods",
						data:{'id':good.id},
						success:function(result){
							alert(result);
						}
					})
				},
				cash:function(){
					$.ajax({
						type:"POST",
						url:"http://localhost:8080/vivo/cart/addorder",
						data:{'goodsList':this.goodsList},
						success:function(result){
							//alert(result);
						}
					})
				}
			}
		//methods: {
		//单个复选框事件
		//	oneSelected: function(item) {
		//	if (item.isChecked == false) {
		//		this.$set(item, "isChecked", true);
		//} else {
		//	item.isChecked = !item.isChecked;
		//}
		//this.isSelectedAll();
		//},
		//判断是否全选
		//isSelectedAll: function() {
		//var flag = true;
		//this.goodsList.forEach(function(value, index) {
		//if (!value.isChecked) {
		//flag = false;
		//}
		//})
		//this.isAllChecked = flag ? true : false;
		//},

		//全选与取消全选
		//selectedAll: function() {
		//this.isAllChecked = !this.isAllChecked;
		//var a = this.isAllChecked;
		//this.goodsList.forEach(function(value, index) {
		//	value.isChecked = a;
		//})
		//}
		//}
		})
		$.get("http://localhost:8080/vivo/cart/cart", function(res) {
			vue.goodsList = res;
		})
	</script>
</body>
</html>
