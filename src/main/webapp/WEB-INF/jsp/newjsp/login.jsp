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
<title>HR人事管理系统_用户登录</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE6 {color: #5e81ae; font-size: 12px; }
.STYLE8 {color: #000000; font-size: 12px; }
.STYLE9 {color: #828386}
.STYLE10 {color: #828386; font-size: 12px; }
-->
</style></head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#a1aebd">&nbsp;</td>
  </tr>
  <tr>
    <td height="607" background="<%=basePath %>houcss/img/login_02.gif"><table width="947" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="299" background="<%=basePath %>houcss/img/login1.jpg">&nbsp;</td>
      </tr>
      <tr>
        <td height="104"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="407" height="104" background="<%=basePath %>houcss/img/login_05.gif">&nbsp;</td>
            <td width="195" background="<%=basePath %>houcss/img/login_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" height="33"><div align="center"><span class="STYLE8">用 户</span></div></td>
                <td width="75%" height="33"><input type="text" name="textfield" style="width:132px; height:23px; border:solid 1px #c1c1c1; font-size:9pt; color:#000;"></td>
              </tr>
              <tr>
                <td height="33"><div align="center"><span class="STYLE8">密 码</span></div></td>
                <td height="33"><input type="password" name="textfield2" style="width:132px; height:23px; border:solid 1px #c1c1c1; font-size:9pt; color:#000;"></td>
              </tr>
              <tr>
                <td height="35">&nbsp;</td>
                <td height="30" valign="bottom"><a href="main.html"><img src="<%=basePath %>houcss/img/dl.gif" width="48" height="23" border="0"></a> <img src="<%=basePath %>houcss/img/cz.gif" width="48" height="23"></td>
              </tr>
            </table></td>
            <td width="345" background="<%=basePath %>houcss/img/login_07.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="203" valign="top" background="<%=basePath %>houcss/img/login_08.gif" style="padding-top:80px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="25"><div align="center" class="STYLE6 STYLE9">Copyright 版权所有:南京宏远科技股份公司 2009</div></td>
          </tr>
          <tr>
            <td height="25"><div align="center" class="STYLE10">电话:025-52607261  32534386@qq.com</div></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#eaeaea">&nbsp;</td>
  </tr>
</table>
</body>
</html>