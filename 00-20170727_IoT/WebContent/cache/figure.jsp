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
</head>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

  request.setAttribute("message", "000");
%>
<script src="res/echarts.min.js"></script>
<script type="text/javascript" >

</script>
<body bgcolor="#f1f1f1" >

	<div id = "main" style="width: 120px;height:80px;">
	
	</div>
</body>
</html>
