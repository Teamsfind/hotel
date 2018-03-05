<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>酒店人事管理系统</title>
</head>

<frameset rows="129,*,25" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="<%=basePath %>manager/totop.do" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frame src="<%=basePath %>manager/tocenter.do" name="mainFrame" id="mainFrame" />
  <frame src="<%=basePath %>manager/todown.do" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
</noframes>
</html>