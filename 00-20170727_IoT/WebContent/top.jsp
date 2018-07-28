
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<%
	String username = (String) session.getAttribute("username");
	String date = (new SimpleDateFormat("yyyy-MM-dd"))
			.format(new Date());
%>
<body bgcolor="#f1f1f1">
<div style="background:#E0E0E0;" >
	<form id="frmtop" name="frmtop" method="post" action="" role="form">
	
		<table height="50px" cellspacing="0" cellpadding="0" width="90%"
			border="0" div class="form-group"style=" margin-left: 20px;">
			<tr>		
				<td align="center"><b>监控区域：</b><select style="height:30px">
						<option value ="000">--请选择--</option>
						<option value="岳麓书院">东方红广场</option>
						<option value="saab">岳麓书院</option>
						<option value="天马学生公寓">天马学生公寓</option>
						<option value="麓山南路">麓山南路</option>
				</select>
				</td>
				<td align="center"><b>监控点类型：</b><select
					style="height:30px">
					<option value ="000">--请选择--</option>
						<option value="下水道">下水道</option>
						<option value="垃圾桶">垃圾桶</option>
						<option value="古树">古树</option>
				</select>
				</td>
				<td align="center"><b>监控点区间号：</b>
				<select style="height:30px">
				<option value ="000">--请选择--</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
				</select> -&nbsp;&nbsp;
				<select style="height:30px">
				<option value ="000">--请选择--</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
				</select>
				</td>
				<td class="checkbox"><b>状态： </b><label> <input type="checkbox">
						<b>正常</b>
				</label> <label> <input type="checkbox"> <b>预警</b>
				</label> <label> <input type="checkbox"> <b>报警</b>
				</label> <label> <input type="checkbox"> <b>全部</b>
				</label>
				</td>
				<td align="center" >
				<button type="submit" class="btn btn-primary"><b>登录</b></button>
				</td>
			</tr>
			</table>
				</form>
				</div>
		
</body>
</html>
