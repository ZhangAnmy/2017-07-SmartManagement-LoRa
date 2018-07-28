<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<!--用百度的静态资源库的cdn安装bootstrap环境-->
		<!-- Bootstrap 核心 CSS 文件 -->
		<link href="res/bootstrap.min.css" rel="stylesheet">
		<!--font-awesome 核心我CSS 文件-->
		<link href="//cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
		<!-- 在bootstrap.min.js 之前引入 -->
		<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
		<!-- Bootstrap 核心 JavaScript 文件 -->
		<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		<!--jquery.validate-->
		<script type="text/javascript" src="js/jquery.validate.min.js" ></script>
		<script type="text/javascript" src="js/message.js" ></script>
		<style type="text/css">
			body{background: url(res/login1.jpg) no-repeat;background-size:100%;font-size: 16px;}
			.form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
			#login_form{display: block;}
			#register_form{display: none;}
			.fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
			input[type="text"],input[type="password"]{padding-left:26px;}
			.checkbox{padding-left:21px;}
		</style>
	</head>
	
	
	<script type="text/javascript">
		/*function submitForm(frm)
		{
			frm.submit();
		}*/
		
		function regForm()
		{
		 var userName = document.getElementById("username").value;
		 var pwd = document.getElementById("password").value;
		 if(userName == "" || userName==null)
		 {
		  alert("用户名为空,请重新输入");
		  login_form.username.focus();//获取焦点
		  return;
		 }
		 else if( pwd=="" || pwd==null)
		 {
		  alert("密码为空,请重新输入");
		  login_form.password.focus();
		  return;
		 }
		 else
		 {
		 	var ruName = '<%=session.getAttribute("userName")%>';
		 	var rpwd = '<%=session.getAttribute("password")%>';
		 	alert(ruName+":"+rpwd);
		 	 if(ruName!=null && ruName!=userName)
		 	 {
		 	 	alert("用户名不正确，请重新输入");
		 	 	login_form.username.focus();
		 	 	return;
		 	 }
		 	 else if(rpwd!=null && rpwd!=pwd)
		 	 {
		 	 	alert("密码不正确，请重新输入");
		 	 	login_form.password.focus();
		 	 	return;
		 	 }
		 	 else
		 	 {
		 	    $("#login_form").attr("action","checkUserLogin.action");
		 	 }
         	}  
		 }
	</script>
	
	<body >
		<div class="form row">
			<form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" method="POST" action="">
				<h2 class="form-title">新用户注册</h2>
				<div class="col-sm-9 col-md-9">
					<div class="form-group">
						<i class="fa fa-user fa-lg"></i>
						<input class="form-control required" type="text" placeholder="请输入用户名" id="username" autofocus="autofocus" maxlength="20"/>
					</div>
					<div class="form-group">
							<i class="fa fa-lock fa-lg"></i>
							<input class="form-control required" type="password" placeholder="请输入密码" id="password" maxlength="8"/>
					</div>
					<div class="form-group">
						<input type="submit" id="loginSumbit" class="btn btn-success pull-right" value="Login" onclick="loginForm()"/>   
					</div>
				</div>
			</form>
		</div>
	</body>
</html>
