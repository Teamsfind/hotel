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

        });
        
        $(function(){
            
      	  $.ajax({
        		type : 'post',
        		dataType : 'json',
        		url : '<%=basePath%>manager/selectAlluser?text=0',
        		success : function(data) {	
        			var $tbody = $("#appl");
        			$tbody.empty();  
        	            for (var j = 0; j < data.length; j++) { 
        	            	
        	            	var unixTimestamp = new Date(data[j].userWorktime) ;
        	            	var commonTime = unixTimestamp.toLocaleString();
        	            	
        	            	var jbnumber = data[j].userDpt;
        	            	var jbnumber2;
        	            	if (jbnumber==10) {
        	            		jbnumber2="采购部";
							}else if (jbnumber==11) {
								jbnumber2="市场部";
							}else if (jbnumber==12) {
								jbnumber2="后勤部";
							}else if (jbnumber==13) {
								jbnumber2="财务部";
							}else{
								jbnumber2="生产部";
							}
        	            	
        	            	var sex1 = data[j].userSex;
        	            	var sex2 = "男"
        	            	if (sex1==2) {
        	            		sex2 = "女";
							}
        	            	
        	            	var  worktype = data[j].userWorktype;
        	            	var worktype2 = "缺勤";
        	            	if (worktype==1) {
        	            		worktype2 = "正常";
							}else if(worktype==2){
								worktype2 = "休假";
							}else if(worktype==3){
								worktype2 = "出差";
							}
        	            	var k = j+1;
        	            	var table="<tr class='gradeX'><td>"+k+"</td><td><a href='javascript:void(0);' title='员工详细信息' style='color:#0080FF'  id='findmanayuser'  onclick=twoDirectory("+data[j].userNumber+")>"+data[j].userNumber+"</a></td><td>"+jbnumber2+"</td><td>"+data[j].userDptJbn+"</td><td>"+data[j].userUsername+"</td><td>"+sex2+"</td><td>"+commonTime+"</td><td>"+worktype2+"</td></tr>";
        	          		
        	            	$tbody.append(table);
        	            }
        		}
        	});
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
        <div class="grid_10">
        	       <div class="box round first grid" >
                <h2>
                    	职员信息</h2>
               
                <div class="tools">
    					<center style="font-size: 15px;">搜索:<input type="text" name="Search" id="text2" placeholder="请输入员工姓名或者部门" style="width: 200px;height: 40px"/><input type="button" value="确定" class="Search" style="background:url(<%=basePath %>houCss/img/buttonbg.png) repeat-x;width:96px; height:35px;" " onclick="tofind()"/>
   				</div></br>
    			<div>
                   <table class="bordered" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>记录条数</th>
							<th>员工编号</th>
							<th>员工部门</th>
							<th>员工职位</th>
							<th>员工姓名</th>
							<th>员工性别</th>
							<th>员工入职时间</th>
							<th>员工工作状态</th>
						</tr>
					</thead>
					<tbody id="appl">
						
					</tbody>
					</table>           
                </div>
            </div> 
        </div>
        
        <div class="grid_10" style="display: none" id="shouw2">
        	       <div class="box round first grid" >
                <h2>
                    	员工拓展信息</h2>
    			<div>
                   <table class="bordered" cellspacing="0" border="0">
						<tr>
							<td >手机号码:</td>
							<td style="color:#0080FF" id="userphone"></td>
							<td >家庭地址:</td>
							<td style="color: #0080FF" id="userAddress"></td>
						</tr>
						<tr>
							<td >生日:</td>
							<td style="color: #0080FF" id="birthday"></td>
							<td >工龄:</td>
							<td style="color: #0080FF" id="worktime"></td>
						</tr>
						<tr>
							<td >第二联系人电话:</td>
							<td style="color: #0080FF" id="userDangerphone"></td>
							<td >学历:</td>
							<td style="color: #0080FF" id="userEdu"></td>
						</tr>
						<tr>
							<td >在职状态:</td>
							<td > <select id="select1" name="select1" id="select1" onblur="upworkjob()">
	                                    <option value="1" >实习期</option>
	                                    <option value="2">试用期</option>
	                                    <option value="3">正式员工</option>
	                                </select>
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
		function tofind() {
			$("#shouw2").hide();
			var text = $("#text2").val();
			 $.ajax({
	        		type : 'post',
	        		dataType : 'json',
	        		url : '<%=basePath%>manager/selectAlluser?text='+text,
	        		success : function(data) {	
	        			var $tbody = $("#appl");
	        			$tbody.empty();  
	        	            for (var j = 0; j < data.length; j++) { 
	        	            	
	        	            	var unixTimestamp = new Date(data[j].userWorktime) ;
	        	            	var commonTime = unixTimestamp.toLocaleString();
	        	            	
	        	            	var jbnumber = data[j].userDpt;
	        	            	var jbnumber2;
	        	            	if (jbnumber==10) {
	        	            		jbnumber2="采购部";
								}else if (jbnumber==11) {
									jbnumber2="市场部";
								}else if (jbnumber==12) {
									jbnumber2="后勤部";
								}else if (jbnumber==13) {
									jbnumber2="财务部";
								}else{
									jbnumber2="生产部";
								}
	        	            	
	        	            	var sex1 = data[j].userSex;
	        	            	var sex2 = "男"
	        	            	if (sex1==2) {
	        	            		sex2 = "女";
								}
	        	            	
	        	            	var  worktype = data[j].userWorktype;
	        	            	var worktype2 = "缺勤";
	        	            	if (worktype==1) {
	        	            		worktype2 = "正常";
								}else if(worktype==2){
									worktype2 = "休假";
								}else if(worktype==3){
									worktype2 = "出差";
								}
	        	            	var k = j+1;
	        	            	var table="<tr class='gradeX'><td>"+k+"</td><td><a href='javascript:void(0);' title='员工详细信息' style='color:#0080FF'  id='findmanayuser'  onclick=twoDirectory("+data[j].userNumber+")>"+data[j].userNumber+"</a></td><td>"+jbnumber2+"</td><td>"+data[j].userDptJbn+"</td><td>"+data[j].userUsername+"</td><td>"+sex2+"</td><td>"+commonTime+"</td><td>"+worktype2+"</td></tr>";
	        	          		
	        	            	$tbody.append(table);
	        	            }
	        	
	        		}
	        	});
		}
        
        function  twoDirectory(userNumber) {
       	  var usernumber = userNumber;
       	
       	  $.ajax({
	        		type : 'post',
	        		dataType : 'json',
	        		url : '<%=basePath%>manager/selectuser?usernumber='+usernumber,
	        		success : function(data) {
	        			if (data!=null) {
	        			
	        			var unixTimestamp = new Date(data.userWorktime) ;
     	            	var commonTime = unixTimestamp.getFullYear();
     	            	
     	            	
     	            	var myDate = new Date();
     	            	var mytime=myDate.getFullYear();
     	            
     	            	var chayear = mytime-commonTime
     	            	$("#worktime").html(chayear+"年");
     	            	
     	            	var unixTimestamp2 = new Date(data.userBirth) ;
     	            	var commonTime2 = unixTimestamp2.toLocaleString();
     	            	$("#birthday").html(commonTime2);
     	            	
     	            	
     	            	$("#userphone").html(data.userPhone);
     	            	$("#userAddress").html(data.userAddress);
     	            	$("#userDangerphone").html(data.userDangerphone);
     	            	$("#userEdu").html(data.userEdu);
     	            	
     	            	var userJobtype = data.userJobtype;
    					if (userJobtype==1) {
    						$("#select1").val("1");
    					}else if(userJobtype==2){
    						$("#select1").val("2");
    					}else if(userJobtype==3){
    						$("#select1").val("3");
    					}else{
    						$("#select1").val("4");
    					}
	        				$("#shouw2").show();
						}
	        		}
       	  });
		}
        
        function  upworkjob() {
         	var userworkjob = jQuery("#select1  option:selected").val();
         	  $.ajax({
  	        		type : 'post',
  	        		dataType : 'json',
  	        		url : '<%=basePath%>manager/upworkjob?userworkjob='+userworkjob,
  	        		success : function(data) {
  	        			if (data==1) {
  	        				alert("您好\n员工在职状态已修改");
  						}else{
  							alert("您好\n网络延迟，请稍等");
  						}
  	        		}
         	  });
  		}
	</script>
</html>
