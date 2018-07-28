
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style type="text/css">
#toolBar {
	width: 100%;
	background-image: url(../img/toolbar.jpg); /*adminbar.jpg*/
	background-color: #EEEEEE;
}
</style>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="javascript" type="text/javascript">
		var menuCols = "1,*";
		function SwitchMenu()
		{
			if(menuCols == "1,*")
			{
				menuCols = top.formBody.cols;
				top.formBody.cols = "1,*";
				return;
			}
			else
			{
				top.formBody.cols = menuCols;
				menuCols = "1,*";
				return;
			}
		}
</script>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="res/mistake.css" type="text/css" rel="stylesheet">
	</head>

	<body bgcolor="#f1f1f1">
		<table id="tbAdminBar" cellpadding="0" cellspacing="0" >
			<tr>

				<td id="tdAdminBarInputCell" class="tdAdminBarInputCell" width="100%"></td>
				<td id="tdAdminInfo" width="100%" align="right" style="FONT-WEIGHT:normal; COLOR: #333333;"></td>
			</tr>
			
				<tr>
					<!--  <td rowspan="3" width="80" align="right">
						<img src="img/logo.png" alt="">
					</td>
					<td rowspan="3" valign="middle" style="FONT-WEIGHT: bold; FONT-SIZE: 24px; WIDTH: 400px; COLOR: #3d5a6f; filter:shadow(color=#5f7c8f,direction=135);">
						&nbsp;物联网管理平台
					</td>
					-->
					
				</tr>
			
		</table>
	</body>
</html>
