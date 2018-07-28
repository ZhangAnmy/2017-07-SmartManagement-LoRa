<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld "%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="res/jquery-3.2.1.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="res/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="res/moment-with-locales.min.js"></script>
<script src="res/bootstrap-datetimepicker.min.js"></script>


</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style>
.dtop {
	position: relative;
	width: 100%;
}

.dshow {
	float:right;
	margin-right:7%;
	margin-bottom:1%;
}

.div-2 {
	backgroud: #f00;
	width: 95%;
	float: center;
	margin-left: 2.5%;
	margin-top: 20px;
}

.ddraw{
	width: 100%;
	height: 70%;
	float: center;
	margin-top: 60px;
	border: 2px solid #000;
}

table,th,td {
	text-align: center;
	font-size: 13px;
}
</style>

<script type="text/javascript">
	
</script>

<body bgcolor="#f1f1f1">
	<div id="div2" class="div-2">
		<h2 style="text-align:center">
			<b>历史数据分析</b>
		</h2>
		<div class="dshow">
			<button type="button" class="btn btn-default btn-sm;" onclick="window.location.href='historydata.jsp'">列表/图表显示</button>
		</div>
		<div class="ddraw">
		</div>
	</div>
</body>
</html>
