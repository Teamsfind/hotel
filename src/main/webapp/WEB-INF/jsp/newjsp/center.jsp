<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
body {
	margin-left: 2px;
	
}
</style>
<script>
function switchSysBar(){ 
var locate=location.href.replace('center.html','');
var ssrc=document.all("img1").src.replace(locate,'');
if (ssrc=="<%=basePath %>houcss/img/main_60.gif")
{ 
document.all("img1").src="<%=basePath %>houcss/img/main_60_1.gif";
document.all("frmTitle").style.display="none" 
} 
else
{ 
document.all("img1").src="<%=basePath %>houcss/img/main_60.gif";
document.all("frmTitle").style.display="" 
} 
} 
</script>

</head>

<body>
<table width="100%" height="300%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="203" id=frmTitle noWrap name="fmTitle"><iframe name="I1" height="550%" width="100%" src="<%=basePath %>manager/toleft.do" border="0" frameborder="0" scrolling="no">
	浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    <td width="4"  style=" cursor:hand" onclick=switchSysBar()><SPAN class=navPoint 
id=switchPoint title=关闭/打开左栏><img src="<%=basePath %>houcss/img/main_60.gif" width="4" height="54"  name="img1" id="img1"/></SPAN></td>
    <td ><iframe name="I1" height="550%" width="100%" src="<%=basePath %>manager/toright.do" border="0" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
  </tr>
</table>
</body>
</html>