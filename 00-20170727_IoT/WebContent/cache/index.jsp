<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
		#partion{width: 200px;height:200px;overflow: hidden;margin:0;font-family:"";}
	</style>
<title>IoT</title>
</head>
<body>
<div class="left" onclick ="window.open('map.jsp')" >
	   <img src="http://imgsrc.baidu.com/imgad/pic/item/caef76094b36acaf0accebde76d98d1001e99ce7.jpg" width="500" height="500" />
	<!--<a href="list.jsp"> a </a>
	<form id = "partion" name="form1" method="POST" action="list.jsp">  
	   <input type="submit" value="list view">  
   </form>-->
</div>
<div class="middle"></div>
<div class="right" onclick ="window.open('map.jsp')">
	   <img src="http://imgsrc.baidu.com/imgad/pic/item/caef76094b36acaf0accebde76d98d1001e99ce7.jpg" width="500" height="500" />
	<!--<form name="form" method="POST" action="map.jsp">  
	   <input type="submit" value="map view">  
	</form>-->
</div>

<style type="text/css">
body{
	padding: 0;
	margin: 0;
}
.left{
	width:500px;
	height: 500px;
	background:#FCC;
	position: absolute;
	left: 0;
	top:0;
}
.middle{
	height: 500px;
	background:#999;
	margin:0 200px 0 300px;
}
.right{
	width:500px;
	height: 500px;
	background:#3fc;
	position: absolute;
	right: 0;
	top:0;
}

</style>

</body>
</html>