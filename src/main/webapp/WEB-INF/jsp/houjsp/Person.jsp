<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
     <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>酒店人事管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/nav.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
    <link href="<%=basePath %>houCss/css/table/demo_page.css" rel="stylesheet" type="text/css" />
    <!-- BEGIN: load jquery -->
    <script src="<%=basePath %>houCss/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.mouse.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.sortable.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/table/jquery.dataTables.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <script src="<%=basePath %>houCss/js/setup.js" type="text/javascript"></script>
    
    <style type="text/css">
   table{  
        border-bottom:1px solid silver;  
        border-right:1px solid silver;  
        width:100%;  
    }  
      
    .bordered {  
        border: solid #ccc 1px;  
        -moz-border-radius: 6px;  
        -webkit-border-radius: 6px;  
        border-radius: 6px;  
        -webkit-box-shadow: 0 1px 1px #ccc;   
        -moz-box-shadow: 0 1px 1px #ccc;   
        box-shadow: 0 1px 1px #ccc;           
    }  
      
    .bordered tr:hover {  
        background: #fbf8e9;  
        -o-transition: all 0.1s ease-in-out;  
        -webkit-transition: all 0.1s ease-in-out;  
        -moz-transition: all 0.1s ease-in-out;  
        -ms-transition: all 0.1s ease-in-out;  
        transition: all 0.1s ease-in-out;       
    }      
          
    .bordered td, .bordered th {  
        border-left: 1px solid #ccc;  
        border-top: 1px solid #ccc;  
        font-size:22px;  
    }  
      
    .bordered th {  
        background-color: #dce9f9;  
        background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));  
        background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);  
        background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);  
        background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);  
        background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);  
        background-image:         linear-gradient(top, #ebf3fc, #dce9f9);  
        -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;   
        -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;    
        box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;          
        border-top: none;  
        text-shadow: 0 1px 0 rgba(255,255,255,.5);   
    }  
      
    .bordered td:first-child, .bordered th:first-child {  
        border-left: none;  
    }  
      
    .bordered th:first-child {  
        -moz-border-radius: 6px 0 0 0;  
        -webkit-border-radius: 6px 0 0 0;  
        border-radius: 6px 0 0 0;  
    }  
      
    .bordered th:last-child {  
        -moz-border-radius: 0 6px 0 0;  
        -webkit-border-radius: 0 6px 0 0;  
        border-radius: 0 6px 0 0;  
    }  
      
    .bordered th:only-child{  
        -moz-border-radius: 6px 6px 0 0;  
        -webkit-border-radius: 6px 6px 0 0;  
        border-radius: 6px 6px 0 0;  
    }  
      
    .bordered tr:last-child td:first-child {  
        -moz-border-radius: 0 0 0 6px;  
        -webkit-border-radius: 0 0 0 6px;  
        border-radius: 0 0 0 6px;  
    }  
      
    .bordered tr:last-child td:last-child {  
        -moz-border-radius: 0 0 6px 0;  
        -webkit-border-radius: 0 0 6px 0;  
        border-radius: 0 0 6px 0;  
    }  
    .bordered td{  
        text-align:center;  
        padding-left:5px;  
    }  
    .td_right{  
        text-align:right;  
        padding-right:5px;  
    }
    
   </style>
   <script type="text/javascript">  
        $(document).ready(function () {
            setupLeftMenu();

            $('.datatable').dataTable();
			setSidebarHeight();
		
			setInterval("show()",3500);
        });
     
    </script>
