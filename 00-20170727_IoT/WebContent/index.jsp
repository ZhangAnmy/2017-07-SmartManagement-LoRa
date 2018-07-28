<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld " %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>物联网管理平台</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="res/mistake.css" type="text/css" rel="stylesheet">
		
		<style>
		tr,td{font-size:20px}
		.font_link{font-size:15px;}
		</style>
		<script language="javascript" src="jscript/validate.js"></script>
		<script type="text/javascript">
			function submitForm(frm)
			{
				frm.submit();
			}
	  	</script>
	</head>
	<%
	  String path = request.getContextPath();
	  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	<body background="res/background1.jpg">
		<table width="100%" height="100%" cellspacing="0" cellpading="0">
			<tr height="180">
				<td style="border-bottom:solid 1px #61729E" height="80px">
					<table height="100%" cellspacing="0" cellpadding="0" width="100%" overflow="hidden" border="0">
						<tr>
							<td align="left" valign="middle" style="text-align:center; FONT-WEIGHT: bold; FONT-SIZE: 40px; COLOR: #3d5a6f; filter:shadow(color=#5f7c8f,direction=135);">&nbsp; 物联网管理系统 
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center" width="100%" >
					<table style="width: 680px;">
						<tr height="160" background="res/login3.jpg">
							<td style="font-family:华文彩云;font-size:48px; text-align:center; color:#3d5a6f;">
								欢迎使用
							</td>
							<td style="width:10px;"> <hr size=200 width="1" ></td>
							<td align="center">
								<form name="loginform" method="POST" action='checkUserLogin'>
									<table>
										<tr height="50px">
											<td colspan="5" align="center">
												<b>登录系统</b>
											</td>
										</tr>
										<tr height="50px">
											<td align="right" align="center">
											用户名:
											</td>
											<td>
												<input type="text" name="userLogin.username" style="width:180px;font-size:20px" maxlength="20" />
											</td>
										</tr>
										<tr height="50px">
											<td align="right" align="center">
											密 &nbsp;码:
											</td>
											<td>
												<input type="password"  name="userLogin.password" style="width:180px;font-size:20px" maxlength="20" onkeydown="if(event.keyCode==13) {submitForm(this.form)}" />
											</td>
										</tr>
										<tr height="50px">
											<td><br></td>
											<td>
												<span style="margin-left:35px;">
												<input id="loginInput" type="button" value="登录" style="font-size:15px" class="btn btn-primary btn-sm" onclick="submitForm(this.form)" />
												</span>
												<input type="reset" value="重置" style="font-size:15px" class="btn btn-primary btn-sm" />
											</td>
										</tr>
										<tr>
										</tr>
									</table>
									
									<%
										String strMsg = "";
										if(session.getAttribute("LoginMsg") != null)
										{
											strMsg = session.getAttribute("LoginMsg").toString();
										}
										%>
									
								</form>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td align="center" style="font-size:15px;line-height:10px;border-top:solid 1px #61729E;">
					<a href="http://esnl.hnu.edu.cn/" target="_blank" class="font_link">湖南大学嵌入式与网络计算重点实验室</a>
				</td>
			</tr>
		</table>
	</body>
</html>
