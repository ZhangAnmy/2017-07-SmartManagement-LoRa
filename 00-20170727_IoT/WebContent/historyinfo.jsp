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

    <link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script src="res/echarts.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style>
table,th,td {
	text-align: center;
	font-size: 13px;
}
</style>

<script type="text/javascript">
	$(function() {
		var picker1 = $('#datetimepicker1').datetimepicker({
			format : 'YYYY-MM-DD hh:mm',
			locale : moment.locale('zh-cn'),
		//minDate: '2016-7-1'  
		});

		var picker2 = $('#datetimepicker2').datetimepicker({
			format : 'YYYY-MM-DD hh:mm',
			locale : moment.locale('zh-cn')
		});
		//动态设置最小值  
		picker1.on('dp.change', function(e) {
			picker2.data('DateTimePicker').minDate(e.date);
		});
		//动态设置最大值  
		picker2.on('dp.change', function(e) {
			picker1.data('DateTimePicker').maxDate(e.date);
		});
	});
</script>

<body>

	<div>
		<table width="100%" height="100%" cellspacing="0" cellpading="0">
			<tr style="height:10%; border:1px solid #000;margin-left: 0px;">
				<td align="center"><b>区域:</b> <select style="height:80%">
						<option value="000">-请选择-</option>
						<option value="岳麓书院">东方红广场</option>
						<option value="saab">岳麓书院</option>
						<option value="天马学生公寓">天马学生公寓</option>
						<option value="麓山南路">麓山南路</option>
				</select>
				</td>

				<td align="center"><b>类型:</b> <select style="height:80%">
						<option value="000">-请选择-</option>
						<option value="下水道">下水道</option>
						<option value="垃圾桶">垃圾桶</option>
						<option value="古树">古树</option>
				</select>
				</td>
				<td align="center"><b style="float:left; margin-top:2%;">时间段:</b>
					<input type='text' class="form-control" id='datetimepicker1'
					style="float:left; margin-left:2%; width:30%;" /> <b
					style="float:left; margin-top:2%; width:10%;">-</b> <input
					type='text' class="form-control" id='datetimepicker2'
					style="float:left; width:30%;" />
				</td>
				<td class="checkbox" style="height:80%; border:0;"><b>状态: </b><label>
						<input type="checkbox"> <b>正常</b> </label> <label> <input
						type="checkbox"> <b>预警</b> </label> <label> <input
						type="checkbox"> <b>报警</b> </label> <label> <input
						type="checkbox"> <b>全部</b> </label>
				</td>
				<td align="center">
					<button type="submit" class="btn btn-primary">
						<b>确定</b>
					</button>
				</td>
			</tr>
			<tr>
				<td colspan="5" style="height:100%; width:100%;"><iframe name="content"
						src="historydata.jsp" width="100%" height="100%"></iframe>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>