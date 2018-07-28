<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
		<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
		<meta name="ProgId" content="FrontPage.Editor.Document">
		<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
		<!-- 包含 bootstrap 样式表 -->
		<link rel="stylesheet"
			href="https://apps.bdimg.com/libs/bootstrap/3.2.0/css/bootstrap.min.css">
		<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
		<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#main-nav {
	margin-left: 1px;
	width:100%;
}

#main-nav.nav-tabs.nav-stacked>li>a {
	padding: 10px 10px 5px 2px;
	font-size: 15px;
	font-weight: 600;
	color: #4A515B;
	background: #E9E9E9;
	background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	/*Mozilla*/
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #FAFAFA),
		color-stop(100%, #E9E9E9) ); /*Old gradient for webkit*/
	background: -webkit-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	/*new gradient for Webkit*/
	background: -o-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	/*Opera11*/
	background: -ms-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	/*IE10*/
	background: linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
	filter: progid :   DXImageTransform.Microsoft.gradient (   startColorstr
		= 
		 '#FAFAFA', endColorstr =   '#E9E9E9' );
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')"
		;
	border: 1px solid #D5D5D5;
	border-radius: 4px;
}

#main-nav.nav-tabs.nav-stacked>li>ul>li>a {
	font-size: 13px;
}

