<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>vivo商城登录</title>
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
	<div class="container" id="login">
		<div style="height: 100px;"></div>
		<div class="row">
			<div class="col-md-12">
				<div class="col-xs-2 col-sm-2 col-md-2"></div>
				<div class="col-xs-8 col-sm-8 col-md-8" style="background: #FFFFFF;">
					<div style="height: 20px;"></div>
					<div class="row text-center">
						<img src="../static/images/logo/logo.jpg">
						<h4 id="login">账号登录</h4>
					</div>
					<div style="height: 10px;"></div>
					<div class="row text-center">
						<div class="col-md-12">
							<div class="col-xs-2 col-sm-2 col-md-2"></div>
							<div class="col-xs-8 col-sm-8 col-md-8">
								<form role="form" action="login" method="post"
									class="login-form" id="form">
									<div class="form-group">
										<!-- <label for="sr-only" for="form-username">Username</label> -->
										<input v-model="username" type="text" name="username"
											placeholder="请输入用户名" class="form-username form-control"
											id="username">
									</div>
									<div class="form-group">
										<!-- <label for="sr-only" for="form-password">Password</label> -->
										<input v-model="password" type="password" name="password"
											placeholder="请输入密码" class="form-password form-control"
											id="password">
									</div>
									<input type="button" value='登录' class="btn btn-info btn-block"
										@click="login"> 
									<input type="button" value='去注册'
										onclick="window.open('http://localhost:8080/vivo/register/get')"
										class="btn btn-info btn-block">
								</form>
							</div>
							<div class="col-xs-2 col-sm-2 col-md-2"></div>
						</div>
					</div>
					<div style="height: 20px;"></div>
				</div>
				<div class="col-xs-2 col-sm-2 col-md-2"></div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
<script>
	var loginvue = new Vue(
			{
				el : "#login",
				data : {
					username : '',
					password : '',
					msg : ''
				},
				methods:{
					login:function() {
						// 验证用户
						$.ajax({
							url : 'login',
							type : 'POST',
							data : '{"username":"'+loginvue.username+'","password":"'+loginvue.password+'"}',
							contentType : 'application/json',
							success : function(result) {
								if (result) {
									//var data = {
											//id : loginvue.id,
										//}
									//$.get(
											//"http://localhost:8080/vivo/login/login1?id="
													//+ this.id, function(result) {
												//alert(result);
											//}, "json");
									window.location.href = "http://localhost:8080/vivo/myindex/get"
									//$.ajax({
										//type:"GET",
										//url:"http://localhost:8080/vivo/login/login1",
										//data:{'id':loginvue.id},
										//success:function(data){
											//alert(data);
											//window.location.href = "http://localhost:8080/vivo/myindex/get"
										//}
									//})
									
								} else {
									alert("账号或密码错误！");
								}
							}
						});
						// 跳转首页 
					}
				}
			})
</script>
</html>