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
        		url : '<%=basePath%>manager/findTraveldayAll',
        		success : function(data) {	
        			var $tbody = $("#appl");
        			$tbody.empty();  
        			for (var j = 0; j < data.length; j++) { 
    	            	
    	            	var unixTimestamp = new Date(data[j].attdTravelBegintime) ;
    	            	var attdTravelBegintime = unixTimestamp.toLocaleString();
    	            	
    	            	var unixTimestamp2 = new Date(data[j].attdTravelEndtime) ;
    	            	var attdTravelEndtime = unixTimestamp2.toLocaleString();
    	            	var type = "是";
    	            	if (attdTravelBegintime=="") {
    	            		type = "否"
    					}
    	            	
    	            	var k = j+1;
    	            	var table="<tr class='gradeX'><td>"+k+"</td><td><a href='javascript:void(0);' title='员工历史出差数据' style='color:#0080FF'  id='findmanayuser'  onclick=toremind("+data[j].usernumber+")>"+data[j].usernumber+"</a></td><td>"+data[j].username+"</td><td>"+data[j].attdTravelPlace+"</td><td>"+attdTravelBegintime+"</td><td>"+attdTravelEndtime+"</td><td>"+type+"</td></tr>";
    	          		
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
                        <li><a class="menuitem">数据统计</a>
                            <ul class="submenu">
                                <li><a href="<%=basePath %>manager/tokaoqing">考勤数据</a> </li>	
                                <li><a href="<%=basePath %>manager/tovacation">休假数据</a> </li>
                           		<li><a href="<%=basePath %>manager/totravel">出差数据</a> </li>
                            </ul>
                        </li>
                         <li><a class="menuitem" >人事调动</a>
                         	 <ul class="submenu">
                         	 	<li><a  href="<%=basePath %>manager/toStaffing">人员安排</a></li>
                         	 </ul>
                         </li>                   
                    </ul>	
                </div>
            </div>
        </div>
        <div class="grid_10">
        	  <div class="box round first grid" >
       				   <h2>
                    	休假数据  </h2>
                    	
                <div class="tools">
    					<center style="font-size: 15px;">搜索:&nbsp;&nbsp;<input type="text" name="Search" id="text2" placeholder="请输入员工编号" style="width: 200px;height: 40px"/>&nbsp;&nbsp;<input type="button" value="确定" class="Search" style="background:url(<%=basePath %>houCss/img/buttonbg.png) repeat-x;width:96px; height:35px;" " onclick="tofind()"/>
   				</div></br>
               
              </br>
    			<div>
                   <table class="bordered" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>记录条数</th>
							<th>员工编号</th>
							<th>员工名字</th>
							<th>出差地点</th>
							<th>出差开始时间</th>
							<th>出差结束时间</th>
							<th>出差是否结束</th>
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
                    	员工历史休假记录</h2>
    			<div>
                    <table class="bordered" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>记录条数</th>
							<th>员工名字</th>
							<th>员工申请理由</th>
							<th>员工出差地方</th>
							<th>休假开始时间</th>
							<th>休假结束时间</th>
							<th>休假是否结束</th>
						</tr>
					</thead>
					<tbody id="appl2">
						
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
<script type="text/javascript">
	function toremind(userNumber) {
		var usernumber = userNumber;
		$("#shouw2").show();
		$.ajax({
	 		type : 'post',
	 		dataType : 'json',
	 		url : '<%=basePath%>manager/findUserTraveldayAll?usernumber=' + usernumber,
	 		success : function(data) {	
    			var $tbody = $("#appl2");
    			$tbody.empty();  
					for (var j = 0; j < data.length; j++) { 
	            	
						var unixTimestamp = new Date(data[j].attdTravelBegintime) ;
    	            	var attdTravelBegintime = unixTimestamp.toLocaleString();
    	            	
    	            	var unixTimestamp2 = new Date(data[j].attdTravelEndtime) ;
    	            	var attdTravelEndtime = unixTimestamp2.toLocaleString();
    	            	var type = "是";
    	            	if (attdTravelBegintime=="") {
    	            		type = "否"
    					}
	            	
    	            	var k = j+1;
    	            	var table="<tr class='gradeX'><td>"+k+"</td><td>"+data[j].username+"</td><td>"+data[j].attdTravelRemark+"</td><td>"+data[j].attdTravelPlace+"</td><td>"+attdTravelBegintime+"</td><td>"+attdTravelEndtime+"</td><td>"+type+"</td></tr>";
    	          		
	            	$tbody.append(table);
	            }
    		}
	 	});
	}
	
	function tofind() {
		$("#shouw2").hide();
		var text = $("#text2").val();
		$.ajax({
	  		type : 'post',
	  		dataType : 'json',
	  		url : '<%=basePath%>manager/findUserTravelday?usernumber=' + text,
	  		success : function(data) {	
	  			var $tbody = $("#appl");
	  			$tbody.empty();  
	  		    for (var j = 0; j < data.length; j++) { 
	            	
	  		    	var unixTimestamp = new Date(data[j].attdTravelBegintime) ;
	            	var attdTravelBegintime = unixTimestamp.toLocaleString();
	            	
	            	var unixTimestamp2 = new Date(data[j].attdTravelEndtime) ;
	            	var attdTravelEndtime = unixTimestamp2.toLocaleString();
	            	var type = "是";
	            	if (attdTravelBegintime=="") {
	            		type = "否"
					}
	            	
	            	var k = j+1;
	            	var table="<tr class='gradeX'><td>"+k+"</td><td><a href='javascript:void(0);' title='员工历史出差数据' style='color:#0080FF'  id='findmanayuser'  onclick=toremind("+data[j].usernumber+")>"+data[j].usernumber+"</a></td><td>"+data[j].username+"</td><td>"+data[j].attdTravelPlace+"</td><td>"+attdTravelBegintime+"</td><td>"+attdTravelEndtime+"</td><td>"+type+"</td></tr>";
	          		
	            	$tbody.append(table);
	            }
	  		}
	  	});
	}
</script>
</html>
