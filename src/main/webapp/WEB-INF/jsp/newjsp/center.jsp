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
<!--
body {
	margin-left: 2px;
	margin-top: 1px;
	margin-right: 2px;
	margin-bottom: 2px;
	background-color: #535353;
	overflow:hidden;
}
-->
</style>
<script>
function switchSysBar(){ 
var locate=location.href.replace('center.html','');
var ssrc=document.all("img1").src.replace(locate,'');
if (ssrc=="images/main_60.gif")
{ 
document.all("img1").src="images/main_60_1.gif";
document.all("frmTitle").style.display="none" 
} 
else
{ 
document.all("img1").src="images/main_60.gif";
document.all("frmTitle").style.display="" 
} 
} 
</script>

</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="203" valign="top" id=frmTitle noWrap name="fmTitle"><iframe name="I1" height="100%" width="100%" src="left.html" border="0" frameborder="0" scrolling="no">
	浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
    <td width="4"  style=" cursor:hand" onclick=switchSysBar()><SPAN class=navPoint 
id=switchPoint title=关闭/打开左栏><img src="images/main_60.gif" width="4" height="54"  name="img1" id="img1"/></SPAN></td>
    <td valign="top"><iframe name="I1" height="100%" width="100%" src="right.html" border="0" frameborder="0" scrolling="no"> 浏览器不支持嵌入式框架，或被配置为不显示嵌入式框架。</iframe></td>
  </tr>
</table>
</body>
</html>