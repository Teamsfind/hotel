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
		var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
		var ajaxmockjax = 0;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
		//默认账号密码
		
		var truelogin = "201710000";
		var truepwd = "123456";
		
		var CodeVal = 0;
	    Code();
	    function Code() {
			if(canGetCookie == 1){
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			}else{
				showCheck(createCode(""));
			}
	    }
	    function showCheck(a) {
			CodeVal = a;
	        var c = document.getElementById("myCanvas");
	        var ctx = c.getContext("2d");
	        ctx.clearRect(0, 0, 1000, 1000);
	        ctx.font = "80px 'Hiragino Sans GB'";
	        ctx.fillStyle = "#E8DFE8";
	        ctx.fillText(a, 0, 100);
	    }
	    $(document).keypress(function (e) {
	        // 回车键事件  
	        if (e.which == 13) {
	            $('input[type="button"]').click();
	        }
	    });
	    //粒子背景特效
	    $('body').particleground({
	        dotColor: '#E8DFE8',
	        lineColor: '#133b88'
	    });
	    $('input[name="pwd"]').focus(function () {
	        $(this).attr('type', 'password');
	    });
	    $('input[type="text"]').focus(function () {
	        $(this).prev().animate({ 'opacity': '1' }, 200);
	    });
	    $('input[type="text"],input[type="password"]').blur(function () {
	        $(this).prev().animate({ 'opacity': '.5' }, 200);
	    });
	    $('input[name="login"],input[name="pwd"]').keyup(function () {
	        var Len = $(this).val().length;
	        if (!$(this).val() == '' && Len >= 5) {
	            $(this).next().animate({
	                'opacity': '1',
	                'right': '30'
	            }, 200);
	        } else {
	            $(this).next().animate({
	                'opacity': '0',
	                'right': '20'
	            }, 200);
	        }
	    });
	    var open = 0;
	    layui.use('layer', function () {
			var msgalert = '默认账号:' + truelogin + '<br/> 默认密码:' + truepwd;
    		var index = layer.alert(msgalert, { icon: 6, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });  
			layer.style(index, {
				color: '#777'
			}); 
	        //非空验证
	        $('input[type="button"]').click(function () {
	            var login = $('input[name="login"]').val();
	            var pwd = $('input[name="pwd"]').val();
	            var code = $('input[name="code"]').val();
	            if (login == '') {
	                ErroAlert('请输入您的账号');
	            } else if (pwd == '') {
	                ErroAlert('请输入密码');
	            } else if (code == '' || code.length != 4) {
	                ErroAlert('输入验证码');
	            } else if(code.toUpperCase() != CodeVal.toUpperCase()){
	            	ErroAlert('验证码输入错误');
	            } else {
	                //认证中..
	                fullscreen();
	                $('.login').addClass('test'); //倾斜特效
	                setTimeout(function () {
	                    $('.login').addClass('testtwo'); //平移特效
	                }, 300);
	                setTimeout(function () {
	                    $('.authent').show().animate({ right: -320 }, {
	                        easing: 'easeOutQuint',
	                        duration: 600,
	                        queue: false
	                    });
	                    $('.authent').animate({ opacity: 1 }, {
	                        duration: 200,
	                        queue: false
	                    }).addClass('visible');
	                }, 500);

	                //登陆
	                var JsonData = { login: login, pwd: pwd};
					//此处做为ajax内部判断
					var url = '<%=basePath%>manager/tochecklogin';
					
	                AjaxPost(url, JsonData,
	                                function (data) {
	                                    //ajax返回 
	                                    //认证完成
	                                    setTimeout(function () {
	                                        $('.authent').show().animate({ right: 90 }, {
	                                            easing: 'easeOutQuint',
	                                            duration: 600,
	                                            queue: false
	                                        });
	                                        $('.authent').animate({ opacity: 0 }, {
	                                            duration: 200,
	                                            queue: false
	                                        }).addClass('visible');
	                                        $('.login').removeClass('testtwo'); //平移特效
	                                    }, 2000);
	                                    setTimeout(function () {
	                                        $('.authent').hide();
	                                        $('.login').removeClass('test');
	                                        	var data2 = JSON.stringify(data);
	                                        if (data2 != -1) {
	                                        	
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
		                                       var index2 = layer.alert('登陆成功<br /><br />欢迎回来', { icon: 6, time: 4000, offset: 't', closeBtn: 0, title: '友情提示', btn: [], anim: 2, shade: 0 });  
													layer.style(index2, {
														color: '#777'
													}); 
													$('.login div').fadeOut(100);
		                                            $('.success').fadeIn(1000);
		                                            $('.success').html(tableContent);
												//跳转操作
	                                        } else {
	                                        	ErroAlert("账号名或密码或验证码有误");
	                                        }
	                                    }, 2400);
	                                })
	            }
	        })
	    })
	    var fullscreen = function () {
	        elem = document.body;
	        if (elem.webkitRequestFullScreen) {
	            elem.webkitRequestFullScreen();
	        } else if (elem.mozRequestFullScreen) {
	            elem.mozRequestFullScreen();
	        } else if (elem.requestFullScreen) {
	            elem.requestFullscreen();
	        } else {
	            //浏览器不支持全屏API或已被禁用  
	        }
	    }  
	    function clickImg() {
	    	window.location.href='<%=basePath%>manager/toWorkManager';
		}
	    function clickImg2() {
	    	ErroAlert("后续功能开发中......");
		}
		if(ajaxmockjax == 1){
			$.mockjax({  
				url: 'Ajax/Login',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"ok","Text":"登陆成功<br /><br />欢迎回来"}  
			}); 
			$.mockjax({  
				url: 'Ajax/LoginFalse',  
				status: 200,  
				responseTime: 50,          
				responseText: {"Status":"Erro","Erro":"账号名或密码或验证码有误"}
			});   
		}
    </script>
</body>
</html>