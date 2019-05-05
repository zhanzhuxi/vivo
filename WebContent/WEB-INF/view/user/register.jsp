<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>vivo商城注册</title>
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
	<div class="container" id="app" v-cloak>
		<div style="height: 100px;"></div>
		<div class="row">
			<div class="col-md-12">
				<div class="col-xs-2 col-sm-2 col-md-2"></div>
				<div class="col-xs-8 col-sm-8 col-md-8" style="background: #FFFFFF;">
					<div style="height: 20px;"></div>
					<div class="row text-center">
						<img src="../static/images/logo/logo.jpg">
						<h4 id="login">账号注册</h4>
					</div>
					<div style="height: 10px;"></div>
					<div class="row text-center">
						<div class="col-md-12">
							<div class="col-xs-2 col-sm-2 col-md-2"></div>
							<div class="col-xs-8 col-sm-8 col-md-8">
								<form class="login-form">
									<div class="form-group"
										v-bind:class="{'has-error':usernamehelp!=''}">
										<input type="text" name="username" placeholder="请输入用户名"
											class="form-username form-control" v-model="username">
										<span class="help-block">{{usernamehelp}}</span>
									</div>
									<div class="form-group"
										v-bind:class="{'has-error':passwordhelp!=''}">
										<input type="password" name="password" placeholder="请输入密码"
											class="form-password form-control" v-model="password">
										<span class="help-block">{{passwordhelp}}</span>
									</div>
									<div class="form-group"
										v-bind:class="{'has-error':passwordhelp2!=''}">
										<input type="password" name="password2" placeholder="请确认密码"
											class="form-password form-control" v-model="password2">
										<span class="help-block">{{passwordhelp2}}</span>
									</div>
									<input type="button" value='注册' class="btn btn-info btn-block"
										@click="register"> <input type="button" value='去登录'
										onclick="window.open('http://localhost:8080/vivo/login/get')"
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
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			username : '',
			password : '',
			password2 : '',
			usernamehelp : '',
			passwordhelp : '',
			passwordhelp2 : ''
		},
		methods : {
			register : function() {
				if (this.username.length < 3) {
					this.usernamehelp = "用户名不少于3个字";
				} else if (this.password.length < 6) {
					this.passwordhelp = "密码不少于6个字";
				} else if (this.password != this.password2) {
					this.passwordhelp2 = "两次密码不一致";
				} else {
					var data = {
						username : this.username,
						password : this.password
					}
					$.get(
							"http://localhost:8080/vivo/register/register?username="
									+ this.username + "&password="
									+ this.password, function(result) {
								alert(result);
							}, "json");
				}

			}
		}
	})
</script>
</html>