#main-nav.nav-tabs.nav-stacked>li>a:hover {
	color: #FFF;
	background: #66CDAA;
	background: -moz-linear-gradient(top, #4A515B 0%, #66CDAA 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #4A515B),
		color-stop(100%, #66CDAA) );
	background: -webkit-linear-gradient(top, #4A515B 0%, #66CDAA 100%);
	background: -o-linear-gradient(top, #4A515B 0%, #66CDAA 100%);
	background: -ms-linear-gradient(top, #4A515B 0%, #66CDAA 100%);
	background: linear-gradient(top, #4A515B 0%, #66CDAA 100%);
	filter: progid :   DXImageTransform.Microsoft.gradient (   startColorstr
		= 
		 '#4A515B', endColorstr =   '#66CDAA' );
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#66CDAA')"
		;
	border-color: #2B2E33;
}

#main-nav.nav-tabs.nav-stacked>li>ul>li>a:hover {
	color: #FFF;
	background: #CCFFFF;
	background: -moz-linear-gradient(top, #999999 0%, #CCFFFF 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #999999),
		color-stop(100%, #CCFFFF) );
	background: -webkit-linear-gradient(top, #999999 0%, #CCFFFF 100%);
	background: -o-linear-gradient(top, #999999 0%, #CCFFFF 100%);
	background: -ms-linear-gradient(top, #999999 0%, #CCFFFF 100%);
	background: linear-gradient(top, #999999 0%, #CCFFFF 100%);
	filter: progid :   DXImageTransform.Microsoft.gradient (   startColorstr
		= 
		 '#999999', endColorstr =   '#CCFFFF' );
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr='#999999', endColorstr='#CCFFFF')"
		;
	border-color: #2B2E33;
}

#main-nav.nav-tabs.nav-stacked>li {
	margin-bottom: 4px;
}

/*定义二级菜单样式*/
.secondmenu a {
	font-size: 14px;
	color: #4A515B;
	text-align: center;
}

body,html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "";
}

#r-result {
	width: 100%;
	margin-top: 5px;
}
</style>

<style>

.allmap {
	position: relative;
	color: #000;
	width: 100%;
	height: 100%;
	overflow: auto;
}

.div-a {
	position: absolute;
	right: 2px;
	top: 90px;
	background: #f1f1f1;
	width: 300px;
	height: 90%;
	
}

.div-b {
	position: absolute;
	right: 2px;
	top: 90px;
	background: #f1f1f1;
	width: 300px;
	height: 90%;
}

.div-c {
	position: absolute;
	rightt: 75%;
	top: 300px;
	background: #f1f1f1;
	width: 60px;
	height: 20%;
}

.font_link{
	font-size:15px;
	text-align:center;
}

</style>
</head>

<body>

<div>
	<table  width="100%" height="100%" cellspacing="0" cellpading="0">
		<tr height="5%" >
			<td colspan="2" width="100%" align="left" style="font-size:22px;COLOR: #3d5a6f; filter: shadow(color =   #5f7c8f, direction =   135);">
			<div>
			<img
				id="imgArea" src="res/title_bg.png" style="width:100%; height:100%;" />
			</div>
			</td>
		</tr>
		<!--  form id="frmtop" name="frmtop" method="post" action="" > -->
		<tr height="80%">
			<td width="11%" height="100%" align="left">
			<div id="div-nav"
			style="background: #E9E9E9; width: 100%; height: 100%; overflow: auto;">
				<div class="collapse navbar-collapse" id="myNavbar"
				style="width: 100%; padding-left: 1px; padding-right: 1px;">
				<ul id="main-nav" class="nav nav-tabs nav-stacked">
					<li>
						<a href="map.jsp" target="content" class="nav-header collapse" style="width: 100%;"> <span
							class="glyphicon glyphicon-home"></span> &nbsp;&nbsp;<b>主</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>页</b>
						</a>
					</li>

					<li>
						<a href="#entityMng" class="nav-header collapse"
							data-toggle="collapse" style="width: 100%;"> <span
							class="glyphicon glyphicon-inbox"></span> &nbsp;&nbsp;<b>监控点管理</b><b
							class="caret"></b> </a>

						<ul id="entityMng" class="nav nav-list secondmenu collapse"
							style="text-align: center">
							<li>
								<a href="entityQuery?paging.currentPage=1" target="content"><b>监控点列表</b>
								</a>
							</li>
							<li class="divider" style="font-size: 14px;"></li>
							<li>
								<a href="sensorNodeQuery?paging.currentPage=1" target="content"><b>节&nbsp;点&nbsp;列&nbsp;表&nbsp;</b> </a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="maintainQuery" target="content"><b>监控点维修记录</b>
								</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="#dataAly" class="nav-header collapse"
							data-toggle=collapse style="width: 100%;"> <span
							class="glyphicon glyphicon-stats"></span> &nbsp;&nbsp;<b>数&nbsp;据&nbsp;分&nbsp;析</b><b
							class="caret"></b> </a>

						<ul id="dataAly" class="nav nav-list secondmenu collapse"
							style="text-align: center">
							<!-- <li>
								<a href="path.jsp" target="content"><b>路&nbsp;径&nbsp;选&nbsp;择</b> </a>
							</li>
							-->
							<li class="divider" style="font-size: 14px;"></li>
							<li>
								<a href="historydata.jsp" target="content"><b>历&nbsp;史&nbsp;数&nbsp;据</b> </a>
							</li>
						</ul>
					</li>

					<li>
						<a href="#userMng" class="nav-header collapse"
							data-toggle="collapse" style="width: 100%;"> <span
							class="glyphicon glyphicon-user"></span> &nbsp;&nbsp;<b>用&nbsp;户&nbsp;管&nbsp;理</b><b
							class="caret"></b> </a>

						<ul id="userMng" class="nav nav-list secondmenu collapse"
							style="text-align: center">
							<li>
								<a href="userQueryAll" target="content"><b>用户信息管理</b> </a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="departmentQueryAll?paging.currentPage=1" target="content"><b>部&nbsp;&nbsp;门&nbsp;&nbsp;管&nbsp;&nbsp;理</b>
								</a>
							</li>
						</ul>
					</li>

					<li>
						<a href="#sysMng" class="nav-header collapse"
							data-toggle="collapse" style="width: 100%;"> <span
							class="glyphicon glyphicon-cog"></span> &nbsp;&nbsp;<b>系&nbsp;统&nbsp;管&nbsp;理</b><b
							class="caret"></b> </a>

						<ul id="sysMng" class="nav nav-list secondmenu collapse"
							style="text-align: center">
							<li>
								<a href="userinfo_change.jsp" target="content"><b>个人信息修改</b> </a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="password_change.jsp" target="content"><b>个人密码修改</b> </a>
							</li>
						</ul>
					</li>

					<li>
						<a href="login.jsp" style="width: 100%;"> <span
							class="glyphicon glyphicon-off"></span> &nbsp;&nbsp;<b>退&nbsp;出&nbsp;系&nbsp;统</b>
						</a>
					</li>
				</ul>
			</div>
	</div>
	<!--  div-nav-->
	</td>
	
	<td rowspan="2" width="89%">
		<div  id="div-map" style="width: 100%; height: 100%; float: left;">
		<iframe name="content" src="map.jsp" width="100%" height="100%"></iframe>
		</div><!--  div-map-->
	</td>
	</tr>
		<tr height="0">
			<td width="10%" align="left">
					<img src="res/logo.jpg" alt="" width="100%" >
			</td>

		</tr>
		<!--  /form>-->
		
		
		
	<tr height="5%">
		<td width="11%"  align="left">
		</td>
		<td width="89%" align="center" style="font-size:15px;border-top:solid 1px #61729E;">
			<a href="http://esnl.hnu.edu.cn/" target="_blank" class="font_link">湖南大学嵌入式与网络计算重点实验室</a>
			<br/>
			<font size="2">地址:湖南省长沙市岳麓区湖南大学 &nbsp;&nbsp; 电话：12345678901 &nbsp;&nbsp; 邮件：IoTTeam@hnu.edu.com</font>
		</td>
	</tr>
	
	</table>
	</div>	
	</body>
</html>

<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=addOdgFk4ZYicucuPyjscV5ipKNlVLW5">
</script>
<!--  <script type="text/javascript" src="http://api.map.baidu.com/library/RichMarker/1.2/src/RichMarker_min.js"> </script>-->

<!-- 引入jquery的库 -->
<script type="text/javascript" src="res/jquery-3.2.1.min.js">
</script>
<script type="text/javascript">

</script>
<script type="text/javascript">
var map = new BMap.Map("allmap", {
	minZoom : 10,
	maxZoom : 20
});
var point = new BMap.Point(113.000, 28.210);
map.centerAndZoom(point, 17);

function addMarker(point) {
	var marker = new BMap.Marker(point);
	map.addOverlay(marker);
}

var vectorMarker_orange = new BMap.Marker(new BMap.Point(113.000, 28.210), {
	// 指定Marker的icon属性为Symbol
		icon : new BMap.Symbol(BMap_Symbol_SHAPE_POINT, {
			scale : 1,//图标缩放大小
			fillColor : "orange",//填充颜色
			fillOpacity : 0.8
		//填充透明度
				})
	});
map.addOverlay(vectorMarker_orange);

var vectorMarker_green = new BMap.Marker(new BMap.Point(113.002, 28.209), {
	// 指定Marker的icon属性为Symbol
		icon : new BMap.Symbol(BMap_Symbol_SHAPE_POINT, {
			scale : 1,//图标缩放大小
			fillColor : "lightgreen",//填充颜色
			fillOpacity : 0.8
		//填充透明度
				})
	});
map.addOverlay(vectorMarker_green);

var vectorMarker_red = new BMap.Marker(new BMap.Point(113.001, 28.211), {
	// 指定Marker的icon属性为Symbol
		icon : new BMap.Symbol(BMap_Symbol_SHAPE_POINT, {
			scale : 1,//图标缩放大小
			fillColor : "red",//填充颜色
			fillOpacity : 0.8
		//填充透明度
				})
	});
map.addOverlay(vectorMarker_red);

var htm = "<div style='background:#E7F0F5;color:#0082CB;border:1px solid #333'>"
		+ "<img src='target.png' border='0' />" + "</div>";

var navigationControl = new BMap.NavigationControl( {
	// 靠左上角位置
	anchor : BMAP_ANCHOR_TOP_LEFT,
	// LARGE类型
	type : BMAP_NAVIGATION_CONTROL_LARGE,
	// 启用显示定位
	enableGeolocation : true
});
map.addControl(navigationControl);

vectorMarker_orange.addEventListener("click", showDiv);

function showDiv() {
	document.getElementById("div-a").style.display = "block";

}

function hidden() {

	document.getElementById("div-a").style.display = "none";
	//alert(document.getElementById("div").style.display)
}

vectorMarker_red.addEventListener("click", openInfo);

var opts = {
	width : 250, // 信息窗口宽度
	height : 80, // 信息窗口高度
	title : "Message Window", // 信息窗口标题
	enableMessage : true
//设置允许信息窗发送短息
};
function openInfo(e) {
	var content = "Node Info:";
	var p = e.target;
	var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
	var infoWindow = new BMap.InfoWindow(content, opts); // 创建信息窗口对象 
	map.openInfoWindow(infoWindow, point); //开启信息窗口
}

//根据经纬度定位
//用经纬度设置地图中心点
function theLocation() {
	if (document.getElementById("longitude").value != ""
			&& document.getElementById("latitude").value != "") {
		map.clearOverlays();
		var new_point = new BMap.Point(
				document.getElementById("longitude").value, document
						.getElementById("latitude").value);
		var marker = new BMap.Marker(new_point); // 创建标注
		map.addOverlay(marker); // 将标注添加到地图中
		map.panTo(new_point);
	}
}

//jquery退出全屏地图
$(document).ready(function() {
	$("#aId").click(function() {

		openFrameset();

	})
});
function closeFrameset() {
	var fs = parent.document.getElementsByTagName("frameset")[0];
	var fs1 = parent.document.getElementsByTagName("frameset")[1];
	var fs2 = parent.document.getElementsByTagName("frameset")[2];
	var fs3 = parent.document.getElementsByTagName("frameset")[3];
	fs.cols = "0,*";
	fs2.cols = "0,*";
	fs3.rows = "*,0";
	document.getElementById("aId").innerHTML = "a页面打开";
}
function openFrameset() {
	var fs = parent.document.getElementsByTagName("frameset")[0];
	var fs1 = parent.document.getElementsByTagName("frameset")[1];
	var fs2 = parent.document.getElementsByTagName("frameset")[2];
	var fs3 = parent.document.getElementsByTagName("frameset")[3];
	fs.cols = "*,700";
	fs2.cols = "100,*";
	fs3.rows = "*,400";
	document.getElementById("aId").innerHTML = "a页面关闭";
}
</script>