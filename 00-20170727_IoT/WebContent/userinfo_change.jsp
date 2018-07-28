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

<title>My JSP 'dealinfo_change.jsp' starting page</title>

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
	width: 90%;
	float: center;
	margin-right: 30px;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#editUserinfo').click(function() {
			var params = $("#formEdit").serialize();
			//alert(params);
			$.ajax({
				type : "POST",
				url : "EditUser",
				data : params,
				success : function(data) {
				//alert(data);
					//window.location.href="userQueryAll";
				}
			});
		});
		$("form :input")
				.blur(
						function() {
							var $parent = $(this).parent();
							if ($(this).is('#username')) {
								//验证登录名
								if (!$("#username").val().match(
										/^[0-9a-zA-Z\u4e00-\u9fa5_]{3,16}$/)) {
									var errorMsg = '仅由3-16位中文、英文、数字及“_”、“-”组成';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								} else {
									var ok1 = true;
								}
							}
							if ($(this).is('#passworld')) {
								//验证登录名
								if (this.value == "") {
									var errorMsg = '密码不能为空';
									$parent
											.append('<td><span class="formtips onError" style="color:red;font-size:10px">'
													+ errorMsg + '</span></td>');
								} else {
									var ok2 = true;
								}
							}
						});
		$("form :input").focus(function() {
			var $parent = $(this).parent();
			$parent.find(".formtips").remove();
		});		
	});	
	
	function subform() {
		$("input").val('');
		$("textarea").val('');
		$("select").val("");
	}
	
	//修改重置
	function editform() {
		$("#userTel").val('');
		$("#userDept").val('');
		$("#userRemark").val('');
		$("#userEmail").val('');
	}

</script>

</head>

<body>
	<div>
		<h2 style="text-align:center" id="addModalLabel">
			<b>修改用户信息</b>
		</h2>
	</div>
	<form id="formEdit"  method="post" action="EditUser.action" class="form-horizontal">
		<div class="modal-body">
			<table width="85%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td style="font-size:15px; padding:10px"><label
						for="firstname" class="col-sm-12 control-label">登&nbsp;&nbsp;录&nbsp;&nbsp;名</label></td>
					<td><input type="text" 
						class="form-control" id="userId1" name="userlogin.username"
						readonly="readonly" value=<%=session.getAttribute("userName")%>></td>
					<td style="font-size:15px; padding:10px"><label
						for="firstname" class="col-sm-12 control-label">登录密码</label></td>
					<td><input type="text" 
						class="form-control" id="passworld" name="userlogin.password"
						readonly="readonly" value="***"></td>
					<td></td>
				</tr>
				<tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">真实姓名</label></td>
					<td><input type="text" class="form-control" id="lastname" name="user.userName"
					 value=<%=session.getAttribute("realname")%>></td>
					<td align="center" style="font-size:15px; padding:10px"><label
						for="lastname" class="col-sm-12 control-label">所属部门</label></td>
					<td><select class="form-control" name="user.departmentId" id="userDept"
					value=<%=session.getAttribute("department")%>>
							<option value="">--请选择--</option>
							<option value="D4">垃圾桶</option>
							<option value="D3">下水道</option>
							<option value="D2">井盖</option>
							<option value="D1">古树</option>
					</select></td>
				</tr>
				<tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话</label></td>
					<td><input type="text" class="form-control" id="userTel" name="user.tel"
					value=<%=session.getAttribute("tel")%>></td>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件</label></td>
					<td><input type="text" class="form-control" id="userEmail"
						class="require" id="lastname" name="user.email"
						value=<%=session.getAttribute("email")%>></td>
				</tr>
				<tr>
					<td style="font-size:15px; padding:10px"><label for="lastname"
						class="col-sm-12 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</label></td>
					<td><textarea type="text" class="form-control" id="userRemark" name="user.remark"
					value=<%=session.getAttribute("remark")%>></textarea></td>
				</tr>
			</table>
		</div>
		<div style="margin:5px" class="modal-footer">
			<table align="center">
				<tr>
					<td>
						<button type="button" class="btn btn-primary btn-sm"
							data-dismiss="modal">取消</button>
						<button type="button" id="res" onclick="editform()"
							class="btn btn-primary btn-sm">重置</button>
						<button type="submit" class="btn btn-primary btn-sm"
							id="editUserinfo">提交</button>
					</td>
				</tr>
			</table>

		</div>
	</form>

</body>
</html>
