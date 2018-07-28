<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'password_change.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.div1 {
	backgroud: #f00;
	width: 85%;
	float: center;
	margin-right: 30px;
	margin-top: 30px;
}

.div-header {
	backgroud: #f00;
	width: 95%;
	float: center;
	margin-left: 30px;
}

</style>
<script type="text/javascript">
	$(function() {
		$('#pwdedit').click(function() {
			var params = $("#formEdit").serialize();

			//alert(params);
			$.ajax({

				type : "POST",
				url : "PwdEdit",
				data : params,
				success : function(data) {
					window.location.href="password_change.jsp";
				}
			});
		});
	});
	function subform() {
		$("#password").val('');
		$("#password1").val("");
	}
	
	function saveSubmit(){
		
		var userName = document.getElementsByName("userName")[0].value;
		window.location.href="PwdEdit?userlogin.userName="+userName;
		alert("PwdEdit?userlogin.userName="+userName);
		window.location.href="password_change.jsp";
	}
	function validate() {
	     
	    var pwd = $("#password").val();
	    var pwd1 = $("#password1").val();
	// 对比两次输入的密码 
	    if(pwd == pwd1)
	     {
	        $("#tishi").html("");
	         $("#tishi").css("color","green");
	    $("#pwdedit").removeAttr("disabled");
	     }
	else {
	        $("#tishi").html("密码不一致");
	         $("#tishi").css("color","red")
	          $("#pwdedit").attr("disabled","disabled");   
	      }
	}
</script>
</head>

<body>
	
		<div id="div-header">
			<h2 style="text-align:center" id="addModalLabel">
				<b>修改个人密码</b>
			</h2>
		</div>
		
		<form id="formEdit"  method="post" action="" class="form-horizontal">
		<div class="modal-body">
		<center>
			<table width="55%" border="0" cellspacing="0" cellpadding="0">
				<!-- <tr>
					<td align="right" style="font-size:15px; padding:10px"><label
						for="firstname" class="col-sm-12 control-label">用户ID</label></td>
					<td><input type="text" width=30%; class="form-control"
						id="firstname" placeholder="用户ID"></td>
				</tr> -->
				<tr>
					<td align="right" style="font-size:15px; padding:10px"><label
						for="lastname" class="col-sm-12 control-label">用户名</label></td>
					<td><input type="text" class="form-control" id="userName" name=userlogin.username
						 readonly="readonly" value=<%=session.getAttribute("userName")%>>
					</td>
				</tr>
				<tr>
					<td align="right" style="font-size:15px; padding:10px"><label
						for="lastname" class="col-sm-12 control-label">登录密码</label></td>
					<td width="60%"><input type="password" class="form-control" id="password"
						placeholder="登录密码"></td>
						<td width="15%"></td>
				</tr>

				<tr>
					<td align="right" style="font-size:15px; padding:10px"><label
						for="lastname" class="col-sm-12 control-label">确认密码</label></td>
					<td width="60%"><input type="password" id="password1" class="form-control" name="userlogin.password"
						placeholder="确认密码" onkeyup="validate()"></td>
						<td width="15%"><span id="tishi"></span></td>
				</tr>
			</table>
			</center>
		</div>
		<div style="margin:5px" class="modal-footer">
			<table align="center">
				<tr>
					<td>
						<button type="button" class="btn btn-info" data-dismiss="modal">取消</button>
						<button type="button" id="res" onclick="subform()"
							class="btn btn-primary btn-sm">重置</button>
						<button type="button" id="pwdedit"
							class="btn btn-primary btn-sm" >保存</button>
					</td>
				</tr>
			</table>

		</div>
	</form>

</body>
</html>