</head>
<body>
    <div class="container_12">
         <div class="grid_12 header-repeat">
            <div id="branding">
                <div class="floatleft">
                    <img src="<%=basePath %>houCss/img/logo.png" alt="Logo" /></div>
                <div class="floatright">
                    <div class="floatleft">
                        <img src="<%=basePath %>houCss/img/img-profile.jpg" alt="Profile Pic" /></div>
                    <div class="floatleft marginleft10">
                        <ul class="inline-ul floatleft">
                            <li>Hello Admin</li>
                            <li><a href="<%=basePath %>manager/tologin">Logout</a></li>
                        </ul>
                        <br />
                        <span class="small grey">Last Login: ${manager.managerlogintime} </span>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="grid_12">
            <ul class="nav main">
            	<li><a href="<%=basePath %>manager/tomain"><span>首页</span></a> </li>
                <li><a href="<%=basePath %>manager/toruzhi"><span>人事档案管理</span></a> </li>        
                <li><a href="<%=basePath %>manager/tokaoqing"><span>考勤管理</span></a> </li>  
                <li><a href="<%=basePath %>manager/toxinchou"><span>薪酬管理</span></a> </li>         
            </ul>
        </div>
        <div class="clear">
        </div>
           <div class="grid_2">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                        <li><a class="menuitem">首页</a>
                            <ul class="submenu">
                                <li><a href="<%=basePath %>manager/tomain">今日消息</a> </li>
                                <li><a href="<%=basePath %>manager/tohistorymain">历史消息</a> </li>	
                           	<li><a href="<%=basePath %>manager/toPerson">个人中心</a> </li>
                            </ul>
                        </li>                       
                    </ul>
                </div>
            </div>
        </div>
     <div class="grid_10">
            <div class="box round first grid" >
                <h2>
                    	个人中心
                </h2>
               
                </br>
    			<div>
                   <table class="bordered" cellspacing="0" border="0">
						<tr>
							<td colspan="10" style="text-align: left">基本信息:&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: red;font-size: 6px;font-family: '宋体'" >只能修改手机号码，其它修改需要数据库管理员修改</a></td>
						</tr>
						<tr>
							<td colspan="1">&nbsp;&nbsp;工号:</td>
							<td colspan="4" id="shuru">&nbsp;&nbsp;${sessionScope.manager.managerid}</td>
							<td colspan="1">&nbsp;&nbsp;姓名:</td>
							<td colspan="4" id="shuru">&nbsp;&nbsp;${sessionScope.manager.managername}</td>
						</tr>
						<tr>
							<td colspan="1">&nbsp;&nbsp;手机号码:</td>
							<td colspan="9">&nbsp;&nbsp;<input type="text" value="${sessionScope.phone}" onblur="upPhone()" style="font-size: 22px" id="newphone"></td>
						</tr>
						<tr>
							<td colspan="1">&nbsp;&nbsp;上次登录时间:</td>
							<td colspan="9" id="shuru">&nbsp;&nbsp;${sessionScope.manager.managerlogintime}</td>
						</tr>
					</table>           
                </div>
                
                <div>
                   <table class="bordered" cellspacing="0" border="0">
						<tr>
							<td colspan="10" style="text-align: left">密码修改:</td>
						</tr>
						<tr>
							<td colspan="1">&nbsp;&nbsp;原密码:</td>
							<td colspan="9">&nbsp;<input type="password" style="height:22px;width:449px" id="oldpassword" onblur="checkoldpassword()">&nbsp;&nbsp;&nbsp;&nbsp;<a id="tipoldpassword"></td>
							
						</tr>
						<tr>
							<td colspan="1">&nbsp;&nbsp;新密码:</td>
							<td colspan="9"><input type="password" style="height:22px;width:449px" id="newpassword1">&nbsp;&nbsp;&nbsp;&nbsp;<a id="tipoldpassword"></td>
						
						</tr>
						<tr>
							<td colspan="1">&nbsp;&nbsp;新密码确认:</td>
							<td colspan="9">&nbsp;<input type="password" style="height:22px;width:449px" id="newpassword2" onblur="checknewpassword()">&nbsp;&nbsp;&nbsp;&nbsp;<a id="tipnewpassword"></td>
						</tr>
						<tr>
							<td colspan="10"> <center style="font-size: 15px;"><input type="button" value="确认修改" class="Search" style="background:url(<%=basePath %>houCss/img/buttonbg.png) repeat-x;width:96px; height:35px;" " onclick="uppassword()"/>
   							</td>
						</tr>
					</table>           
                </div>
            </div>      
           </div>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="site_info">
        <p>
            	酒店人事管理系统
        </p>
    </div>
    
</body>
<script type="text/javascript">
	function checkoldpassword() {
	
		var oldpassword = $("#oldpassword").val();
		
			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '<%=basePath%>manager/checkoldpassword?managerpassword=' + oldpassword,
				success : function(data) {	
					if (data == 1) {
												
						$("#tipoldpassword").css('color','green');
						
						$("#tipoldpassword").text("✔  密码认证通过");
					}else{
						
						$("#tipoldpassword").css('color','red');
						
						$("#tipoldpassword").text("× 原密码不正确");
					}
				}
			});
	}
	
	function checknewpassword() {
		var newpassword1 = $("#newpassword1").val();
		
		var newpassword2 = $("#newpassword2").val();
	
		if (newpassword1==newpassword2) {
			
			$("#tipnewpassword").css('color','green');
			
			$("#tipnewpassword").text("✔  密码可以使用");
			
		}else{
			
			$("#tipnewpassword").css('color','red');
			
			$("#tipnewpassword").text("× 两次输入密码不一样");
		}
	}
	
	function upPhone() {
			var newphone = $("#newphone").val();
		
			$.ajax({
				type : 'post',
				dataType : 'json',
				url : '<%=basePath%>manager/upPhone?newphone=' + newphone,
				success : function(data) {	
					
					if (data==1) {
						window.location.href='<%=basePath%>manager/toPerson';	
					}
				}
			});
	}
	function uppassword() {
		var newpassword2 = $("#newpassword2").val();
	
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '<%=basePath%>manager/upPassword?newpassword=' + newpassword2,
			success : function(data) {	
				
				if (data==1) {
					alert("修改成功");
					window.location.href='<%=basePath%>manager/toPerson';	
				}
			}
		});
	}
	function show(){
		  $("#tipnewpassword").text("");
		  $("#tipoldpassword").text("");
	  }
</script>
</html>
