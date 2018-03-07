<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
      <meta charset="utf-8">
      <title>Bootstrap 实例 - 模态框（Modal）插件</title>
      <link href="<%=basePath %>houcss/css/bootstrap.min.css" rel="stylesheet">
      <script src="<%=basePath %>houcss/js/jquery-3.1.1.min.js"></script>
      <script src="<%=basePath %>houcss/js/bootstrap.min.js"></script>
   </head>
	<script type="text/javascript"> 
	window.onload=function(){ 
	
		 $('#myModal').modal();
	} 

</script> 
   <body>
     
      <!-- 模态框（Modal） -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel">模态框（Modal）标题 </h4>
               </div>
               <div class="modal-body">
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
		开始演示模态框</button>
               </div>
               <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal" id="ture">关闭</button>
                  <button type="button" class="btn btn-primary" id="sure">提交更改</button>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>