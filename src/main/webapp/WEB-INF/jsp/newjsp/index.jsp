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
<title>酒店人事管理系统</title>
</head>

<frameset rows="129,*,25" cols="*" framespacing="0" frameborder="no" border="0">
  <frame src="<%=basePath %>manager2/totop.do" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" />
  <frame src="<%=basePath %>manager2/tocenter.do" name="mainFrame" id="mainFrame" />
  <frame src="<%=basePath %>manager2/todown.do" name="bottomFrame" scrolling="No" noresize="noresize" id="bottomFrame" />
</frameset>
<noframes>
</noframes>
</html>