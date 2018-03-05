<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="<%=basePath %>houcss/js/main.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>houcss/js/tab.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.STYLE1 {	color: #15428b;
	font-size: 12px;
}
.STYLE2 {color: #000000}
.STYLE3 {font-size: 12px}
.STYLE4 {color: #000000; font-size: 12px; }
-->
</style>
</head>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="27"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="3" height="27"><img src="<%=basePath %>houcss/img/main_42.gif" width="3" height="27"></td>
        <td background="<%=basePath %>houcss/img/main_43.gif"><table width="100%" height="21" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td style="padding-left:5px; font-size:9pt;"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="3%"><div align="center"><img src="<%=basePath %>houcss/img/right01.gif" width="14" height="14"></div></td>
                <td width="97%" style="font-size:12px; padding-left:10px;" nowrap="nowrap"><span class="STYLE2">当前位置  首页 - 档案管理 - 员工档案</span> </td>
              </tr>
            </table></td>
            <td width="300" ><table width="240" border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="3" height="21"><img src="<%=basePath %>houcss/img/main_46.gif" width="3" height="21"></td>
                <td background="<%=basePath %>houcss/img/main_48.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="21"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="STYLE2"><div align="center"><img src="<%=basePath %>houcss/img/add.gif" width="16" height="16"></div></td>
                        <td class="STYLE2"><div align="center"><span class="STYLE3">添加</span></div></td>
                      </tr>
                    </table></td>
                    <td width="2"><img src="<%=basePath %>houcss/img/main_49.gif" width="2" height="21"></td>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="STYLE2"><div align="center"><img src="<%=basePath %>houcss/img/del.gif" width="13" height="14"></div></td>
                        <td class="STYLE2"><div align="center"><span class="STYLE3">删除</span></div></td>
                      </tr>
                    </table></td>
                    <td width="2"><img src="<%=basePath %>houcss/img/main_49.gif" width="2" height="21"></td>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="STYLE2"><div align="center"><img src="<%=basePath %>houcss/img/edit.gif" width="16" height="14"></div></td>
                        <td class="STYLE2"><div align="center"><span class="STYLE3">修改</span></div></td>
                      </tr>
                    </table></td>
                    <td width="2"><img src="<%=basePath %>houcss/img/main_49.gif" width="2" height="21"></td>
                    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td class="STYLE2"><div align="center"><img src="<%=basePath %>houcss/img/src.gif" width="15" height="13"></div></td>
                        <td class="STYLE2"><div align="center"><span class="STYLE3">查找</span></div></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
                <td width="3"><img src="<%=basePath %>houcss/img/main_51.gif" width="3" height="21"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="3"><img src="<%=basePath %>houcss/img/main_44.gif"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top" bgcolor="#FFFFFF" style="border-left:solid 1px #343434; border-bottom:solid 1px #343434; border-right:solid 1px #343434; padding-top:2px; padding-left:3px; padding-right:3px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="tab_firstline STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">编号<img src="<%=basePath %>houcss/img/sj.gif" width="11" height="9"></td>
              <td class="tab_firstline STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">ip地址</td>
              <td class="tab_firstline STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">用户</td>
              <td class="tab_firstline STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">所属部门</td>
              <td class="tab_firstline STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">上线时间</td>
              <td class="tab_firstline STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">下线时间</td>
              <td class="tab_firstline STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">角色</td>
              <td class="tab_firstline_last STYLE2" onMouseOver="this.style.backgroundImage='url(<%=basePath %>houcss/img/tbg1.gif)';"onmouseout="this.style.backgroundImage='';">操作</td>
            </tr>
            <tr>
              <td class="td1 STYLE2">2008-25-62</td>
              <td class="td1 STYLE2">192.168.0.124</td>
              <td class="td1 STYLE2">admin</td>
              <td class="td1 STYLE2">人事部/档案科</td>
              <td class="td1 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td1 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td1 STYLE2">管理员</td>
              <td class="td2 STYLE2">编辑</td>
            </tr>
            <tr>
              <td class="td3 STYLE2">2008-25-69</td>
              <td class="td3 STYLE2">192.168.0.256</td>
              <td class="td3 STYLE2">admin</td>
              <td class="td3 STYLE2">人事部/档案科</td>
              <td class="td3 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td3 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td3 STYLE2">系统维护</td>
              <td class="td4 STYLE2">编辑</td>
            </tr>
            <tr>
              <td class="td1 STYLE2">2008-25-62</td>
              <td class="td1 STYLE2">192.168.0.124</td>
              <td class="td1 STYLE2">admin</td>
              <td class="td1 STYLE2">人事部/档案科</td>
              <td class="td1 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td1 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td1 STYLE2">档案管理</td>
              <td class="td2 STYLE2">编辑</td>
            </tr>
            <tr>
              <td class="td3 STYLE2">2008-25-63</td>
              <td class="td3 STYLE2">192.168.2.561</td>
              <td class="td3 STYLE2">admin</td>
              <td class="td3 STYLE2">人事部/档案科</td>
              <td class="td3 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td3 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td3 STYLE2">保洁员</td>
              <td class="td4 STYLE2">编辑</td>
            </tr>
            <tr>
              <td class="td1 STYLE2">2008-25-62</td>
              <td class="td1 STYLE2">192.168.0.125</td>
              <td class="td1 STYLE2">admin</td>
              <td class="td1 STYLE2">人事部/档案科</td>
              <td class="td1 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td1 STYLE2">2008-12-18 16:58:32 </td>
              <td class="td1 STYLE2">录入员</td>
              <td class="td2 STYLE2">编辑</td>
            </tr>
            <tr>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td4">&nbsp;</td>
            </tr>
            <tr>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td2">&nbsp;</td>
            </tr>
            <tr>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td4">&nbsp;</td>
            </tr>
            <tr>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td1">&nbsp;</td>
              <td class="td2">&nbsp;</td>
            </tr>
            <tr>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td3">&nbsp;</td>
              <td class="td4">&nbsp;</td>
            </tr>
            <tr>
              <td class="tab_lastline">&nbsp;</td>
              <td class="tab_lastline">&nbsp;</td>
              <td class="tab_lastline">&nbsp;</td>
              <td class="tab_lastline">&nbsp;</td>
              <td class="tab_lastline">&nbsp;</td>
              <td class="tab_lastline">&nbsp;</td>
              <td class="tab_lastline">&nbsp;</td>
              <td class="tab_lastline_last">&nbsp;</td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td class="tab_inf"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="43%" height="35" valign="middle" nowrap="nowrap" class="STYLE4">页次 1/3 页 每页 30 共 3 页 </td>
              <td width="57%"><table width="245" border="0" align="right" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="31" height="20"><img src="<%=basePath %>houcss/img/rs_44.gif" width="29" height="20"></td>
                    <td width="31"><img src="<%=basePath %>houcss/img/rs_46.gif" width="29" height="20"></td>
                    <td width="31"><img src="<%=basePath %>houcss/img/rs_48.gif" width="29" height="20"></td>
                    <td width="31"><img src="<%=basePath %>houcss/img/rs_50.gif" width="29" height="20"></td>
                    <td width="32" class="STYLE1"><div align="center" class="STYLE2">转到 </div></td>
                    <td width="32" class="STYLE1"><div align="center" class="STYLE2">
                        <input type="text" name="textfield">
                    </div></td>
                    <td width="17"><div align="center" class="STYLE2"><span class="STYLE3">页</span></div></td>
                    <td width="40"><div align="center"><img src="<%=basePath %>houcss/img/rs_52.gif" width="29" height="20"></div></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>