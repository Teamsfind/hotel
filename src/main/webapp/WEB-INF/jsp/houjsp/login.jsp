<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>管理员登录页面</title>
<script type="text/javascript" src="<%=basePath %>houCss2/js/plugins/jquery-1.7.min.js"></script>
<link rel="stylesheet" href="<%=basePath %>houCss2/css/style.default.css" type="text/css" />
<!-- 

<script type="text/javascript" src="<%=basePath %>houCss2/js/custom/index.js"></script>
<script type="text/javascript" src="<%=basePath %>houCss2/js/custom/general.js"></script>
 -->
<script type="text/javascript" src="<%=basePath %>houCss2/js/plugins/jquery.cookie.js"></script>
<script type="text/javascript" src="<%=basePath %>houCss2/js/plugins/jquery.uniform.min.js"></script>
<script type="text/javascript" src="<%=basePath %>houCss2/js/plugins/jquery-ui-1.8.16.custom.min.js"></script>
</head>
<body class="loginpage" style="background-color:#1c77ac; background-image:url(<%=basePath %>houCss/img/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
	<div class="loginbox">
    	<div class="loginboxinner">
        	
            <div class="logo">
            	<h1 class="logo">酒店人事管理系统</span></h1>
				<span class="slogan" style="color: red">管理员登入</span>
            </div><!--logo-->
            <br clear="all" /><br />
                <div class="username">
                	<div class="usernameinner">
                    	<input type="text" name="username" id="username" placeholder="username"/>
                    </div>
                </div>
                
                <div class="password">
                	<div class="passwordinner">
                    	<input type="password" name="password" id="password" placeholder="password"/>
                    </div>
                </div>
                
                <button id="login2" onclick="login();">登录</button>
                
               
            
        </div><!--loginboxinner-->
    </div><!--loginbox-->

</body>
<script type="text/javascript">
		function login() {
			var username = $("input[name='username']").val();
			var password = $("#password").val();
			if (username == "" || password == "") {
				alert("账号或密码不能为空");
			}else {
				$.ajax({
					type : 'post',
					dataType : 'json',
					url : '<%=basePath%>manager/checklogin?managerid=' + username + '&managerpassword=' + password,
					success : function(data) {	
						if (data != -1) {
							alert("成功登陆");								
							window.location.href='<%=basePath%>manager/tomain'; 
						}else{
							alert("账号或密码错误！");
						}
					}
				});
			}

		}

</script>
</html>