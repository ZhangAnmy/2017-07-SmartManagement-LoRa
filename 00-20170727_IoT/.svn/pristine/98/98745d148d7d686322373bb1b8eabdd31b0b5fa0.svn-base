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
<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js">
	
</script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
</script>

<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=addOdgFk4ZYicucuPyjscV5ipKNlVLW5">
	
</script>
<!--  <script type="text/javascript" src="http://api.map.baidu.com/library/RichMarker/1.2/src/RichMarker_min.js"> </script>-->

<!-- 引入jquery的库 -->
<script type="text/javascript" src="res/jquery-3.2.1.min.js">
	
</script>

<style>
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
	border: 1px solid #000;
	width: 100%;
	height: 100%;
	overflow: auto;
}

.div-a {
	position: absolute;
	right: 2px;
	top: 2px;
	background: #f1f1f1;
	width: 80%;
	height: 10%;
	background: rgba(0, 0, 0, 0);
}

.div-b {
	position: absolute;
	right: 2px;
	top: 10%;
	width: 25%;
	height: 90%;
	background: rgba(0, 0, 0, 0.5);
	color: white;
}

.div-c {
	position: absolute;
	left: 20px;
	top: 200px;
	background: #f1f1f1;
	width: 20px;
	height: 70%;
	background: rgba(0, 0, 0, 0);
}

.font_link {
	font-size: 15px;
	text-align: center;
}

ul {
	height: 4%;
	width: 95%;
	margin-top: 5%;
	margin-left: 5%;
	text-align: left;
}

li {
	display: inline;
	font-size: 10px;
}
</style>
</head>

