<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 
	<title>登录界面</title>
    <link href="<%=basePath %>houcss/logincss/default.css" rel="stylesheet" type="text/css" />
	<!--必要样式-->
    <link href="<%=basePath %>houcss/logincss/styles.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath %>houcss/logincss/demo.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath %>houcss/logincss/loaders.css" rel="stylesheet" type="text/css" />
    		<style type="text/css">
		.title2 {
		  position: absolute;
		  left: 30px;
		  top: 0px;
		}
		
		.title3 {
		  position: absolute;
		  left: 30px;
		  top: 380px;
		}
		
		.addImg1 {
			width: 80px;
			height: 80px;
		  position: absolute;
		  left: 70px;
		  top: 100px;
		}
		.addImg2 {
			width: 80px;
			height: 80px;
		  position: absolute;
		  left: 180px;
		  top: 100px;
		}
		.alttitle {
		 position:absolute;
		  left:20px;
		  top:200px;
		  color: green;
		}
		</style>
</head>
<body>
	<div class='login'>
	  <div class='login_title'>
	    <span>管理员登录</span>
	  </div>
	  <div class='login_fields'>
	    <div class='login_fields__user'>
	      <div class='icon'>
	        <img alt="" src='<%=basePath %>houcss/loginimg/user_icon_copy.png'>
	      </div>
	      <input name="login" placeholder='用户名' maxlength="16" type='text' autocomplete="off" value="201710000"/>
	        <div class='validation'>
	          <img alt="" src='<%=basePath %>houcss/loginimg/tick.png'>
	        </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=basePath %>houcss/loginimg/lock_icon_copy.png'>
	      </div>
	      <input name="pwd" placeholder='密码' maxlength="16" type='text' autocomplete="off">
	      <div class='validation'>
	        <img alt="" src='<%=basePath %>houcss/loginimg/tick.png'>
	      </div>
	    </div>
	    <div class='login_fields__password'>
	      <div class='icon'>
	        <img alt="" src='<%=basePath %>houcss/loginimg/key.png'>
	      </div>
	      <input name="code" placeholder='验证码' maxlength="4" type='text' name="ValidateNum" autocomplete="off">
	      <div class='validation' style="opacity: 1; right: -5px;top: -3px;">
          <canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
	      </div>
	    </div>
	    <div class='login_fields__submit'>
	      <input type='button' value='登录'>
	    </div>
	  </div>
	  <div class='success'>
	  </div>
	  <div class='disclaimer'>
	    <p>欢迎登录酒店人事管理系统</p>
	  </div>
	</div>
	<div class='authent'>
	  <div class="loader" style="height: 44px;width: 44px;margin-left: 28px;">
        <div class="loader-inner ball-clip-rotate-multiple">
            <div></div>
            <div></div>
            <div></div>
        </div>
        </div>
	  <p>认证中...</p>
	</div>
	<div class="OverWindows"></div>
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<script type="text/javascript" src="<%=basePath %>houcss/loginjs/jquery-ui.min.js"></script>
	 <script src="<%=basePath %>layui/layui.js" type="text/javascript"></script>
    <script src="<%=basePath %>houcss/loginjs/Particleground.js" type="text/javascript"></script>
    <script src="<%=basePath %>houcss/loginjs/Treatment.js" type="text/javascript"></script>
    <script src="<%=basePath %>houcss/loginjs/jquery.mockjax.js" type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($)
			{
				layui.use('layer', function () {
				var tableContent = "";
		          tableContent += '<div class="article">';
		          tableContent += ' <div class="title2">';
		          tableContent += ' <h2>欢迎  ${manager.managername} 登录<br></h2>';
		          tableContent += ' <h6>&nbsp;&nbsp;请选择以下系统进行登录</h6>';
		          tableContent += ' </div>';
		          tableContent += ' <div class="item">';
		          tableContent += ' <img class="icon addImg1" onclick="clickImg(this);" src="<%=basePath%>assets/images/test.png" title="酒店人事管理后台系统"';
		          tableContent += ' </div>';
		          tableContent += ' <div class="item">';
		          tableContent += ' <img class="icon addImg2" onclick="clickImg2(this);" src="<%=basePath%>assets/images/addImg.png" title="等待开发"';
		          tableContent += ' </div>';
		          tableContent += ' <div class="title3">';
		          tableContent += ' <p>欢迎登录酒店人事管理系统&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=basePath%>manager/tomain">退出</a></p>';
		          tableContent += ' </div>';
		          tableContent += ' </div>';
		          //登录成功
				$('.login div').fadeOut(100);
			    $('.success').fadeIn(1000);
			     $('.success').html(tableContent);
				})
			});
	    function clickImg() {
	    	window.location.href='<%=basePath%>manager/toWorkManager';
		}
	    function clickImg2() {
	    	ErroAlert("后续功能开发中......");
		}
		
    </script>
</body>
</html>