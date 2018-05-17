<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Xenon Boostrap Admin Panel" />
	<meta name="author" content="" />
	
	<title>酒店人事管理系统</title>

	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Arimo:400,700,400italic">
	<link rel="stylesheet" href="<%=basePath%>assets/css/fonts/linecons/css/linecons.css">
	<link rel="stylesheet" href="<%=basePath%>assets/css/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath%>assets/css/xenon-core.css">
	<link rel="stylesheet" href="<%=basePath%>assets/css/xenon-forms.css">
	<link rel="stylesheet" href="<%=basePath%>assets/css/xenon-components.css">
	<link rel="stylesheet" href="<%=basePath%>assets/css/xenon-skins.css">
	<link rel="stylesheet" href="<%=basePath%>assets/css/custom.css">

	<script src="<%=basePath%>assets/js/jquery-1.11.1.min.js"></script>

</head>
<body class="page-body">

	<div class="page-container"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
			
		<div class="sidebar-menu toggle-others fixed">
			
			<div class="sidebar-menu-inner">	
				
				<header class="logo-env">
					<!-- logo -->
					<div class="logo">
						<a href="<%=basePath%>manager/toindex" class="logo-expanded">
							<img src="<%=basePath%>assets/images/logo@2x.png" width="80" alt="" />
						</a>
						
						<a href="<%=basePath%>manager/toindex" class="logo-collapsed">
							<img src="<%=basePath%>assets/images/logo-collapsed@2x.png" width="40" alt="" />
						</a>
					</div>
					
					<!-- This will toggle the mobile menu and will be visible only on mobile devices -->
					<div class="mobile-menu-toggle visible-xs">
						<a href="#" data-toggle="user-info-menu">
							<i class="fa-bell-o"></i>
							<span class="badge badge-success">7</span>
						</a>
						
						<a href="#" data-toggle="mobile-menu">
							<i class="fa-bars"></i>
						</a>
					</div>
					
					<!-- This will open the popup with user profile settings, you can use for any purpose, just be creative -->
					<div class="settings-icon">
						<a href="#" data-toggle="settings-pane" data-animate="true">
							<i class="linecons-cog"></i>
						</a>
					</div>
				</header>
				<ul id="main-menu" class="main-menu">
					<li>
						<a href="#">
							<i class="linecons-cog"></i>
							<span class="title">人事档案管理</span>
						</a>
						<ul>
							<li>
								<a href="<%=basePath%>manager/toRuZhiUser">
									<span class="title">职员入职</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toUpdateUser">
									<span class="title">职员转正</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toLookUser">
									<span class="title">职员档案</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toDeleteUser">
									<span class="title">职员离职</span>
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="linecons-note"></i>
							<span class="title">考勤管理</span>
						</a>
						<ul>
							<li>
								<a href="<%=basePath%>manager/toKaoQingUser">
									<span class="title">考勤数据</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toChuChaiUser">
									<span class="title">出差数据</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toXiuJiaUser">
									<span class="title">休假数据</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toAnPaiUser">
									<span class="title">人员安排</span>
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="#">
							<i class="linecons-star"></i>
							<span class="title">薪酬管理</span>
						</a>
						<ul>
							<li>
								<a href="<%=basePath%>manager/toBaoXiaoUser">
								<span class="title">差旅报销</span>
								<span class="label label-success pull-right">${travelcostcount}</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toJiangLiUser">
									<span class="title">员工奖励</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toGeRenUser">
									<span class="title">职员汇总薪酬</span>
								</a>
							</li>
							<li>
								<a href="<%=basePath%>manager/toBuMenUser">
									<span class="title">部门汇总薪酬</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>						
			</div>
		</div>
		<div class="main-content">
					
			<!-- User Info, Notifications and Menu Bar -->
			<nav class="navbar user-info-navbar" role="navigation">
				<!-- Left links for user info navbar -->
				<ul class="user-info-menu left-links list-inline list-unstyled">
					
					<li class="hidden-sm hidden-xs">
						<a href="#" data-toggle="sidebar">
							<i class="fa-bars"></i>
						</a>
					</li>
					
					<li class="dropdown hover-line">
						<a href="#" data-toggle="dropdown">
							<i class="fa-envelope-o"></i>
							<span >${messagesize}</span>
						</a>
						<ul class="dropdown-menu messages">
							<li>
								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
									<c:forEach items='${message}' var="i" begin="0" end='1'>  
				               			<li class="active"><!-- "active" class means message is unread -->
											<a href="#">
												<span class="line">
													<strong>${i.userNumber} - ${i.userName} </strong>
													<span class="light small">- ${i.applTime}</span>
												</span>
												<c:if test="${not empty i.applRemark}">
													<span class="line desc small">
														申请原因：${i.applRemark}
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														申请类别：${i.applType}
													</span>
												</c:if>
												<c:if test="${i.applRemark==''}">
													<span class="line desc small">
														申请原因：暂无
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														申请类别：${i.applType}
													</span>
												</c:if>
												<c:if test="${i.applStatus=='0'}">
													<span style="position:relative;left: 150">
														<button type="button" class="btn btn-success"onclick="sure(${i.userNumber})">同意</button>
														&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger"onclick="refuse(${i.userNumber})">拒绝</button>
													</span>
												</c:if>
													<c:if test="${i.applStatus=='1'}">
													<span style="position:relative;left: 200">
													&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success disabled" >已同意</button>
												
													</span>
												</c:if>
												<c:if test="${i.applStatus=='2'}">
													<span style="position:relative;left: 200">
													&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger disabled" >以拒绝</button>
												</span>
												</c:if>
											</a>
										</li>
			           				</c:forEach>
								</ul>	
							</li>
							<li class="external">
								<a href="javascript:;" onclick="jQuery('#modal-6').modal('show', {backdrop: 'static'});">
									<span >All Messages</span>
									<i class="fa-link-ext"></i>
								</a>
							</li>
						</ul>
					</li>
					
					<li class="dropdown hover-line">
						<a href="#" data-toggle="dropdown">
							<i class="fa-bell-o"></i>
							<span>${infosize} </span>
						</a>
							
						<ul class="dropdown-menu notifications">
							<li class="top">
								<p class="small">
									<a href="#" class="pull-right">Mark all Read</a>
									You have <strong>${infosize}</strong> new notifications.
								</p>
							</li>
							<li>
								<ul class="dropdown-menu-list list-unstyled ps-scrollbar">
									<c:forEach items='${info}' var="i" begin="0" end='1'>  
				               			<li class="active"><!-- "active" class means message is unread -->
											<a href="#">
												<span class="line">
													<strong>${i.userNumber} - ${i.userName} </strong>
													<span class="light small">- ${i.applTime}</span>
												</span>
												<c:if test="${not empty i.applRemark}">
													<span class="line desc small">
														提示信息：${i.applRemark}
													</span>
												</c:if>
												<c:if test="${i.applRemark==''}">
													<span class="line desc small">
														提示信息：暂无
													</span>
												</c:if>
											</a>
										</li>
			           				</c:forEach> 
								</ul>
							</li>
							
							<li class="external">
								<a href="javascript:;" onclick="jQuery('#modal-7').modal('show', {backdrop: 'static'});">
									<span >View all notifications</span>
									<i class="fa-link-ext"></i>
								</a>	
							</li>
						</ul>
					</li>
					
				</ul>
				
				
				<!-- Right links for user info navbar -->
				<ul class="user-info-menu right-links list-inline list-unstyled">
					
					<li class="search-form"><!-- You can add "always-visible" to show make the search input visible -->
						
						<form method="get" action="#">
							<input type="text" name="s" class="form-control search-field" placeholder="Type to search..." />
							
							<button type="submit" class="btn btn-link">
								<i class="linecons-search"></i>
							</button>
						</form>
						
					</li>
					
					<li class="dropdown user-profile">
						<a href="#" data-toggle="dropdown">
							<img src="<%=basePath%>assets/images/user-4.png" alt="user-image" class="img-circle img-inline userpic-32" width="28" />
							<span>
								${manager.managername}
								<i class="fa-angle-down"></i>
							</span>
						</a>
						
						<ul class="dropdown-menu user-profile-menu list-unstyled">
							<li>
								<a href="<%=basePath%>manager/toWorkManager">
									<i class="fa-edit"></i>
									工作计划安排
								</a>
							</li>
							<li>
								<a href="javascript:;" onclick="jQuery('#modal-8').modal('show', {backdrop: 'static'});">
									<i class="fa-user"></i>
									历史足迹
								</a>
							</li>
							<li>
								<a href="#">
									<i class="fa-info"></i>
									帮助引导
								</a>
							</li>
							<li class="last">
								<a href="<%=basePath%>manager/tologin">
									<i class="fa-lock"></i>
									注销
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</nav>
			<div class="page-title">
				<div class="title-env">
					<h1 class="title"><a style="color: green;" href="<%=basePath%>manager/toLookUser">在职</a>/<a href="<%=basePath%>manager/toLLookUser">离职</a>职员档案</h1>
					<p class="description">记载员工的详细信息，方便及时联系员工和查找员工相关信息</p>
				</div>
				<div class="breadcrumb-env">
						<ol class="breadcrumb bc-1">
							<li>
							 	<a href="<%=basePath%>manager/toWorkManager"><i class="fa-home"></i>Home</a>
							</li>
							<li>
								人事档案管理
							</li>
							<li class="active">
								<strong>职员档案</strong>
							</li>
						</ol>
				</div>
			</div>
			<!-- Basic Setup -->
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">在职员工所有信息</h3>
					
					<div class="panel-options">
						<a href="#" data-toggle="panel">
							<span class="collapse-icon">&ndash;</span>
							<span class="expand-icon">+</span>
						</a>
						<a href="#" data-toggle="remove">
							&times;
						</a>
					</div>
				</div>
				<div class="panel-body">
					
					<script type="text/javascript">
					jQuery(document).ready(function($)
					{
						$("#example-1").dataTable({
							aLengthMenu: [
								[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]
							]
						});
					});
					</script>
					
					<table id="example-1" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							 <tr>
								<th>记录条数</th>
								<th>员工工号</th>
								<th>员工姓名</th>
								<th>所属部门</th>
								<th>工作状态</th>
								<th>职务状态</th>
								<th>操作</th>
							</tr>
						</thead>
					
						<tfoot>
							 <tr>
								<th>记录条数</th>
								<th>员工工号</th>
								<th>员工姓名</th>
								<th>所属部门</th>
								<th>工作状态</th>
								<th>职务状态</th>
								<th>操作</th>
							</tr>
						</tfoot>
					
						<tbody >
							<c:forEach items='${lookuserlist}' var="i" varStatus="k">  
				                <tr>  
				                	<td>${k.count}</td> 
				                    <td>${i.userNumber }</td> 
				                    <td>${i.userUsername }</td>
				                    <td>${i.userDpt }-${i.userDptJbn }</td>
				                    <td>${i.userWorktype }</td>
				                    <td>${i.userJobtype }</td>
				                    <td><input type='button' value='更多' onclick="FindUserByUid(${i.userNumber })"></td> 
				                </tr>  
			           		</c:forEach>  
						</tbody>
					</table>
					
				</div>
			</div>
		
		<script type="text/javascript">
			function FindUserByUid(date) {
				$.ajax({
					type : 'post',
					dataType : 'json',
					url : '<%=basePath%>manager/toLookUserByuserId?user_id=' + date,
					success : function(data) {	
						if (data!=null) {
		        			
		        			var unixTimestamp = new Date(data.userWorktime) ;
	     	            	var commonTime = unixTimestamp.getFullYear();
	     	            	var commonTimefull = unixTimestamp.toLocaleString();
	     	            	var myDate = new Date();
	     	            	var mytime=myDate.getFullYear();
	     	            
	     	            	var chayear = mytime-commonTime
	     	            	$("#user_worktime2").val(commonTimefull);
	     	            	$("#user_worktime").val(chayear+"年");
	     	            	
	     	            	var unixTimestamp2 = new Date(data.userBirth) ;
	     	            	var commonTime2 = unixTimestamp2.toLocaleString();
	     	            	$("#user_birth").val(commonTime2);
	     	            	
	     	            	
	     	            	$("#user_phone").val(data.userPhone);
	     	            	$("#user_address").val(data.userAddress);
	     	            	if (data.userDangerphone==null) {
	     	            		$("#user_dangerphone").val("该员工暂未填写");
							}else{
								$("#user_dangerphone").val(data.userDangerphone);
							}
	     	            	
	     	            	$("#user_edu").val(data.userEdu);
	     	            	$("#user_idcard").val(data.userIdcard);
	     	            	if (data.userNikename==null) {
	     	            		$("#user_nichen").val("该员工暂未填写");
							}else{
								$("#user_nichen").val(data.userNikename);
							}
	     	            	jQuery('#modal-9').modal('show', {backdrop: 'static'});
						}
					}
				});
				
			}
		</script>
		<footer class="main-footer sticky footer-type-1">
				
				<div class="footer-inner">
				
					<!-- Add your copyright text here -->
					<div class="footer-text">
						&copy; 2018 
						<strong>酒店人事管理系统</strong> 
						theme by <a >Dengfw&nbsp;&nbsp;&nbsp;&nbsp;</a>
						<a id="showtime"> </a>
					</div>
					
					
					<!-- Go to Top Link, just add rel="go-top" to any link to add this functionality -->
					<div class="go-up">
					
						<a href="#" rel="go-top">
							<i class="fa-angle-up"></i>
						</a>
						<script type="text/javascript">
							window.onload = function() {
								var show = document.getElementById("showtime");
									setInterval(function() {
									var time = new Date();
									   // 程序计时的月从0开始取值后+1
									var m = time.getMonth() + 1;
									var t = time.getFullYear() + " 年 " + m + " 月 "
									+ time.getDate() + " 日  " + time.getHours() + ":"
									  + time.getMinutes() + ":" + time.getSeconds();
									show.innerHTML = t;
									}, 1000);
							 };
						</script>
					</div>
					
				</div>
				
			</footer>
		</div>
	</div>
	
	<div class="modal fade" id="modal-6">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">All Messages(${messagesize})</h4>
				</div>
				
				<div class="modal-body">
					<c:forEach items='${message}' var="i" begin="0">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="field-2" class="control-label">${i.userNumber} - ${i.userName}</label>
								</div>	
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="field-2" class="control-label">- ${i.applTime}</label>
								</div>	
							</div>
						</div>
						<div class="row">
						<div class="col-md-12" >
							<div class="form-group">
								<c:if test="${not empty i.applRemark}">
									<label for="field-2" class="control-label">申请原因&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请类别：${i.applType}</label>
									<textarea class="form-control autogrow" id="field-7" readonly="readonly">${i.applRemark}</textarea>
								</c:if>
								<c:if test="${i.applRemark==''}">
									<label for="field-2" class="control-label" readonly="readonly">申请原因&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;申请类别：${i.applType}</label>
									<textarea class="form-control autogrow" id="field-7" readonly="readonly">暂无</textarea>
								</c:if>
								<c:if test="${i.applStatus=='0'}">
									<span style="position:relative;left: 400">
										<button type="button" class="btn btn-success"onclick="sure(${i.userNumber})">同意</button>
										&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger"onclick="refuse(${i.userNumber})">拒绝</button>
									</span>
								</c:if>
								<c:if test="${i.applStatus=='1'}">
									<span style="position:relative;left: 450">
										&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success disabled" >已同意</button>
										
									</span>
								</c:if>
								<c:if test="${i.applStatus=='2'}">
									<span style="position:relative;left: 450">
										&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger disabled" >以拒绝</button>
										
									</span>
								</c:if>
							</div>	
						</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function sure(date){
			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '<%=basePath%>manager/sureappl?usernumber=' + date,
				error : function(data) {	
					window.location.href='<%=basePath%>manager/toLookUser';
				}
			});
		}
		
		function refuse(date){
			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '<%=basePath%>manager/refuseappl?usernumber=' + date,
				error : function(data) {	
					window.location.href='<%=basePath%>manager/toLookUser';
				}
			});
		}
	</script>
	<div class="modal fade" id="modal-7">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">View all notifications(${infosize})</h4>
				</div>
				
				<div class="modal-body">
					<c:forEach items='${info}' var="i" begin="0">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="field-2" class="control-label">${i.userNumber} - ${i.userName}</label>
								</div>	
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="field-2" class="control-label">- ${i.applTime}</label>
								</div>	
							</div>
						</div>
						<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<c:if test="${not empty i.applRemark}">
									<label for="field-2" class="control-label">提示信息</label>
									<textarea class="form-control autogrow" id="field-7" readonly="readonly">${i.applRemark}</textarea>
								</c:if>
								<c:if test="${i.applRemark==''}">
									<label for="field-2" class="control-label">提示信息</label>
									<textarea class="form-control autogrow" id="field-7" readonly="readonly">暂无</textarea>
								</c:if>
							</div>	
						</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modal-8">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">历史足迹</h4>
				</div>
				
				<div class="modal-body">
					<c:forEach items='${history}' var="i" begin="0">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="field-2" class="control-label">${i.managerName}</label>
								</div>	
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="field-2" class="control-label">- ${i.operatingTime}</label>
								</div>	
							</div>
						</div>
						<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<c:if test="${not empty i.operatingType}">
									<label for="field-2" class="control-label">提示信息</label>
									<textarea class="form-control autogrow" id="field-8" readonly="readonly">${i.operatingType}</textarea>
								</c:if>
							</div>	
						</div>
						</div>
					</c:forEach>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>	
	
	<!-- Modal 9 (Long Modal)-->
	<div class="modal fade" id="modal-9">
		<div class="modal-dialog">
			<div class="modal-content">
				
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">职员拓展信息</h4>
				</div>
				
				<div class="modal-body">
					<div class="row">
						<div class="col-md-6">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="field-1" class="control-label">昵称</label>
										
										<input type="text" class="form-control" id="user_nichen" disabled="disabled">
									</div>	
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="field-2" class="control-label">身份证号码</label>
								
										<input type="text" class="form-control" id="user_idcard" disabled="disabled">
									</div>	
						
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<center>
									<img src="<%=basePath%>assets/images/user-4.png" alt="员工图片" class="img-circle img-inline userpic-32" width="100" />
								</center>
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="field-1" class="control-label">手机号码</label>
										
								<input type="text" class="form-control" id="user_phone" disabled="disabled">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="field-2" class="control-label">生日</label>
								
								<input type="text" class="form-control" id="user_birth" disabled="disabled">
							</div>	
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="field-4" class="control-label">第二联系人电话</label>
								
								<input type="text" class="form-control" id="user_dangerphone" disabled="disabled">
							</div>	
							
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="field-4" class="control-label">家庭地址</label>
								
								<input type="text" class="form-control" id="user_address" disabled="disabled">
							</div>	
							
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="field-4" class="control-label">学历</label>
								
								<input type="text" class="form-control" id="user_edu" disabled="disabled">
							</div>	
							
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="field-4" class="control-label">入职时间</label>
								
								<input type="text" class="form-control" id="user_worktime2" disabled="disabled">
							</div>	
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="field-4" class="control-label">工龄</label>
								
								<input type="text" class="form-control" id="user_worktime" disabled="disabled">
							</div>	
						</div>
						
					</div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Imported styles on this page -->
	<link rel="stylesheet" href="<%=basePath%>assets/js/datatables/dataTables.bootstrap.css">
	<link rel="stylesheet" href="<%=basePath%>assets/js/fullcalendar/fullcalendar.min.css">
	<!-- Bottom Scripts -->
	<script src="<%=basePath%>assets/js/bootstrap.min.js"></script>
	<script src="<%=basePath%>assets/js/TweenMax.min.js"></script>
	<script src="<%=basePath%>assets/js/resizeable.js"></script>
	<script src="<%=basePath%>assets/js/joinable.js"></script>
	<script src="<%=basePath%>assets/js/xenon-api.js"></script>
	<script src="<%=basePath%>assets/js/xenon-toggles.js"></script>
	<script src="<%=basePath%>assets/js/datatables/js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>assets/js/moment.min.js"></script>


	<!-- Imported scripts on this page -->
	<script src="<%=basePath%>assets/js/datatables/dataTables.bootstrap.js"></script>
	<script src="<%=basePath%>assets/js/datatables/yadcf/jquery.dataTables.yadcf.js"></script>
	<script src="<%=basePath%>assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
	<script src="<%=basePath%>assets/js/fullcalendar/fullcalendar.min.js"></script>
	<script src="<%=basePath%>assets/js/jquery-ui/jquery-ui.min.js"></script>
	<script src="<%=basePath%>assets/js/inputmask/jquery.inputmask.bundle.js"></script>
	<script src="<%=basePath%>assets/js/tocify/jquery.tocify.min.js"></script>

	<!-- JavaScripts initializations and stuff -->
	<script src="<%=basePath%>assets/js/xenon-custom.js"></script>
	
</body>
</html>