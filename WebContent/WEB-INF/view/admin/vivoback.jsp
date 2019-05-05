<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>模拟vivo后台管理系统</title>
	<!-- Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="https://cdn.staticfile.org/vue/2.2.2/vue.min.js"></script>
	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			font-family: Lato, Helvetica, Arial, sans-serif;
			font-size: 14px;
			line-height: 1.72222;
			color: #34495e;
			background-color: #fff;
		}

		.wrap {
			min-width: 100%;
			position: absolute;
			background: #eff3f6 bottom;
			min-height: 100%;
			overflow: hidden;
		}

		.left {
			margin-left: 0px;
			position: absolute;
			box-sizing: border-box;
			width: 200px;
			height: 100%;
			background: #4d5e70 bottom;
		}

		.logoDiv {
			padding-top: 20px;
			padding-bottom: 20px;
			height: 70px;
			background-color: #354457;
			font-size: 17px;
			color: #fff;
			vertical-align: bottom;
		}

		.logoTitle {
			margin-left: 15px;
			line-height: 1.7;
		}

		.menu-item {
			padding-left: 15px;
			line-height: 40px;
			height: 40px;
			color: #aab1b7;
			cursor: pointer;
		}

		.menu-item-active {
			background-color: #3d4e60;
			border-right: 4px solid #647f9d;
			color: #fff;
		}

		.right {
			box-sizing: border-box;
			float: left;
			box-sizing: border-box;
			padding-left: 200px;
			overflow-y: overlay;
			overflow-x: hidden;
			clear: both;
			color: #717592;
			min-width: 100%;
			min-height: 500px;
		}

		.red {
			background-color: #8fdd6b;
			color: white;
		}

		.green {
			background-color: #fcb833;
			color: white;
		}

		.none {
			background-color: #6495ED;
			color: white;
		}

		.set {
			background-color: antiquewhite;
			color: black;
		}
	</style>
	<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
	
