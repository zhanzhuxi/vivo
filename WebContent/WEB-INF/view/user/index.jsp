<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
<meta content="text/html; charset=utf-8">
<title>vivo商城</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
</head>
<style type="text/css">
body {
	background-color: #F7F7F5;
}
</style>
<body>
	<div class="container" id="app">
		<!-- 头部导航-->
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
							<li><a href="http://localhost:8080/vivo/login/get">登录</a></li>
							<li><a href="http://localhost:8080/vivo/register/get">注册</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div style="height: 90px;"></div>
		<!-- 轮播图-->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				<li data-target="#carousel-example-generic" data-slide-to="3"></li>
				<li data-target="#carousel-example-generic" data-slide-to="4"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="../static/images/banner/banner_1.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="../static/images/banner/banner_2.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="../static/images/banner/banner_3.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="../static/images/banner/banner_4.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>
				<div class="item">
					<img src="../static/images/banner/banner_5.jpg" alt="...">
					<div class="carousel-caption">...</div>
				</div>

			</div>
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

		<div style="height: 10px;"></div>
		<!-- 专区分类-->
		<div class="row">
			<div class="col-md-12">
				<div class="col-xs-6 col-sm-3 col-md-3">
					<a href=""><img class="img-responsive"
						src="../static/images/category/category_1.jpg"></a>
				</div>
				<div class="col-xs-6 col-sm-3 col-md-3">
					<a href=""><img class="img-responsive"
						src="../static/images/category/category_2.jpg"></a>
				</div>
				<div class="hidden-xs col-sm-3 col-md-3">
					<a href=""><img class="img-responsive"
						src="../static/images/category/category_3.jpg"></a>
				</div>
				<div class="hidden-xs col-sm-3 col-md-3">
					<a href=""><img class="img-responsive"
						src="../static/images/category/category_4.jpg"></a>
				</div>
			</div>
		</div>

		<div style="height: 36px;"></div>
		<!-- 手机商品-->
		<div class="row">
			<div class="col-md-12">
				<div class="row text-center">
					<h4>精品手机</h4>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="col-xs-6 col-md-3 text-center"
							v-for="mobile in mobileList">
							<img class="img-responsive" :src="mobile.imgurl"> <label>
								<p>{{mobile.goodsname}}</p>
								<p>{{mobile.discount}}</p>
								<div class="row">
									<p>
									<h3 class="text-danger">
										<span id="">￥</span>{{mobile.price}}
									</h3>
									</p>
									<button type="button" class="btn btn-warning text-left" @click="addCart()">加入购物车</button>
								</div>
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="height: 30px;"></div>
		<!-- 配件商品-->
		<div class="row">
			<div class="row text-center">
				<h4>精品配件</h4>
			</div>
			<div class="row">
				<div class="col-xs-6 col-md-3 text-center" v-for="part in partList">
					<img class="img-responsive" :src="part.imgurl"> <label>
						<p id="name">{{part.goodsname}}</p>
						<p id="details">{{part.discount}}</p>
						<div class="row">
							<p id="price">
							<h3 class="text-danger">
								<span id="">￥</span>{{part.price}}
							</h3>
							</p>
							<button type="button" class="btn btn-warning text-left" @click="addCart()">加入购物车</button>
						</div>
					</label>
				</div>
			</div>
			<div style="height: 36px;"></div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var vue = new Vue({
			el : '#app',
			data : {
				mobileList : [],
				partList : []
			},
			methods : {
				addCart:function(){
					alert("请先登录");
				}
			}
		})
		$.get("http://localhost:8080/vivo/index/index", function(res) {
			vue.mobileList = res;
		})
		$.post("http://localhost:8080/vivo/index/index1", function(res) {
			vue.partList = res;
		})
	</script>
</body>
</html>