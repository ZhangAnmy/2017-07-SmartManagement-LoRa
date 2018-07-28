<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title></title>
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link href="res/mistake.css" type="text/css" rel="stylesheet">
	<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
</head>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  request.setAttribute("message", "000");
  
%>
<body bgcolor="#f1f1f1" >
</div>
	
	
			
				<!-- 标准的按钮 -->

		<!-- 信息警告消息的上下文按钮 -->
		  <button type="button" class="btn btn-default btn-sm"  id="addnode">新增</a>
		  <button type="button" class="btn btn-default btn-sm">修改</button>
		   <button type="button" class="btn btn-default btn-sm">删除</button>
			</div>
					
	<div>
	
		<form id="frmtop" name="frmtop" method="post" action="">
			<table  class="table table-striped" cellspacing="0" cellpadding="0" >
				<tr>
					<td>
						id
					</td>
					<td>
						MachineId
					</td>
					<td>
						Longitude
					</td>
					<td>
						Latitude				
					</td>
					<td>
						id
					</td>
					<td>
						MachineId
					</td>
					<td>
						Longitude
					</td>
					<td>
						Latitude				
					</td>
					<td>
				</tr>
				
				
				
			</table>
		</form>
	</div>
</body>
</html>