</head>
<body>
	<div class="container" id="app" style="background:#E7E7E7">
			<div class="row">
				<div class="col-md-12">
					<div class="row" style="background:#202022;color:#fff">
						<div class="col-md-12">
							<h2>vivo后台管理系统</h2>
						</div>
					</div>
					<div class="row" style="height:5px;"></div>
					<div class="row" style="background:#EFEFEF">
						<div class="wrap">
							<!-- 左边内容 -->
							<div id="left" class="left">
								<div id="logoDiv" class="logoDiv">
									<p id="logoTitle" class="logoTitle">
										<img id="logo" alt="左右布局" src="http://tool.what21.com/page/image/menu/cf.png" style="height: 28px; padding-right: 5px;vertical-align: middle;">
										<span style="font-size:18px;">后台管理系统</span>
									</p>
								</div>
								<!-- <div class="menu-title">菜单管理一</div> -->
								<div class="menu-item" href="#one" data-toggle="tab">
									－入库管理
								</div>
								<div class="menu-item" href="#two" data-toggle="tab" @click="goodsManage()">
									－商品管理
								</div>
								<!-- <div class="menu-title">菜单管理二</div> -->
								<div class="menu-item" href="#three" data-toggle="tab" @click="getStoreDate()">
									－仓库管理
								</div>
								<div class="menu-item" href="#four" data-toggle="tab" @click="getOrderDate()">
									－订单管理
								</div>
							</div>
							<!-- 右边内容 -->
							<div id="right" class="tab-content right">
								
								<!-- 入库页面 -->
								<!-- 入库页面共同使用goodsList数据 -->
								<div id="one" class="tab-pane active">
									<div class="col-md-12">
										<div class="row">
											<ul class="breadcrumb">
												<li>
													<!-- <i class="icon-home">::before</i> -->
													<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
													<a href="#">首页</a>
													<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
													<!-- <i class="icon-angle-right">::before</i> -->
												</li>
												<li>
													<a href="#">入库管理</a>

													<!-- <i class="icon-angle-right">::before</i> -->
												</li>
											</ul>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="row" style="background:#EBEBEB;height:30px;">
													<div class="col-md-12">
														<!-- <i class="icon-home">::before</i> -->
														<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
														<span style="font-size:20px;">入库管理</span>
													</div>
												</div>
												<div class="row" style="background:#F9F9F9">
													<div class="col-md-12">
														<div class="row" style="height:10px;"></div>
														<div class="row">
															<div class="col-md-12">
																<div class="col-xs-5 col-md-5 text-left">
																	<!-- <div class="btn-group" role="group" aria-label="...">
																		<button type="button" class="btn btn-default" href="#one" data-toggle="tab">所有</button>
																		<button type="button" class="btn btn-default" href="#six" data-toggle="tab">待审核</button>
																		<button type="button" class="btn btn-default" href="#seven" data-toggle="tab">审核通过</button>
																		<button type="button" class="btn btn-default" href="#eight" data-toggle="tab">审核失败</button>
																	</div> -->																	
																</div>
																<div class="col-xs-5 col-md-5 col-xs-push-2 col-md-push-2 text-right">
																	<div class="btn-group" role="group" aria-label="...">
																		<button type="button" class="btn btn-success" href="#five" data-toggle="tab" @click="goToAddEntry()">
																			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
																			新增
																		</button>
																		<!-- <button type="button" class="btn btn-success">
																			<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
																			编辑
																		</button> -->
																		<button type="button" class="btn btn-warning" @click="deleteSomeEntry()">
																			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
																			删除
																		</button>
																		<button type="button" class="btn btn-danger" @click="refreshEntry()">
																			<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
																			刷新
																		</button>
																	</div>
																</div>
															</div>
														</div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:5px;"></div>
														<div class="row">
															<div class="col-md-12">
																<table class="table table-bordered">
																	<thead>
																		<tr @click="selectedAll()">
																			<th><input type="checkbox" :checked="isAllChecked"></th>
																			<th>入库单号</th>
																			<!-- <th>入库类型</th> -->
																			<th>商品名</th>
																			<th>货品总数</th>
																			<th>单价</th>
																			<th>总金额</th>
																			<th>类别</th>
																			<!-- <th>制单人</th> -->
																			<!-- <th>创建时间</th> -->
																			<!-- <th>审核人</th> -->
																			<th>操作</th>
																		</tr>
																	</thead>
																	<tbody v-for="(item,index) in goodsList">
																		<tr @click="oneSelected(item)" v-bind:class="{ set: item.ischecked }">
																			<td><input type="checkbox" :checked="item.ischecked"></td>
																			<td>{{item.id}}</td>
																			<!-- <td>{{item.type}}</td> -->
																			<td>{{item.goods.goodsname}}</td>
																			<td>{{item.goodsquantity}}</td>
																			<td>{{item.goods.price}}</td>
																			<td>{{item.goodsquantity*item.goods.price}}</td>
																			<td>{{item.goods.category}}</td>
																			<!-- <td>
																				<mark v-bind:class="{'red':item.status == '审核成功','green':item.status == '审核失败','none':item.status== '等待审核'}">{{item.status}}</mark>
																			</td>
																			
																			<td>{{item.date}}</td>
																			<td>{{item.checker}}</td>-->
																			<td>
																				<button type="button" class="btn btn-link" @click="editEntry(item)" href="#six" data-toggle="tab">编辑</button>
																				<button type="button" class="btn btn-link" @click="deleteEntry(item)">删除</button>
																				<!-- <button type="button" class="btn btn-link" v-if="item.status=='等待审核'">审核</button>
																				<button type="button" class="btn btn-link" v-if="item.status=='审核失败'">审核</button>
																				<button type="button" class="btn btn-link">查看</button> -->
																			</td>
																			
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 商品页面 -->
								<!-- 商品页面共同使用goodsListGoods数据 -->
								<div id="two" class="tab-pane">
									<div class="col-md-12">
										<div class="row">
											<ul class="breadcrumb">
												<li>
													<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
													<a href="#">首页</a>
													<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
												</li>
												<li>
													<a href="#">商品管理</a>
												</li>
											</ul>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="row" style="background:#EBEBEB;height:30px;">
													<div class="col-md-12">
														<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
														<span style="font-size:20px;">商品管理</span>
													</div>
												</div>
												<div class="row" style="background:#F9F9F9">
													<div class="col-md-12">
														<div class="row" style="height:10px;"></div>
														<div class="row">
															<div class="col-md-12">
																<div class="col-xs-5 col-md-5 text-left">
																</div>
																<div class="col-xs-5 col-md-5 col-xs-push-2 col-md-push-2 text-right">
																	<div class="btn-group" role="group" aria-label="...">
																		<button type="button" class="btn btn-success" href="#seven" data-toggle="tab" @click="goToAddGoods()">
																			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
																			新增
																		</button>
																		
																		<!-- <button type="button" class="btn btn-warning" @click="deleteSomeGoods()">
																			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
																			删除
																		</button>
																		<button type="button" class="btn btn-danger">
																			<span class="glyphicon glyphicon-refresh" aria-hidden="true" @click="refreshGoods()"></span>
																			刷新
																		</button> -->
																		
																	</div>
																</div>
															</div>
														</div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:5px;"></div>
														<div class="row">
															<div class="col-md-12">
																<table class="table table-bordered" style="table-layout:fixed;">
																	<thead>
																		<tr @click="selectedAll2()">
																			<th style="width:5%;"><input type="checkbox" :checked="isAllChecked"></th>
																			<th style="width:5%;">编号</th>
																			<th style="width:15%;">商品名</th>
																			<th style="width:10%;">单价</th>
																			<th style="width:25%;">详情</th>
																			<th style="width:10%;">类别</th>
																			<th style="width:20%;">折扣信息</th>
																			<th style="width:10%;">操作</th>
																			<!-- <th>创建时间</th> -->
																			<!-- <th>审核人</th> -->
																		</tr>
																	</thead>
																	<tbody v-for="(item,index) in goodsListGoods">
																		<tr @click="oneSelected(item)" v-bind:class="{ set: item.ischecked }">
																			<td style="width:5%;"><input type="checkbox" :checked="item.ischecked"></td>
																			<td style="width:5%;">{{item.id}}</td>
																			<td style="width:15%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;" :title="item.goodsname">{{item.goodsname}}</td>
																			<td style="width:10%;">{{item.price}}</td>
																			<td style="width:25%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;" :title="item.details">{{item.details}}</td>
																			<td style="width:10%;">{{item.category}}</td>
																			<td style="width:20%;white-space:nowrap;overflow:hidden;text-overflow: ellipsis;" :title="item.discount">{{item.discount}}</td>
																			<td style="width:10%;">
																				<div class="btn-group" role="group" aria-label="...">
																					<button type="button" class="btn btn-link" href="#eight" data-toggle="tab" @click="goToEditGoods(item)">编辑</button>
																				</div>
																				<!-- <button type="button" class="btn btn-link" @click="deleteGoods(item)">删除</button>
																				<button type="button" class="btn btn-link" v-if="item.status=='等待审核'">审核</button>
																				<button type="button" class="btn btn-link" v-if="item.status=='审核失败'">审核</button>
																				<button type="button" class="btn btn-link">查看</button> -->
																			</td>
																			<!-- <td>
																				<mark v-bind:class="{'red':item.status == '审核成功','green':item.status == '审核失败','none':item.status== '等待审核'}">{{item.status}}</mark>
																			</td>
																			
																			<td>{{item.date}}</td>
																			<td>{{item.checker}}</td>-->
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 仓库页面 -->
								<!-- 仓库页面共同使用goodsListStore数据 -->
								<div id="three" class="tab-pane">
									<div class="col-md-12">
										<div class="row">
											<ul class="breadcrumb">
												<li>
													<!-- <i class="icon-home">::before</i> -->
													<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
													<a href="#">首页</a>
													<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
												</li>
												<li>
													<a href="#">仓库管理</a>
												</li>
											</ul>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="row" style="background:#EBEBEB;height:30px;">
													<div class="col-md-12">
														<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
														<span style="font-size:20px;">仓库管理</span>
													</div>
												</div>
												<div class="row" style="background:#F9F9F9">
													<div class="col-md-12">
														<div class="row" style="height:10px;"></div>
														<div class="row">
															<div class="col-md-12">
																<div class="col-xs-5 col-md-5 text-left">
																	<div class="btn-group" role="group" aria-label="...">
																		<button type="button" class="btn btn-default" href="#nine" data-toggle="tab">已上架</button>
																		<button type="button" class="btn btn-default" href="#ten" data-toggle="tab">未上架</button>
																	</div>
																</div>
																<div class="col-xs-5 col-md-5 col-xs-push-2 col-md-push-2 text-right">
																	<!-- <div class="btn-group" role="group" aria-label="...">
																		<button type="button" class="btn btn-success" href="#nine" data-toggle="tab">
																			<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
																			新增
																		</button>
																		<button type="button" class="btn btn-warning">
																			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
																			删除
																		</button>
																		<button type="button" class="btn btn-danger">
																			<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
																			刷新
																		</button>
																	</div> -->
																</div>
															</div>
														</div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:5px;"></div>
														<div class="row">
															<div class="col-md-12">
																<table class="table table-bordered">
																	<thead>
																		<tr @click="selectedAll()">
																			<th><input type="checkbox" :checked="isAllChecked"></th>
																			<th>编号</th>
																			
																			<th>商品名</th>
																			<th>类别</th>
																			<th>货品总数</th>
																			<th>状态</th>
																			<th>操作</th>
																			
																			<!-- <th>入库类型</th> -->
																			<!-- <th>总金额</th>
																			<th>类别</th>
																			<th>制单人</th> -->
																			<!-- <th>创建时间</th> -->
																			<!-- <th>审核人</th> -->
																			
																		</tr>
																	</thead>
																	<tbody v-for="(item,index) in goodsListStore">
																		<tr @click="oneSelected(item)" v-bind:class="{ set: item.ischecked }">
																			<td><input type="checkbox" :checked="item.ischecked"></td>
																			<td>{{item.id}}</td>
																			<td>{{item.goods.goodsname}}</td>
																			<td>{{item.goods.category}}</td>
																			<td>{{item.goodsquantity}}</td>
																			<td>
																				<mark v-bind:class="{'red':item.goodsstate == '上架','green':item.goodsstate == '下架'}">{{item.goodsstate}}</mark>
																			</td>
																			<td>
																				<button type="button" class="btn btn-link" v-if="item.goodsstate=='下架'" @click="grounding(item)">上架</button>
																				<button type="button" class="btn btn-link" v-else @click="undercarriage(item)">下架</button>
																				<!-- <button type="button" class="btn btn-link" >删除</button> -->
																			</td>
																			
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 订单页面 -->
								<!-- 订单页面共同使用goodsListOrder数据 -->
								<div id="four" class="tab-pane">
									<div class="col-md-12">
										<div class="row">
											<ul class="breadcrumb">
												<li>
													<span class="glyphicon glyphicon-home" aria-hidden="true"></span>
													<a href="#">首页</a>
													<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
												</li>
												<li>
													<a href="#">订单管理</a>
												</li>
											</ul>
										</div>
										<div class="row">
											<div class="col-md-12">
												<div class="row" style="background:#EBEBEB;height:30px;">
													<div class="col-md-12">
														<span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
														<span style="font-size:20px;">订单管理</span>
													</div>
												</div>
												<div class="row" style="background:#F9F9F9">
													<div class="col-md-12">
														<div class="row" style="height:10px;"></div>
														<div class="row">
															<div class="col-md-12">
																<div class="col-xs-5 col-md-5 text-left">
																	<div class="btn-group" role="group" aria-label="...">
																		<button type="button" class="btn btn-default" href="#eleven" data-toggle="tab">已发货</button>
																		<button type="button" class="btn btn-default" href="#twelve" data-toggle="tab">未发货</button>
																	</div>
																</div>
																<div class="col-xs-5 col-md-5 col-xs-push-2 col-md-push-2 text-right"></div>
															</div>
														</div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:10px;"></div>
														<div class="row" style="height:5px;"></div>
														<div class="row">
															<div class="col-md-12">
																<table class="table table-bordered">
																	<thead>
																		<tr @click="selectedAll4()">
																			<th><input type="checkbox" :checked="isAllChecked"></th>
																			<th>订单号</th>
																			<th>用户名</th>
																			<th>商品名</th>
																			<th>购买数量</th>
																			<th>发货地址</th>
																			<th>状态</th>
																			<th>操作</th>
																		</tr>
																	</thead>
																	<tbody v-for="(item,index) in goodsListOrder">
																		<tr @click="oneSelected(item)" v-bind:class="{ set: item.ischecked }">
																			<td><input type="checkbox" :checked="item.ischecked"></td>
																			<td>{{item.id}}</td>
																			<td>{{item.user.username}}</td>
																			<td>{{item.goods.goodsname}}</td>
																			<td>{{item.goodsquantity}}</td>
																			<td>{{item.user.address}}</td>
																			<td>
																				<mark v-bind:class="{'red':item.state == '已出货','green':item.state == '未出货','none':item.state== '已收货'}">{{item.state}}</mark>
																			</td>
																			<td>
																				<button type="button" class="btn btn-link" v-if="item.state=='未出货'" @click="deliver(item)">出货</button>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- 入库新增页面 -->
								<div id="five"  class="tab-pane">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-6 text-right">
												<input class="btn btn-default" type="button" href="#one" data-toggle="tab" value='取消'>
											</div>
											<div class="col-md-6">
												<input class="btn btn-primary" type="button" href="#one" data-toggle="tab" @click="addEntry()" value='确定'>
											</div>
											<!-- {{goodsname}}{{goodsquantity}}{{goodsprice}} -->
										</div>
										<div class="row" style="margin-top: 1.875rem;">
											<div class="col-md-12">
												<div class="row">					
													<form>
														<!-- v-model绑定vue,体会双向绑定的特性 -->
														<div class="form-group col-md-3"></div>
														<div class="form-group col-md-3">
															<label for="goodsname">商品名</label>
															<input type="text" class="form-control" name="goodsname" id="goodsname" v-model='goodsname' placeholder="商品名">
														</div>
														<div class="form-group col-md-3">
															<label for="goodsquantity">货品总数</label>
															<input type="number" class="form-control" name="goodsquantity" id="goodsquantity" v-model='goodsquantity' placeholder="货品总数">
														</div>
														<div class="form-group col-md-3"></div>
														
														<!-- <div class="form-group col-md-3">
															<label for="price">单价</label>
															<input type="number" class="form-control" name="goodsprice" id="goodsprice" v-model='goodsprice' placeholder="总金额">
														</div>
														<div class="form-group col-md-3">
															<label for="price">审核状态</label>
															<input type="text" class="form-control" id="price" placeholder="审核状态">
														</div>
														<div class="form-group col-md-3">
															<label for="price">创建时间</label>
															<input type="datetime-local" class="form-control" id="price" placeholder="创建时间">
														</div>
														<div class="form-group col-md-3">
															<label for="admin">审核人</label>
															<input type="text" class="form-control" id="admin" placeholder="审核人">
														</div>
														<div class="form-group col-md-3">
															<label for="admin">操作</label>
															<input type="text" class="form-control" id="admin" placeholder="操作">
														</div>
														<div class="form-group col-md-3">
															<label for="exampleInputEmail1">上传图片</label>
															<input type="file" class="form-control" id="upload" placeholder="">
														</div> -->
														
														
													</form>
												</div>
											</div>
										</div>
										
									</div>
								</div>
								
								<!-- 入库编辑页面 -->
								<div id="six"  class="tab-pane">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-6 text-right">
												<input class="btn btn-default" type="button" href="#one" data-toggle="tab" value='取消'>
											</div>
											<div class="col-md-6">
												<input class="btn btn-primary" type="button" href="#one" data-toggle="tab" value='确定' @click="modifyEntry()">
											</div>
											<!-- {{goodsname}}{{goodsquantity}}{{goodsprice}} -->
										</div>
										<div class="row" style="margin-top: 1.875rem;">
											<div class="col-md-12">
												<div class="row">
													<form>
														<!-- v-model绑定vue,体会双向绑定的特性 -->
														<div class="form-group col-md-3"></div>
														<div class="form-group col-md-3">
															<label for="editgoodsname">商品名</label>
															<input type="text" class="form-control" name="editgoodsname" id="editgoodsname" v-model='editgoodsname' placeholder="商品名">
														</div>
														<div class="form-group col-md-3">
															<label for="editgoodsquantity">货品总数</label>
															<input type="number" class="form-control" name="editgoodsquantity" id="editgoodsquantity" v-model='editgoodsquantity' placeholder="货品总数">
														</div>
														<div class="form-group col-md-3"></div>
														<!-- <div class="form-group col-md-3">
															<label for="price">单价</label>
															<input type="number" class="form-control" name="editgoodsprice" id="editgoodsprice" v-model='editgoodsprice' placeholder="总金额">
														</div>
														<div class="form-group col-md-3">
															<label for="exampleInputEmail1">上传图片</label>
															<input type="file" class="form-control" id="upload" placeholder="">
														</div> -->
														
													</form>
												</div>
											</div>
										</div>
										
									</div>
								</div>
								
								<!-- 商品管理添加商品界面 -->
								<div id="seven" class="tab-pane">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-6 text-right">
												<input class="btn btn-default" type="button" href="#two" data-toggle="tab" value='取消'>
											</div>
											<div class="col-md-6">
												<!-- 添加点击事件 -->
												<input class="btn btn-primary" type="button" href="#two" data-toggle="tab" value='确定' @click="addGoods()">
											</div>
											<!-- {{goodsname}}{{goodsquantity}}{{goodsprice}} -->
										</div>
										<div class="row" style="margin-top: 1.875rem;">
											<div class="col-md-12">
												<div class="row">					
													<form>
														<!-- v-model绑定vue,体会双向绑定的特性 -->
														
														<div class="form-group col-md-3">
															<label for="addgoodsname">商品名</label>
															<input type="text" class="form-control" name="addgoodsname" id="addgoodsname" v-model='addgoodsname' placeholder="商品名">
														</div>
														<div class="form-group col-md-3">
															<label for="addgoodsprice">单价</label>
															<input type="number" class="form-control" name="addgoodsprice" id="addgoodsprice" v-model='addgoodsprice' placeholder="单价">
														</div>
														<div class="form-group col-md-3">
															<label for="addgoodscategory">类别</label>
															<input type="text" class="form-control" name="addgoodscategory" id="addgoodscategory" v-model='addgoodscategory' placeholder="类别">
														</div>
														<div class="form-group col-md-3">
															<label for="addgoodsdiscount">折扣信息</label>
															<input type="text" class="form-control" name="addgoodsdiscount" id="addgoodsdiscount" v-model='addgoodsdiscount' placeholder="折扣">
														</div>
														<div class="form-group col-md-3"></div>
														<div class="form-group col-md-6">
															<label for="addgoodsdetails">折扣信息</label>
															<textarea class="form-control" rows="3" name="addgoodsdetails" id="addgoodsdetails" v-model='addgoodsdetails' placeholder="详情"></textarea>
														</div>
														<div class="form-group col-md-3"></div>
													</form>
												</div>
											</div>
										</div>
										
									</div>
								</div>
								
								<!-- 商品管理编辑页面 -->
								<div id="eight" class="tab-pane">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-6 text-right">
												<input class="btn btn-default" type="button" href="#two" data-toggle="tab" value='取消'>
											</div>
											<div class="col-md-6">
												<!-- 添加点击事件 -->
												<input class="btn btn-primary" type="button" href="#two" data-toggle="tab" value='确定' @click="editGoods()">
											</div>
											<!-- {{goodsname}}{{goodsquantity}}{{goodsprice}} -->
										</div>
										<div class="row" style="margin-top: 1.875rem;">
											<div class="col-md-12">
												<div class="row">					
													<form>
														<!-- v-model绑定vue,体会双向绑定的特性 -->
														
														<div class="form-group col-md-3">
															<label for="editaddgoodsname">商品名</label>
															<input type="text" class="form-control" name="editaddgoodsname" id="editaddgoodsname" v-model='editaddgoodsname' placeholder="商品名">
														</div>
														<div class="form-group col-md-3">
															<label for="editaddgoodsprice">单价</label>
															<input type="number" class="form-control" name="editaddgoodsprice" id="editaddgoodsprice" v-model='editaddgoodsprice' placeholder="单价">
														</div>
														<div class="form-group col-md-3">
															<label for="editaddgoodscategory">类别</label>
															<input type="text" class="form-control" name="editaddgoodscategory" id="editaddgoodscategory" v-model='editaddgoodscategory' placeholder="类别">
														</div>
														<div class="form-group col-md-3">
															<label for="editaddgoodsdiscount">折扣信息</label>
															<input type="text" class="form-control" name="editaddgoodsdiscount" id="editaddgoodsdiscount" v-model='editaddgoodsdiscount' placeholder="折扣">
														</div>
														<div class="form-group col-md-3"></div>
														<div class="form-group col-md-6">
															<label for="editaddgoodsdetails">折扣信息</label>
															<textarea class="form-control" rows="3" name="editaddgoodsdetails" id="editaddgoodsdetails" v-model='editaddgoodsdetails' placeholder="详情"></textarea>
														</div>
														<div class="form-group col-md-3"></div>
													</form>
												</div>
											</div>
										</div>
										
									</div>
								</div>
								
								<!-- 仓库已上架商品 -->
								<div id="nine" class="tab-pane">
									nine
								</div>
								
								<!-- 仓库未上架商品 -->
								<div id="ten" class="tab-pane">
									ten
								</div>
								
								<!-- 订单未发货 -->
								<div id="eleven" class="tab-pane">
									eleven
								</div>
								
								<!-- 订单已发货 -->
								<div id="twelve" class="tab-pane">
									twelve
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			
</body>
<script type="text/javascript">
		
	var app = new Vue({
		el: '#app',
		data: {
			//全选
			isAllChecked: false,
			goodsList:[],
			goodsListGoods:[],
			goodsListStore:[],
			goodsListOrder:[],
			goodsname:'',
			goodsquantity:0,
			//goodsprice:0,
			editid:0,
			editgoodsname:'',
			editgoodsquantity:0,
			//editgoodsprice:0,
			addgoodsname:'',
			addgoodsprice:0,
			addgoodsdetails:'',
			addgoodscategory:'',
			addgoodsdiscount:'',
			
			editaddgoodsid:0,
			editaddgoodsname:'',
			editaddgoodsprice:0,
			editaddgoodsdetails:'',
			editaddgoodscategory:'',
			editaddgoodsdiscount:'',
		},
		methods: {
			//单个复选框事件
			oneSelected: function(item) {
				if (item.ischecked == false) {
					this.$set(item, "ischecked", true);
				} else {
					item.ischecked = !item.ischecked;
				}
				this.isSelectedAll();
			},
			//判断是否全选
			isSelectedAll: function() {
				var flag = true;
				this.goodsList.forEach(function(value, index) {
					if (!value.ischecked) {
						flag = false;
					}
				})
				this.isAllChecked = flag ? true : false;
			},
			//全选与取消全选
			selectedAll: function() {
				this.isAllChecked = !this.isAllChecked;
				var a = this.isAllChecked;
				this.goodsList.forEach(function(value, index) {
					value.ischecked = a;
				})
			},
			//判断是否全选
			isSelectedAll2: function() {
				var flag = true;
				this.goodsListGoods.forEach(function(value, index) {
					if (!value.ischecked) {
						flag = false;
					}
				})
				this.isAllChecked = flag ? true : false;
			},
			//全选与取消全选
			selectedAll2: function() {
				this.isAllChecked = !this.isAllChecked;
				var a = this.isAllChecked;
				this.goodsListGoods.forEach(function(value, index) {
					value.ischecked = a;
				})
			},
			//判断是否全选
			isSelectedAll3: function() {
				var flag = true;
				this.goodsListStore.forEach(function(value, index) {
					if (!value.ischecked) {
						flag = false;
					}
				})
				this.isAllChecked = flag ? true : false;
			},
			//全选与取消全选
			selectedAll3: function() {
				this.isAllChecked = !this.isAllChecked;
				var a = this.isAllChecked;
				this.goodsListStore.forEach(function(value, index) {
					value.ischecked = a;
				})
			},
			//判断是否全选
			isSelectedAll4: function() {
				var flag = true;
				this.goodsListOrder.forEach(function(value, index) {
					if (!value.ischecked) {
						flag = false;
					}
				})
				this.isAllChecked = flag ? true : false;
			},
			//全选与取消全选
			selectedAll4: function() {
				this.isAllChecked = !this.isAllChecked;
				var a = this.isAllChecked;
				this.goodsListOrder.forEach(function(value, index) {
					value.ischecked = a;
				})
			},
			//打开入库页面
			goToAddEntry:function(){
				this.goodsname='';
				this.goodsquantity=0;
				//this.goodsprice=0;
			},
			//入库操作
			addEntry:function(){
				//console.log(this.goodsname);
				var data = {goodsname:this.goodsname,goodsquantity:this.goodsquantity};
				$.post("/vivo/vivoadmin/addentry",data,function(result){
					alert(result);// 弹窗弹出入库成功后的返回值success
				},"json");
			},
			//刷新页面
			refreshEntry:function(){
				$.post("/vivo/vivoadmin/getentry","",function(res){
					app.goodsList = res;
				});
			},
			//删除数据
			deleteEntry:function(item){
				//以下ajax为删除一条数据
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/deleteentry",
					data:{'id':item.id},
					success:function(result){
						alert(result);
					}
				})
			},
			//批量删除数据
			deleteSomeEntry:function(){
				var deletesomeentry = [];
				var j=0;
				for(var i=0;i<this.goodsList.length;i++){
					if(this.goodsList[i].ischecked == true){
						deletesomeentry[j]=this.goodsList[i].id;
						j++;
					}
				};
				//alert(JSON.stringify(deletesomeentry));
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/deletesomeentry",
					data:JSON.stringify(deletesomeentry),//传递数组(非键值对)
					contentType:"application/json",
					success:function(result){
						alert(result);
					}
				});
			},
			// 点击编辑,绑定该条目下的数据到编辑页面
			editEntry:function(item){
				this.editgoodsname=item.goods.goodsname;
				this.editgoodsquantity=item.goodsquantity;
				//this.editgoodsprice=item.goods.price;
				this.editid=item.id;
			},
			//修改入库信息
			modifyEntry:function(){
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/editentry",
					data:{"editid":this.editid,"editgoodsname":this.editgoodsname,"editgoodsquantity":this.editgoodsquantity},
					success:function(result){
						alert(result);
					}
				});
				//alert(this.data);
			},
			//商品管理页面数据
			goodsManage:function(){
				$.post("/vivo/vivoadmin/goodsmanage","",function(res){
					app.goodsListGoods = res;
				});
			},
			//打开添加商品
			goToAddGoods:function(){
				this.addgoodsname='';
				this.addgoodsprice=0;
				this.addgoodsdetails='';
				this.addgoodscategory='';
				this.addgoodsdiscount='';
			},
			//添加商品
			addGoods:function(){
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/addgoods",
					data:{"goodsname":this.addgoodsname,"price":this.addgoodsprice,"details":this.addgoodsdetails,"category":this.addgoodscategory,"discount":this.addgoodsdiscount},
					success:function(result){
						alert(result);
					}
				})
			},
			//刷新商品
			//refreshGoods:function(){
			//	$.post("/vivo/vivoadmin/goodsmanage","",function(res){
			//		app.goodsListGoods = res;
			//	});
			//}
			//删除一个商品
			deleteGoods:function(item){
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/deletegoods",
					data:{'id':item.id},
					success:function(result){
						alert(result);
					}
				})
			},
			//批量删除商品
			//deleteSomeGoods:function(){
			//	var deletesomegoods = [];
			//	var j=0;
				//debugger;
			//	for(var i=0;i<this.goodsListGoods.length;i++){
			//		if(this.goodsListGoods[i].ischecked == true){
			//			deletesomegoods[j]=this.goodsListGoods[i].id;
			//			j++;
			//		}
			//	};
			//	alert(JSON.stringify(deletesomeentry));
			//	$.ajax({
			//		type:"POST",
			//		url:"/vivo/vivoadmin/deletesomegoods",
			//		data:JSON.stringify(deletesomegoods),//传递数组(非键值对)
			//		contentType:"application/json",
			//		success:function(result){
			//			alert(result);
			//		}
			//	});
			//},
			
			//进入编辑商品页面
			goToEditGoods:function(item){
				this.editaddgoodsname=item.goodsname;
				this.editaddgoodsprice=item.price;
				this.editaddgoodsdetails=item.details;
				this.editaddgoodscategory=item.category;
				this.editaddgoodsdiscount=item.discount;
				this.editaddgoodsid=item.id;
			},
			
			//编辑商品
			editGoods:function(){
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/editgoods",
					data:{"id":this.editaddgoodsid,"goodsname":this.editaddgoodsname,"price":this.editaddgoodsprice,"details":this.editaddgoodsdetails,"category":this.editaddgoodscategory,"discount":this.editaddgoodsdiscount},
					success:function(result){
						alert(result);
					}
				});
			},
			
			//加载仓库信息
			getStoreDate:function(){
				$.post("/vivo/vivoadmin/getStore","",function(res){
					app.goodsListStore = res;
				});
			},
			
			//将下架的物品上架
			grounding:function(item){
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/grounding",
					data:{'id':item.id},
					success:function(result){
						alert(result);
					}
				});
			},
			
			//将上架的物品下架
			undercarriage:function(item){
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/undercarriage",
					data:{'id':item.id},
					success:function(result){
						alert(result);
					}
				});
			},
			
			//订单页面数据
			getOrderDate:function(){
				$.post("/vivo/vivoadmin/getOrder","",function(res){
					app.goodsListOrder = res;
				});
			},
			
			//发货
			deliver:function(item){
				$.ajax({
					type:"POST",
					url:"/vivo/vivoadmin/deliver",
					data:{"id":item.id,"goodsquantity":item.goodsquantity},
					success:function(result){
						alert(result);
					}
				});
			},
		}
	});
	// 显示页面数据
	$.post("http://localhost:8080/vivo/vivoadmin/getentry","",function(res){
		app.goodsList = res;
	});
	//console.log(app.goodsList);
		
</script>
<script>
	$(function() {
		$(".menu-item").click(function() {
			$(".menu-item").removeClass("menu-item-active");
			$(this).addClass("menu-item-active");
			var itmeObj = $(".menu-item").find("img");
			itmeObj.each(function() {
				var items = $(this).attr("src");
				items = items.replace("_grey.png", ".png");
				items = items.replace(".png", "_grey.png")
				$(this).attr("src", items);
			});
			var attrObj = $(this).find("img").attr("src");;
			//attrObj = attrObj.replace("_grey.png", ".png");
			$(this).find("img").attr("src", attrObj);
		});
	});
</script>
</html>