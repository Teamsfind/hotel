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
<link href="<%=basePath %>houcss/js/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.STYLE5 {color: #FFFFFF}
.STYLE6 {color: #000000}
-->
</style>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="58"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="52" height="59" background="<%=basePath %>houcss/img/main_01.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="33" background="<%=basePath %>houcss/img/main_04.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="99" height="33" background="<%=basePath %>houcss/img/main_02.gif"><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td valign="middle"><div align="center"><img src="<%=basePath %>houcss/img/computer.gif" width="14" height="15" /></div></td>
                    <td valign="bottom"><div align="center"><img src="<%=basePath %>houcss/img/sx.gif" width="12" height="12" /></div></td>
                    <td valign="middle"><div align="center"><img src="<%=basePath %>houcss/img/user.gif" width="13" height="15" /></div></td>
                    <td valign="middle"><div align="left"><img src="<%=basePath %>houcss/img/save.gif" width="16" height="13" /></div></td>
                  </tr>
                </table></td>
                <td ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="2%"><div align="center"><img src="<%=basePath %>houcss/img/l.gif" width="5" height="7" /></div></td>
                    <td width="98%" style="font-size:14px; text-align:center;"><span class="STYLE5">HR-人事管理系统</span></td>
                  </tr>
                </table></td>
                <td width="80s"><table width="75" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="25" height="25" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/b.gif)';"onmouseout="this.style.backgroundImage='url()';"><img src="<%=basePath %>houcss/img/zx.gif" width="25" height="25" /></td>
                    <td width="25" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/b.gif)';"onmouseout="this.style.backgroundImage='url()';"><img src="<%=basePath %>houcss/img/zd.gif" width="25" height="25" /></td>
                    <td width="25" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/b.gif)';"onmouseout="this.style.backgroundImage='url()';"><img src="<%=basePath %>houcss/img/gb.gif" width="25" height="25" /></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="26" background="<%=basePath %>houcss/img/main_07_1.gif" style="padding-right:5px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="26" valign="bottom" background="<%=basePath %>houcss/img/main_07.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="86" height="24"><table width="84" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="24" background="<%=basePath %>houcss/img/top_bg.gif" ><div align="center" class="STYLE6">最新消息(N)</div></td>
                      </tr>
                    </table></td>
                    <td width="86"><table width="84" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td height="24" class="STYLE5" style="cursor:hand;" onmouseover="this.style.backgroundImage='url(<%=basePath %>houcss/img/top_bg1.gif)';"onmouseout="this.style.backgroundImage='url()';"><div align="center">帮助(H)</div></td>
                      </tr>
                    </table></td>
                    <td><div align="right" class="STYLE5"><img src="<%=basePath %>houcss/img/help.gif" width="16" height="16" /></div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="70" bgcolor="#535353" style="padding-left:2px; padding-right:2px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="3" height="70"><img src="<%=basePath %>houcss/img/main_09.gif" width="3" height="70" /></td>
        <td background="<%=basePath %>houcss/img/main_11.gif" >
		  <div class="menu">
		  <ul>
			 <li><a href="#" onfocus="this.blur"><span><table width="184" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="46" height="40" style="cursor:hand" onmouseover="this.style.backgroundImage='url(<%=basePath %>houcss/img/main_27.gif)';"onmouseout="this.style.backgroundImage='url()';"><div align="center"><img src="<%=basePath %>houcss/img/05.gif" width="30" height="17" /></div></td>
                      <td width="46" style="cursor:hand" onmouseover="this.style.backgroundImage='url(<%=basePath %>houcss/img/main_27.gif)';"onmouseout="this.style.backgroundImage='url()';"><div align="center"><img src="<%=basePath %>houcss/img/06.gif" width="29" height="20" /></div></td>
                      <td width="46" style="cursor:hand" onmouseover="this.style.backgroundImage='url(<%=basePath %>houcss/img/main_27.gif)';"onmouseout="this.style.backgroundImage='url()';"><div align="center"><img src="<%=basePath %>houcss/img/07.gif" width="28" height="27" /></div></td>
                      <td width="46" style="cursor:hand" onmouseover="this.style.backgroundImage='url(<%=basePath %>houcss/img/main_27.gif)';"onmouseout="this.style.backgroundImage='url()';"><div align="center"><img src="<%=basePath %>houcss/img/08.gif" width="31" height="27" /></div></td>
                    </tr>
                    <tr>
                      <td height="18"><div align="center" class="STYLE5"> 信封</div></td>
                      <td><div align="center" class="STYLE5">邮件</div></td>
                      <td><div align="center" class="STYLE5">自定义</div></td>
                      <td><div align="center" class="STYLE5">联系人</div></td>
                    </tr>
                  </table>
			 </span><em></em></a></li>
		  </ul>
		  </div>
		</td>
        <td width="3"><img src="<%=basePath %>houcss/img/main_13.gif" width="3" height="70" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>