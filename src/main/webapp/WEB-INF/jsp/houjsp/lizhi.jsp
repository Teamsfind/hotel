
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
    
    <!-- BEGIN: load jquery -->
    <script src="<%=basePath %>houCss/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.core.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.effects.slide.min.js" type="text/javascript"></script>
    <!-- END: load jquery -->
    <!--jQuery Date Picker-->
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.datepicker.min.js" type="text/javascript"></script>
    <script src="<%=basePath %>houCss/js/jquery-ui/jquery.ui.progressbar.min.js" type="text/javascript"></script>
    
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
            setDatePicker('date-picker');
          	setSidebarHeight();
        });
        
      //setup DatePicker
        function setDatePicker(containerElement) {
            var datePicker = $('#' + containerElement);
            datePicker.datepicker({
                showOn: "button",
                buttonImage: "<%=basePath %>houCss/img/calendar.gif",
                buttonImageOnly: true
            });
        }
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
            	<li class="ic-dashboard"><a href="<%=basePath %>manager/tomain" ><span>首页</span></a> </li>
                <li class="ic-form-style"><a href="<%=basePath %>manager/toruzhi" ><span>人事档案管理</span></a> </li>        
                <li class="ic-charts"><a href="<%=basePath %>manager/tokaoqing" ><span>考勤管理</span></a> </li>  	
                <li class="ic-grid-tables"><a href="<%=basePath %>manager/toxinchou" ><span>薪酬管理</span></a> </li>         
            </ul>
        </div>
        <div class="clear">
        </div>
        <div class="grid_2">
            <div class="box sidemenu">
                <div class="block" id="section-menu">
                    <ul class="section menu">
                        <li><a class="menuitem">人事档案管理</a>
                            <ul class="submenu">
                                <li><a href="<%=basePath %>manager/toruzhi">职员入职</a> </li>	
                           		<li><a href="<%=basePath %>manager/touserXinxi">职员信息</a> </li>
                           		<li><a href="<%=basePath %>manager/tolizhi">职员离职</a> </li>
                            </ul>
                        </li>                       
                    </ul>
                </div>
            </div>
        </div>
        <div class="grid_10" style="font-size: 17px;font-family: "宋体"">
            <div class="box round first">
                <h2>职员离职</h2>
                <div class="block">
                	    <table class="form">
	                    	<tr>
	                         	<td>
                               		 <label>员工工号</label>
                            	</td>
                           		 <td>
                             		<input type="text" id="user_id" name="user_id" onblur="productUser()"/>
                            	</td>
                            	<td>
                            	 <span class="error" id="idCarderror"></span>
                            	</td>
	                       </tr>
	                        <tr>
	                            <td>
	                                <label> 员工姓名:</label>
	                            </td>
	                            <td>
	                                <input type="text" id="username" class="medium" name="username" readonly="readonly"/>
	                            </td>
	                        </tr>
	                        <tr>
	                         	<td>
                               		 <label>性别</label>
                            	</td>
                           		 <td>
	                                <input type="radio" name="rd1" readonly="readonly"/>男&nbsp;&nbsp;
	                                <input type="radio" name="rd1" readonly="readonly"/>女
                            	</td>
	                        </tr>
	                        <tr>
	                            <td>
	                                <label>部门职位</label>
	                            </td>
	                            <td>
	                                <select id="select1" name="select1" id="select1">
	                                    <option value="10" >采购部</option>
	                                    <option value="11">市场部</option>
	                                    <option value="12">后勤部</option>
	                                    <option value="13">财务部</option>
	                                    <option value="14">生产部</option>
	                                </select>
	                                &nbsp;&nbsp;&nbsp;&nbsp;
		                            <select id="select2" name="select2" id="select2">
		                                <option value="普通员工">普通员工</option>
		                                <option value="组长">组长</option>
		                                <option value="部门经理">部门经理</option>
		                            </select>
	                           </td>
                        	</tr>
	                       <tr>
	                         	<td>
                               		 <label>手机号码</label>
                            	</td>
                           		<td>
                             		<input type="text" id="user_phone" name="user_phone" class="medium"  readonly="readonly"/>
                             		
	                            </td>
	                       </tr>
	                       <tr>
	                       		<td><label>家庭地址</label>
	                       		</td>
	                       		<td>
									<input type="text" class="medium" name="detl" id="detl" readonly="readonly">
								</td>
	                       </tr>
	                        <tr>
	                       		<td><label>在职状态</label>
	                       		</td>
	                       		<td>
									<input type="text" class="medium" name="userJobtype" id="userJobtype" readonly="readonly">
								</td>
	                       </tr>
	                        <tr>
	                         	<td>
                               		 <label>离职材料是否交完</label>
                            	</td>
                           		 <td>
	                                <input type="radio" name="rd2" value="1"/>是&nbsp;&nbsp;
	                                <input type="radio" name="rd2" value="2" checked />否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                <span class="error" id="sure">!&nbsp;&nbsp;请确认该员工离职材料是否提交完</span>
                            	</td>
	                        </tr>
	                    </table>
	                    </br>
	                    <div class="tools">
    						<center style="font-size: 15px;"><input type="submit" value="确定" style="background:url(<%=basePath %>houCss/img/buttonbg.png) repeat-x;width:96px; height:35px;" onclick="check()"/>
   								<span class="error" id="subeerror"></span>
   							</center>
   						</div>
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
	
	function productUser() {
		$("#idCarderror").html(""); 
		var usernumber = $("#user_id").val();
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '<%=basePath%>manager/selectuser?usernumber=' + usernumber,
			success : function(data) {	
				if (data != null) {
					$("#username").val(data.userUsername);
					
					var sex = data.userSex;
					if (sex==1) {
						$("input=[name='rd1']").eq(0).attr("checked",true);
					}else if(sex==2){
						$("input=[name='rd1']").eq(1).attr("checked",true);
					}
					
					var userDptnamae = data.userDpt;
					
					if (userDptnamae==10) {
						 $("#select1").val(10);
						
					}else if(userDptnamae==11){
						$("#select1").val(11);
						
					}else if(userDptnamae==12){
						$("#select1").val(12);
						
					}else if(userDptnamae==13){
						$("#select1").val(13);
						
					}else if(userDptnamae==14){
						$("#select1").val(14);
					}
					
					var userDptJbn = data.userDptJbn;
					
					if (userDptJbn=="普通员工") {
						$("#select2").val("普通员工");
					}else if (userDptJbn=="组长") {
						$("#select2").val("组长");
					}else{
						$("#select2").val("部门经理");
					}
					
					$("#user_phone").val(data.userPhone);
					$("#detl").val(data.userAddress);
					
					var userJobtype = data.userJobtype;
					if (userJobtype==1) {
						$("#userJobtype").val("实习期");
					}else if(userJobtype==2){
						$("#userJobtype").val("试用期");
					}else if(userJobtype==3){
						$("#userJobtype").val("正式员工");
					}else{
						$("#userJobtype").val("已离职");
					}
				}else {
					$("#idCarderror").html("× 该员工不存在，请重新填写"); 
				} 
			}
			
		});
	}
	
	function  check() {
		var usernumber = $("#user_id").val();
		var userJobtype = $("#userJobtype").val();
		var sure = $("input[name='rd2']:checked").val();
			if (userJobtype!="已离职") {
				if (usernumber!="") {
					if (sure==1) {
						
						$.ajax({
							type : 'post',
							dataType : 'json',
							url : '<%=basePath%>manager/deletetuser?usernumber=' + usernumber,
							success : function(data) {	
								if (data==1) {
									alert("您好\n员工离职办理成功");
								}
							}
						});
					}else {
						alert("您好\n员工离职材料未交完，不能办理离职");
					}
				}else {
						alert("您好\n请输入员工工号，查询员工相关信息");
				}
			}else{
				alert("您好\该员工已经离职，请办理其它业务");
			}
	}
	
</script>
</html>
