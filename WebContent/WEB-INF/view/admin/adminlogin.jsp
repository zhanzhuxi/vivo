<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>vivo后台管理登录系统页面</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" id="app">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<div class="row" style="margin-top: 3.125rem;">
								<div class="col-md-12">
									<div class="text-center">
										<h4><b>vivo后台管理登录系统页面</b></h4>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<form>
										<div class="form-group" style="margin-top: 1.25rem;">
											<label for="adname">管理员名:</label>
											<div style="margin-top: 1.25rem;">
												<input type="text" class="form-control " id="adname" v-model="adname" placeholder="管理员名">
											</div>
										</div>
										<div class="form-group" style="margin-top: 1.25rem;">
											<label for="password">密码:</label>
											<div style="margin-top: 1.25rem;">
												<input type="password" class="form-control" id="password" v-model="password" placeholder="密码">
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12" style="margin-top: 1.25rem;">
									<button type="button" class="btn btn-info btn-block color" @click="adminlogin()">
										<h5>登录</h5>
									</button>
								</div>
							</div>
						</div>
						<div class="col-md-4"></div>
					</div>
				</div>
			</div>
		</div>
		
		
		<script>
			new Vue({
				el: '#app',
				data: {
					adname:'',
					password:'',
				},
				methods: {
					adminlogin:function(){
						$.ajax({
							type:"POST",
							url:"/vivo/vivoadminlogin/adminlogin",
							data:{"adname":this.adname,"password":this.password},
							success:function(result){
								if(result == true){
									window.location.href="http://localhost:8080/vivo/vivoadmin/getentry";
								}else{
									alert("no user!");
								}
							}
						})
					}
				}
			})
		</script>
</body>
</html>