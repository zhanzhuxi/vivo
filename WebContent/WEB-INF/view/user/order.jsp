<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta content="text/html; charset=utf-8">
		<title>订单</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
	</head>
	<style type="text/css">
		body {
			background-color: #F7F7F5;
		}
	</style>
	<body>
		<div class="container" id="app">
			<div class="row">
				<div class="navbar navbar-inverse navbar-fixed-top">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
							 aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="#"><strong>vivo商城</strong></a>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" role="navigation" aria-expanded="true">
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
				<h2>我的订单</h2>
			</div>
			<div style="height: 10px;"></div>
			<div class="row" style="background: #FFFFFF;">
				<div class="col-md-12">
					<div class="col-xs-1 col-sm-1 col-md-2 text-right">
						<p></p>
						<p></p>
						<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
					</div>
					<div class="col-xs-10 col-sm-10 col-md-10 text-left">
						<p>黄金玉</p>
						<p>江苏省淮安市 淮阴区 王营镇 长江西路111号 淮阴师范学院</p>
					</div>
				</div>
				
			</div>
			<div style="height: 10px;"></div>
			<div class="row"  v-for="good in goodsList" style="background: #FFFFFF;">
				<div class="col-md-12">
					<div class="col-xs-6 col-sm-5 col-md-3 text-center">
						<img class="img-responsive" :src="good.imgurl" >
					</div>
					<div class="col-xs-6 col-sm-7 col-md-8">
						<div class="row">
							<p>
								<h4>{{good.goodsname}}</h4>
							</p>
							<p>
								<h5 class="text-danger">{{good.discount}}</h5>
								<h5>
									{{good.details}}
								</h5>
							</p>
						</div>
						<div class="row">
							<p>
								<h3 class="text-danger"><span>￥</span>{{good.price}}</h3>
							</p>
						</div>
						<div class="row text-right">
							<p>
								<h4 class="text-danger">x{{good.quantity}}件</h4>
							</p>
						</div>
					</div>
				</div>
			</div>
			<div style="height: 10px;"></div>
			<div class="row" style="background: #FFFFFF;">
				<div class="col-md-12 text-right">
						<div class="btn-group" role="group" aria-label="...">
							<button type="button" class="btn btn-danger" @click="cash()">提交订单</button>
						</div>
				</div>
			</div>
			<div style="height: 36p;"></div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
		<script>
		var vue = new Vue({
			el : '#app',
			data : {
				goodsList : [
				{
					imgurl:'../static/images/mobile/mobile_1.png',
					goodsname:'Z1青春版4GB+32GB',
					discount:'【4月18日-30日限时直降50元】',
					details:'6.26英寸刘海屏 ，八核处理器，Face Wake面部+指纹双识别，前置1600万AI智慧美颜（付款后5天内发货）',
					price:949.00,
					quantity:1,
				},
				{
					imgurl:'../static/images/mobile/mobile_1.png',
					goodsname:'Z1青春版4GB+32GB',
					discount:'【4月18日-30日限时直降50元】',
					details:'6.26英寸刘海屏 ，八核处理器，Face Wake面部+指纹双识别，前置1600万AI智慧美颜（付款后5天内发货）',
					price:949.00,
					quantity:1,
				}]
			},
			methods : {
				cash:function(){
					alert("付款成功");
				}
			}
		})
		//$.post("http://localhost:8080/vivo/order/get","",function(res){
			//app.goodsList = res;
		//});
		
		</script>
	</body>
</html>
