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
    <title>Typography | BlueWhale Admin</title>
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
          		url : '<%=basePath%>manager/findAppl',
          		success : function(data) {	
          			var $tbody = $("#appl");
          			$tbody.empty();  
          	            for (var j = 0; j < data.length; j++) { 
          	            	
          	            	var table="<tr class='gradeX'><td>"+data[j].userNumber+"</td><td>"+data[j].userName+"</td><td>"+data[j].applTime+"</td><td>"+data[j].applRemark+"</td><td>"+data[j].applType+"</td><td><input type='button' value='同意'></td></tr>";
          	          		
          	            	$tbody.append(table);
          	            }
          	            
          	          $("input:button").click(function() {
                      	
                          $(this).parent().siblings("td").each(function() {  // 获取当前行的其他单元格

                              obj_text = $(this).find("input:text");    // 判断单元格下是否有文本框

                              if(!obj_text.length)   // 如果没有文本框，则添加文本框使之可以编辑

                                  $(this).html("<input type='text' value='"+$(this).text()+"'>");

                              else   // 如果已经存在文本框，则将其显示为文本框修改的值

                                  $(this).html(obj_text.val()); 

                          });

                      });
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
                        <li><a class="menuitem">首页</a>
                            <ul class="submenu">
                                <li><a href="<%=basePath %>manager/tomain">今日消息</a> </li>	
                           		<li><a>个人中心</a> </li>
                            </ul>
                        </li>                       
                    </ul>
                </div>
            </div>
        </div>
        <div class="grid_10">
            <div class="box round first grid" >
                <h2>
                    	今日消息</h2>
               
                <div class="tools">
    					<center style="font-size: 15px;">搜索:&nbsp;&nbsp;<input type="text" name="Search" placeholder="请输入书名或者作者" style="width: 200px;height: 40px"/>&nbsp;&nbsp;<input type="button" value="确定" class="Search" style="background:url(../moban/images/buttonbg.png) repeat-x;width:96px; height:35px;" onclick="Findbookkeep()"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取消" style="background:url(../moban/images/buttonbg.png) repeat-x;width:96px; height:35px;" onclick="returnbookkeep()"/></center>
   				</div></br>
    			<div>
                   <table class="bordered" cellspacing="0" border="0">
					<thead>
						<tr>
							<th>员工编号</th>
							<th>员工姓名</th>
							<th>申请时间</th>
							<th>申请原因</th>
							<th>申请类型</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="appl">
	                        <tr class="gradeX">
	                        	<td>${list.userNumber }</td>
	                            <td>${list.userName}</td>
	                            <td>1111</td>
	                            <td>${list.applRemark }</td>
	                            <td>${list.applType }</td>
	                            <td><input type='button' value='同意' name="+data[j].userNumber+"><input type='button' value='拒绝' name="+data[j].userNumber+"></td>
	                        </tr>
					</tbody>
					</table>           
                </div>
            </div>      
           </div>
     	 </div>
        <div class="clear">
       </div>
    <div class="clear">
    </div>
   <div id="site_info">
        <p>
            	XXX酒店人事管理系统
        </p>
    </div>
</body>

</html>
