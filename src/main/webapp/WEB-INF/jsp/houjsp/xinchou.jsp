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
   <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/nav.css" media="screen" />
    
    <!-- BEGIN: load jquery -->
    <script src="<%=basePath %>houCss/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!-- BEGIN: load jqplot -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>houCss/css/jquery.jqplot.min.css" />
    <!--[if lt IE 9]><script language="javascript" type="text/javascript" src="js/jqPlot/excanvas.min.js"></script><![endif]-->
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.canvasAxisLabelRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.barRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.highlighter.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.pointLabels.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.donutRenderer.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jqPlot/plugins/jqplot.bubbleRenderer.min.js"></script>
    <!-- END: load jqplot -->
    <script src="<%=basePath %>houCss/js/setup.js" type="text/javascript"></script>
  <script type="text/javascript">

        $(document).ready(function () {
            setupLeftMenu();
            
          			setSidebarHeight();

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
                        <li><a class="menuitem">薪酬管理</a>
                            <ul class="submenu">
                                <li><a>各部门基础薪酬表</a> </li>	
                           		<li><a>历史薪酬</a> </li>
                            </ul>
                        </li>                       
                    </ul>
                </div>
            </div>
        </div>
        <div class="grid_10">
            <div class="box round first">
                <h2>当月薪酬</h2>
                <div class="block">
	  				<table class="data display datatable" id="example">
						<thead>
							<tr>
								<th>Rendering engine</th>
								<th>Browser</th>
								<th>Platform(s)</th>
								<th>Engine version</th>
								<th>CSS grade</th>
							</tr>
						 </thead>
						 <tbody>
						 
						 </tbody>
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
</html>