<body>

	<div>
		<div id="div-map" style="width: 100%; height: 100%; float: left;">
			<form>
				<table height="100%" cellspacing="0" cellpadding="0" width="100%">
					<tr>
						<td valign="top" align="right">
							<div id="allmap"></div>
							<div id="cId" class="div-b"  style="display:none;">
								<input type="button" name="left_staus" id="left_staus"
									value="关闭" style="background: rgba(0, 0, 0, 0);font-size:12px;">
								<ul class="list-inline">
									<li style="width:20%; font-weight:800">编&nbsp;&nbsp;号:</li>
									<li id="showEntityId"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">监控类型:</li>
									<li id="showEntityType"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">状&nbsp;&nbsp;态:</li>
									<li id="showEntityStatus"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">事件类型:</li>
									<li id="showStatusType"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">时&nbsp;&nbsp;间:</li>
									<li id="showRecordTime"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">区&nbsp;&nbsp;域:</li>
									<li id="showArea"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">地&nbsp;&nbsp;址:</li>
									<li id="showDetailAddress"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">&nbsp;负责人:</li>
									<li id="showUserName"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">电&nbsp;&nbsp;话:</li>
									<li id="showTel"></li>
								</ul>
								<ul class="list-inline">
									<li style="font-weight:800">备&nbsp;&nbsp;注:</li>
									<li id="showRemark"></li>
								</ul>
									<div id="selectPath" style="cursor:pointer; float:left; font-size:12px;">
									到这里去
									</div>
							</div>


							<div id="aId" class="div-a">

								<table height="100%" cellspacing="0" cellpadding="0"
									width="100%" border="0" style=" margin-left: 0px;">
									<tr>
										<td align="center"><b>区域:</b> <select style="height:80%">
												<option value="000">--请选择--</option>
												<option value="1">岳麓区</option>
												<option value="2">天心区</option>
												<option value="3">开福区</option>
												<option value="4">雨花区</option>
												<option value="5">望城区</option>
												<option value="6">芙蓉区</option>
										</select>
										</td>

										<td align="center"><b>类型:</b> <select style="height:80%">
												<option value="000">-请选择-</option>
												<option value="古树">古树</option>
												<option value="井盖">井盖</option>
												<option value="下水道">下水道</option>
												<option value="垃圾桶">垃圾桶</option>
										</select>
										</td>

										<td align="center"><b>区间号:</b> <input type="text"
											style="width:80px" placeholder="10001"> -- <input
											type="text" style="width:80px" placeholder="19999">
										</td>
										<td class="checkbox" style="height:80%; border:0;"><b>状态:
										</b><label> <input type="checkbox"> <b>正常</b> </label> <label>
												<input type="checkbox"> <b>预警</b> </label> <label> <input
												type="checkbox"> <b>报警</b> </label> <label> <input
												type="checkbox"> <b>全部</b> </label>
										</td>
										<td align="center">
											<button type="button" class="btn btn-primary"
												id="querysubmit">确认</button>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	var map = new BMap.Map("allmap", {
		minZoom : 10,
		maxZoom : 20
	});
	var point = new BMap.Point(113.000, 28.210);
	map.centerAndZoom(point, 17);
	map.enableScrollWheelZoom(); ////启用滚轮放大缩小

	var navigationControl = new BMap.NavigationControl({
		// 靠左上角位置
		anchor : BMAP_ANCHOR_TOP_LEFT,
		// LARGE类型
		type : BMAP_NAVIGATION_CONTROL_LARGE,
		// 启用显示定位
		enableGeolocation : true
	});
	map.addControl(navigationControl);
	
	function searchDirection(yy1,yy2){

//	map.clearOverlays(); //目前不知道是干嘛用的
	//获取当前位置的坐标
	alert(yy1+"____==_____"+yy2);
	var geolocation = new BMap.Geolocation();
	var start_lng = 0.0;
	var start_lat = 0.0;
	geolocation.getCurrentPosition(function(location){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(location.point);
			map.addOverlay(mk);
			map.panTo(location.point);
			start_lng = location.point.lng;
			start_lat = location.point.lat;
			alert(start_lng+"_________"+start_lat);
			var start = new BMap.Point(location.point.lng, location.point.lat);
			//获取目的地的坐标
			var end = new BMap.Point(yy1, yy2);
			//设置导航方式(驾车,公交车,步行等)
			//BMAP_DRIVING_POLICY_LEAST_TIME 最短时间,BMAP_DRIVING_POLICY_LEAST_DISTANCE最短距离 ,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS 避免告诉
			var routePolicy = BMAP_DRIVING_POLICY_LEAST_TIME;
			//调用search函数
			var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true},policy: routePolicy});
			driving.search(start, end); 
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true});
	
	
}

	function addMarker(point, id, myIcon) {
		var maker = new BMap.Marker(point,{icon:myIcon});

		map.addOverlay(maker);//点击出现右边窗口
		maker.addEventListener("click",function() {
		$.ajax({
			type : "POST",
			url : "entityQueryAll",
			data : {"entity.entityId" : id},
			success : function(data) {
				var jsondata = eval("(" + data+ ")");//使用格式 jsondata[].area;
				document.getElementById("showEntityId").innerHTML = jsondata[0].entityId;
				document.getElementById("showEntityType").innerHTML = jsondata[0].entityType;
				document.getElementById("showEntityStatus").innerHTML = jsondata[0].entityStatus;
				document.getElementById("showStatusType").innerHTML = jsondata[0].statusType;
				document.getElementById("showArea").innerHTML = jsondata[0].area;
				document.getElementById("showDetailAddress").innerHTML = jsondata[0].detailAddress;
				document.getElementById("showUserName").innerHTML = jsondata[0].user.userName;
				document.getElementById("showTel").innerHTML = jsondata[0].user.tel;
				document.getElementById("showRemark").innerHTML = jsondata[0].remark;
				
				$("#selectPath").click(function() {
				x = jsondata[0].longitude;
				y = jsondata[0].latitude;
				searchDirection(x,y);
			});
				document.getElementById("cId").style.display = "block";
			}
			});
		});
		maker.addEventListener("mouseover",function() {
		$.ajax({
			type : "POST",
			url : "entityQueryAll",
			data : {"entity.entityId" : id},
			success : function(data) {
				var jsondata = eval("(" + data+ ")");
				var opts1 = {
				width : 250, // 信息窗口宽度
				height : 100, // 信息窗口高度
				title : jsondata[0].entityType+jsondata[0].entityId, // 信息窗口标题
				enableMessage : true//设置允许信息窗发送短息
	};
			var lid = '<div>'+'<table  style="font-size:12px;">'+
			'<thead>'+'<tr>'+'<th>状态值</th>'+'<th>水位值</th>'+'<th>航向角</th>'+'<th>俯仰角</th>'
			+'<th>横滚角</th>'+'<th>光照强度</th>'+'</tr>'+'</thead>'+'<tbody>'+'<tr>'+'<td>当前值</td>'+'<td>23</td>'
			+'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'</tr>'+'<tr>'+'<td>预警值</td>'+
			'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'</tr>'+'<tr>'+'<td>报警值</td>'+
			'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'</tr>'+'</tbody>'+'</table>'+'</div>';
			
			var tree = '<div>'+'<table  style="font-size:12px;">'+
			'<thead>'+'<tr>'+'<th>状态值</th>'+'<th>航向角</th>'+'<th>俯仰角</th>'
			+'<th>横滚角</th>'+'</tr>'+'</thead>'+'<tbody>'+'<tr>'+'<td>当前值</td>'+'<td>23</td>'
			+'<td>23</td>'+'<td>23</td>'+'</tr>'+'<tr>'+'<td>预警值</td>'+
			'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'</tr>'+'<tr>'+'<td>报警值</td>'+
			'<td>23</td>'+'<td>23</td>'+'<td>23</td>'+'</tr>'+'</tbody>'+'</table>'+'</div>';
			
			var trash = '<div>'+'<table  style="font-size:12px;">'+
			'<thead>'+'<tr>'+'<th>状态值</th>'+'<th>高度值</th>'+'<th>温度值</th>'+'</tr>'+'</thead>'
			+'<tbody>'+'<tr>'+'<td>当前值</td>'+'<td>23</td>'+'<td>23</td>'+'</tr>'+'<tr>'+
			'<td>预警值</td>'+'<td>23</td>'+'<td>23</td>'+'</tr>'+'<tr>'+'<td>报警值</td>'+
			'<td>23</td>'+'<td>23</td>'+'</tr>'+'</tbody>'+'</table>'+'</div>';
			if(jsondata[0].entityType == "井盖" || jsondata[0].entityType== "下水道")
				var infoWindow = new BMap.InfoWindow(lid, opts1); // 创建信息窗口对象 
			else if(jsondata[0].entityType == "古树")
				var infoWindow = new BMap.InfoWindow(tree, opts1); // 创建信息窗口对象 
			else if(jsondata[0].entityType == "垃圾桶")
				var infoWindow = new BMap.InfoWindow(trash, opts1); // 创建信息窗口对象 
			map.openInfoWindow(infoWindow,point); //开启信息窗口
			}
			});
		});
		
		maker.addEventListener("mouseout",function() {
			map.closeInfoWindow(); //关闭信息窗口
			});
		}

	var opts = {
		width : 250, // 信息窗口宽度
		height : 80, // 信息窗口高度
		title : "Message Window", // 信息窗口标题
		enableMessage : true//设置允许信息窗发送短息
	};
	function openInfo(e) {
		var content = '<div style="margin:0;line-height:20px;padding:2px; width:100px; height:200px">'
				+ '<div style="cursor:pointer">到这里去</div>' + '</div>';
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

	function drawPoint(longitude, latitude) {

		var pt = new BMap.Point(longitude, latitude);
	}

	$(function() {
		$('#querysubmit').click(function() {
			map.clearOverlays(); //清除地图上所有覆盖物
			$.ajax({

				type : "POST",
				url : "entityQueryAll",

				success : function(data) {
					jsondata = eval("(" + data + ")");

					var x1 = new Array();//经度
					var x2 = new Array();//纬度
					var x3 = new Array();//状态
					var x4 = new Array();//类型
					var x5 = new Array();//编号
					
					var myIcon;
					for ( var i = 0; i < jsondata.length; i++) {

						x1[i] = jsondata[i].longitude;
						x2[i] = jsondata[i].latitude;
						x3[i] = jsondata[i].entityStatus;
						x4[i] = jsondata[i].entityType;
						x5[i] = jsondata[i].entityId;
						var pointTemp = new BMap.Point(x1[i], x2[i]);
						map.centerAndZoom(pointTemp, 17);
						
						if (x4[i]== "垃圾桶") {
							myIcon = new BMap.Icon("res/image/trash_icon.png", new BMap.Size(28,42));  
							if (x3 == "预警")
							myIcon = new BMap.Icon("res/image/trash_warning_icon.png", new BMap.Size(28,42));
							else if (x3[i] == "报警")
							myIcon = new BMap.Icon("res/image/trash_danger_icon.png", new BMap.Size(28,42));
						}
						else if (x4[i] == "古树") {
							myIcon = new BMap.Icon("res/image/tree_icon.png", new BMap.Size(28,42));
							if (x3[i] == "预警")
							myIcon = new BMap.Icon("res/image/tree_warning_icon.png", new BMap.Size(28,42));
							else if (x3[i] == "报警")
							myIcon = new BMap.Icon("res/image/tree_danger_icon.png", new BMap.Size(28,42));
						} 
						else if (x4[i] == "井盖" || x4[i] == "下水道") {
							myIcon= new BMap.Icon("res/image/lid_icon.png", new BMap.Size(28,42));
							if (x3[i] == "预警")
							myIcon = new BMap.Icon("res/image/lid_warning_icon.png", new BMap.Size(28,42));
							else if (x3[i] == "报警")
							myIcon = new BMap.Icon("res/image/lid_danger_icon.png", new BMap.Size(28,42));
							} 
						
						addMarker(pointTemp, x5[i], myIcon);

					}

				}
			});
		});

		$('#left_staus').click(function() {
			document.getElementById("cId").style.display = "none";
		});

	});
</script>