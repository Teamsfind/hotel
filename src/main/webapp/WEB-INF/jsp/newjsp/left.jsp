<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <title>表格</title>
        <meta name="keywords" content="侧边导航菜单(可分组折叠)">
        <meta name="description" content="侧边导航菜单(可分组折叠)" />
        <meta name="HandheldFriendly" content="True" />
        <!-- Bootstrap3.3.5 CSS -->
        <link href="<%=basePath %>houcss/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .panel-group{max-height:770px;overflow: auto;}
            .leftMenu{margin:10px;margin-top:5px;}
            .leftMenu .panel-heading{font-size:14px;padding-left:20px;height:36px;line-height:36px;color:white;position:relative;cursor:pointer;}/*转成手形图标*/
            .leftMenu .panel-heading span{position:absolute;right:10px;top:12px;}
            .leftMenu .menu-item-left{padding: 2px; background: transparent; border:1px solid transparent;border-radius: 6px;}
            .leftMenu .menu-item-left:hover{background:#C4E3F3;border:1px solid #1E90FF;}
        </style>
    </head>
<style type="text/css">
<!--
.STYLE2 {color: #000000}
.STYLE3 {color: #000000; font-size: 12px; }
-->
</style>
<body>
        <div class="row">
            <div class="col-md-2">
                <div class="panel-group table-responsive" role="tablist">
                	<div class="panel panel-primary leftMenu">
                        <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse" data-target="#collapseListGroup2" role="tab" >
                            <h4 class="panel-title">
                             		人事档案管理
                                <span class="glyphicon glyphicon-chevron-down right"></span>
                            </h4>
                        </div>
                        <div id="collapseListGroup2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="collapseListGroupHeading2">
                            <ul class="list-group">
                              <li class="list-group-item">
                                <button class="menu-item-left">
                                    <span class="glyphicon glyphicon-triangle-right"></span>职员入职
                                </button>
                              </li>
                              <li class="list-group-item">
                                <button class="menu-item-left">
                                    <span class="glyphicon glyphicon-triangle-right"></span>职员转正
                                </button>
                              </li>
                              <li class="list-group-item">
                                <button class="menu-item-left">
                                    <span class="glyphicon glyphicon-triangle-right"></span>员工档案
                                </button>
                              </li>
                              <li class="list-group-item">
                                <button class="menu-item-left">
                                    <span class="glyphicon glyphicon-triangle-right"></span>员工离职
                                </button>
                              </li>
                            </ul>
                        </div>
                    </div> 
                    <div class="panel panel-primary leftMenu">
                        <!-- 利用data-target指定要折叠的分组列表 -->
                        <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse" data-target="#collapseListGroup1" role="tab" >
                            <h4 class="panel-title">
                                	考勤管理
                                <span class="glyphicon glyphicon-chevron-up right"></span>
                            </h4>
                        </div>
                        <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                        <div id="collapseListGroup1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="collapseListGroupHeading1">
                            <ul class="list-group">
                              <li class="list-group-item">
                                <!-- 利用data-target指定URL -->
                                <button class="menu-item-left" data-target="test2.html">
                                    <span class="glyphicon glyphicon-triangle-right"></span>考勤数据
                                </button>
                              </li>
                              <li class="list-group-item">
                                <button class="menu-item-left">
                                    <span class="glyphicon glyphicon-triangle-right"></span>休假数据
                                </button>
                              </li>
                              <li class="list-group-item">
                                <button class="menu-item-left">
                                    <span class="glyphicon glyphicon-triangle-right"></span>差旅数据
                                </button>
                              </li>
                              <li class="list-group-item">
                                <button class="menu-item-left">
                                    <span class="glyphicon glyphicon-triangle-right"></span>人员安排
                                </button>
                              </li>
                            </ul>
                        </div>
                    </div><!--panel end-->
                </div>
            </div>
        </div>
        <!-- jQuery1.11.3 (necessary for Bo otstrap's JavaScript plugins) -->
        <script src="<%=basePath %>houcss/js/jquery-3.1.1.min.js "></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="<%=basePath %>houcss/js/bootstrap.min.js "></script>
        <script>
        $(function(){
            $(".panel-heading").click(function(e){
                /*切换折叠指示图标*/
                $(this).find("span").toggleClass("glyphicon-chevron-down");
                $(this).find("span").toggleClass("glyphicon-chevron-up");
            });
        });
        </script>
    </body>
</html>