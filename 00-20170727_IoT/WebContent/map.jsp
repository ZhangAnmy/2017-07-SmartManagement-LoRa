
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
	width: 27%;
	height: 10%;
	background: rgba(0, 0, 0, 0);
}

.div-b {
	position: absolute;
	right: 2px;
	top: 10%;
	width: 27%;
	height: 53%;
	background: rgba(0, 0, 0, 0.7);
	color: white;
}

.div-c {
	position: absolute;
	right: 2px;
	top: 63%;
	width: 27%;
	height: 38%;
	background: rgba(0, 0, 0, 0.5);
	color: white;
}

.div-1 {
	backgroud: #f00;
	width: 100%;
	position: relative;
}

.font_link {
	font-size: 15px;
	text-align: center;
}

.datatb th {
	text-align: center;
	width: 10%;
}

.datatb tr {
	text-align: center;
}

.datatb th {
	text-align: center;
	width: 10%;
}

.tablelist td {
	height: 20px;
	width: 10%;
	text-align: center;
	font-size: 10px;
	color: white;
}

.tablelist tr {
	cursor: pointer;
}

.tablelist th {
	text-align: center;
	font-size: 10px;
}

ul {
	height: 2%;
	width: 95%;
	margin-top: 5%;
	margin-left: 5%;
	text-align: left;
}

li {
	display: inline;
	font-size: 10px;
}

h5 {
	text-align: center;
	font-weight: 700;
}
</style>
</head>

<body>

	<div>
		<div id="div-map" style="width: 100%; height: 100%; float: left;">
			<table class="tb1" height="100%" cellspacing="0" cellpadding="0"
				width="100%">
				<tr>
					<td valign="top" align="right">
						<div id="allmap"></div>
						<div id="cId" class="div-b" style="display:none;">
							<input type="button" name="left_staus" id="left_staus" value="关闭"
								style="background: rgba(0, 0, 0, 0);font-size:12px;">
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

							<div>
								<a id="info" href=""
									style="float:left;margin-top:5%; margin-left:45%; font-size:12px; 
										font-weight:700; color:white;">进入详情</a>
							</div>
						</div>

						<div id="warninginfo" class="div-c">
							<div id="div1" class="div-1">
								<h6 style="text-align:center">
									<b>告警信息</b>
								</h6>
								<div class="table1">
									<center>
										<table id="tableList1" class="tablelist" border="0"
											cellspacing="0" cellpadding="0" style="width:95%">
										</table>
									</center>
								</div>
							</div>
						</div>

						<div id="aId" class="div-a">
							<form id="formmap1" method="post" action="">
								<table class="tb2" height="100%" cellspacing="0" cellpadding="0"
									width="100%" border="0" style=" margin-left: 0px;">
									<tr>
										<td><select style="height:60% width:80px"
											name="entity.area" class="form-control">
												<option value="">-区域-</option>
												<option value="岳麓">岳麓</option>
												<option value="天心">天心</option>
												<option value="开福">开福</option>
												<option value="雨花">雨花</option>
												<option value="望城">望城</option>
												<option value="芙蓉">芙蓉</option>
										</select></td>

										<td><select style="height:60% width:80px"
											name="entity.entityType" class="form-control">
												<option value="">-类型-</option>
												<option value="古树">古树</option>
												<option value="井盖">井盖</option>
												<option value="下水道">下水道</option>
												<option value="垃圾桶">垃圾桶</option>
										</select></td>



										<td><select style="height:60% width:80px"
											name="entity.entityStatus" class="form-control">
												<option value="">-状态-</option>
												<option value="正常">正常</option>
												<option value="预警">预警</option>
												<option value="告警">告警</option>
										</select></td>

										<td align="center">
											<button type="button" class="btn btn-primary"
												id="querysubmit">确认</button></td>
									</tr>
								</table>
							</form>
						</div></td>
				</tr>
			</table>

		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	var map = new BMap.Map("allmap", {
		minZoom : 10,
		maxZoom : 20
	});
	var point = new BMap.Point(112.951354, 28.184998);
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
	showMap();
			
	function showMap(s){
			$.ajax({
				type : "POST",
				url : "entityQueryAll",
				data: s,
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
							if (x3[i] == "预警")
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
						else if (x4[i] == "井盖") {
							myIcon= new BMap.Icon("res/image/lid_icon.png", new BMap.Size(28,42));
							if (x3[i] == "预警")
							myIcon = new BMap.Icon("res/image/lid_warning_icon.png", new BMap.Size(28,42));
							else if (x3[i] == "报警")
							myIcon = new BMap.Icon("res/image/lid_danger_icon.png", new BMap.Size(28,42));
							}
						else if (x4[i] == "下水道") {
							myIcon= new BMap.Icon("res/image/sewer_icon.png", new BMap.Size(28,42));
							if (x3[i] == "预警")
							myIcon = new BMap.Icon("res/image/sewer_warning_icon.png", new BMap.Size(28,42));
							else if (x3[i] == "报警")
							myIcon = new BMap.Icon("res/image/sewer_danger_icon.png", new BMap.Size(28,42));
							}  
						
						addMarker(pointTemp, jsondata[i], myIcon);

					}

				}
			});
			}
		
	$(function() {	
		$('#querysubmit').click(function() {
			var param = $('#formmap1').serialize();
			//alert(param);
			map.clearOverlays(); //清除地图上所有覆盖物
			showMap(param);
		});

		$('#left_staus').click(function() {
			document.getElementById("cId").style.display = "none";
		});
	});	
	
	var startChoose = 0;
	var endChoose = 0;

	var start_lng = 0.0;
	var start_lat = 0.0;
	
	var end_lng = 0.0;
	var end_lat = 0.0;
	
	function searchDirection(start_lng,start_lat,end_lng,end_lat){
	startChoose = 0;
	endChoose = 0;
	map.clearOverlays(); //清除地图上所有覆盖物
	//所选位置坐标
	//alert("起点："+start_lng+","+start_lat+"终点："+end_lng+","+end_lat);
	var start = new BMap.Point(start_lng, start_lat);
	var end = new BMap.Point(end_lng, end_lat);
	//BMAP_DRIVING_POLICY_LEAST_TIME 最短时间,BMAP_DRIVING_POLICY_LEAST_DISTANCE最短距离 ,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS 避免告诉
	var routePolicy = BMAP_DRIVING_POLICY_LEAST_TIME;
	//调用search函数
	var walking = new BMap.WalkingRoute(map, {renderOptions:{map: map, autoViewport: true},policy:routePolicy});
	walking.search(start, end); 
	}

	function addMarker(point, entity, myIcon) {
		var maker = new BMap.Marker(point,{icon:myIcon});

		map.addOverlay(maker);
		//点击出现右边窗口
		maker.addEventListener("click",function() {
				document.getElementById("showEntityId").innerHTML = entity.entityId;
				document.getElementById("showEntityType").innerHTML = entity.entityType;
				document.getElementById("showEntityStatus").innerHTML = entity.entityStatus;
				document.getElementById("showStatusType").innerHTML = entity.statusType;
				document.getElementById("showArea").innerHTML = entity.area;
				document.getElementById("showDetailAddress").innerHTML = entity.detailAddress;
				document.getElementById("showUserName").innerHTML = entity.user.userName;
				document.getElementById("showTel").innerHTML = entity.user.tel;
				document.getElementById("showRemark").innerHTML = entity.remark;
				document.getElementById("info").href = "entityTreeQueryById?entityId="+entity.entityId;
				document.getElementById("cId").style.display = "block";
			});
			
		maker.addEventListener("mouseover",function() {

		$.ajax({
			type : "POST",
			url : "nodeCollectDataQueryMap",
			data : {"entityId" : entity.entityId},
			success : function(data) {
			var jsondata = eval("(" + data+ ")");

			if(entity.entityType == "井盖")
			{	
				//井盖两个传感器判断
				var countLight = 0;
				var countAngle = 0;
				var light,angle;
				for( var i = 0; i < jsondata.length; i++)
					{
						if(jsondata[i].sensorType == "光照传感器" && countLight == 0){
							light = jsondata[i];
							countLight = 1;
						}
						if(jsondata[i].sensorType == "倾角传感器" && countAngle == 0){
							angle = jsondata[i];
							countAngle = 1;
						}
						if(countAngle == 1 && countLight == 1) break;	
				}
				var lid = '<div><h5>'+entity.entityId+entity.entityType+'</h5><table class="datatb" style="font-size:12px;">'+
			'<thead>'+'<tr>'+'<th>状态值</th>'+'<th>俯仰角</th>'
			+'<th>横滚角</th>'+'<th>光照值</th>'+'</tr>'+'</thead>'+'<tbody>'+'<tr style="color:blue;">'+'<td>当前值</td>'
			+'<td>'+angle.value2+'</td>'+'<td>'+(180-angle.value3)+'</td><td>'+light.value1+'</td></tr>'+'<tr>'+'<td>预警值</td>'+
			'<td>20</td>'+'<td>20</td>'+'<td>18</td>'+'</tr>'+'<tr>'+'<td>报警值</td>'+
			'<td>30</td>'+'<td>30</td>'+'<td>28</td>'+'</tr>'+'</tbody>'+'</table>'+'</div>'+
			'<a id="selectStart" href="javascript:Start(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="font-size:12px;">作为起点'+'</a>'+
			'<a id="selectEnd" href="javascript:End(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="float:right; margin-right:50%; font-size:12px;">作为终点'+'</a>';
		
				var infoWindow = new BMap.InfoWindow(lid); // 创建信息窗口对象 
			}
			else if(entity.entityType == "下水道"){
				var sewer = '<div><h5>'+entity.entityId+entity.entityType+'</h5><table class="datatb" style="font-size:12px;">'+
			'<thead>'+'<tr>'+'<th>状态值</th>'+'<th>水位值</th>'+'</tr>'+'</thead>'+'<tbody>'+'<tr style="color:blue;">'+'<td>当前值</td>'
			+'<td>'+jsondata[0].value1+'</td>'+'</tr>'+'<tr>'+'<td>预警值</td>'+'<td>150</td>'+'</tr>'+'<tr>'+'<td>报警值</td>'+
			'<td>200</td>'+'</tr>'+'</tbody>'+'</table>'+'</div>'+
			'<a id="selectStart"  href="javascript:Start(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="font-size:12px;">作为起点'+'</a>'+
			'<a id="selectEnd" href="javascript:End(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="float:right; margin-right:50%;font-size:12px;">作为终点'+'</a>';			
			
				var infoWindow = new BMap.InfoWindow(sewer); // 创建信息窗口对象
			}
			else if(entity.entityType == "古树"){
				
				var tree = '<div><h5>'+entity.entityId+entity.entityType+'</h5><table class="datatb" style="font-size:12px;">'+
			'<thead>'+'<tr>'+'<th>状态值</th>'+'<th>俯仰角</th>'
			+'<th>横滚角</th>'+'</tr>'+'</thead>'+'<tbody>'+'<tr style="color:blue;">'+'<td>当前值</td>'
			+'<td>'+jsondata[0].value2+'</td>'+'<td>'+jsondata[0].value3+'</td>'+'</tr>'+'<tr>'+'<td>预警值</td>'+
			'<td>20</td>'+'<td>20</td>'+'</tr>'+'<tr>'+'<td>报警值</td>'+
			'<td>30</td>'+'<td>30</td>'+'</tr>'+'</tbody>'+'</table>'+'</div>'+
			'<a id="selectStart"  href="javascript:Start(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="font-size:12px;">作为起点'+'</a>'+
			'<a id="selectEnd" href="javascript:End(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="float:right; margin-right:50%;font-size:12px;">作为终点'+'</a>';
			
				var infoWindow = new BMap.InfoWindow(tree); // 创建信息窗口对象 
			}
			else if(entity.entityType == "垃圾桶"){
					
				var trash = '<div><h5>'+entity.entityId+entity.entityType+'</h5><table class="datatb" style="font-size:12px;">'+
			'<thead>'+'<tr>'+'<th>状态值</th>'+'<th>高度差</th>'+'<th>温度值</th>'+'</tr>'+'</thead>'
			+'<tbody>'+'<tr style="color:blue;">'+'<td>当前值</td>'+'<td>'+jsondata[0].value1+'</td>'+'<td>'+jsondata[0].value2+'</td>'+'</tr>'+'<tr>'+
			'<td>预警值</td>'+'<td>150</td>'+'<td>35</td>'+'</tr>'+'<tr>'+'<td>报警值</td>'+
			'<td>100</td>'+'<td>40</td>'+'</tr>'+'</tbody>'+'</table>'+'</div>'+
			'<a id="selectStart"  href="javascript:Start(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="font-size:12px;">作为起点'+'</a>'+
			'<a id="selectEnd" href="javascript:End(this,'+entity.entityId+','+entity.longitude+','+entity.latitude+
			');" style="float:right; margin-right:50%; font-size:12px;">作为终点'+'</a>';
			
				var infoWindow = new BMap.InfoWindow(trash); // 创建信息窗口对象
			} 
			map.openInfoWindow(infoWindow,point); //开启信息窗口
			
			}
		});
		});
		}

		
		function Start(obj,entityId, longitude, latitude){
				startChoose = 1;
				start_lng = longitude;
				start_lat = latitude;
				alert( entityId + " 作为起点!\n" +
						"经度：" + start_lng +
						"\n纬度：" + start_lat);
				if(endChoose == 1)
					searchDirection(start_lng,start_lat,end_lng,end_lat);
		}
			
		function End(obj,entityId, longitude, latitude){
				endChoose = 1;
				end_lng = longitude;
				end_lat = latitude;
				alert(entityId + " 作为终点!\n" +
						"经度：" + end_lng +
						"\n纬度：" + end_lat);
				if(startChoose == 1)
					searchDirection(start_lng,start_lat,end_lng,end_lat);
		}

//告警信息处理	
//	var warningNum = 30000;
	var t;	
	$(function() {
		warning();
		
		t=3000;
		setInterval(warning,t);
		t1=setInterval("show1()",1000);
     	
    	$("#tableList1").mouseover(function(){
        clearInterval(t1);
    	}).mouseout(function(){
        t1=setInterval("show1()",1000);
   		});
   		
		});

	function warning(){
		var table1 = $('table[id=tableList1]');
		//warningNum=30000;
		$("#tableList1").empty(); 
		$.ajax({  
			type : "POST",  
			url : "entityQueryAll",  
			data : {"entity.entityStatus" : "报警"},
			async : false,  
			success : function (data) {
				var jsondata = eval("(" + data+ ")");
				//warningNum = warningNum+jsondata.length;
				for ( var i = 0; i < jsondata.length; i++) {
				var trtd = $('<tr onmouseover="sel(this)" onmouseout="cle(this)" onclick="show2('+jsondata[i].entityId+')"><td>'+
							jsondata[i].entityId+'</td><td>'+jsondata[i].entityType+'</td><td style="color:red;">报警</td><td>'+jsondata[i].statusType+'</td></tr>');
				trtd.appendTo(table1);
				}
		}  
		}); 
		
		$.ajax({  
			type : "POST",  
			url : "entityQueryAll",  
			data : {"entity.entityStatus" : "预警"},
			async : false,    
			success : function(data) {
				var jsondata = eval("(" + data+ ")");
				//warningNum = warningNum+jsondata.length;
				for ( var i = 0; i < jsondata.length; i++) {
				var trtd = $('<tr style="cursor:pointer;" onmouseover="sel(this)" onmouseout="cle(this)" onclick="show2('+jsondata[i].entityId+')"><td>'+
							jsondata[i].entityId+'</td><td>'+jsondata[i].entityType+'</td><td>预警</td><td>'+jsondata[i].statusType+'</td></tr>');
				trtd.appendTo(table1);
				}
		}  
		});
		}   		
		
		
	function sel(obj){
			obj.style.backgroundColor="rgba(0, 0, 0, 0.8)";
		}
	function cle(obj){
			obj.style.backgroundColor="rgba(0, 0, 0, 0)";
		}
 
	function show1(){
		$("#tableList1 tr:first").appendTo($("#tableList1"));
	}
	
	function show2(entityId){
		data = "entity.entityId=" +entityId;
		map.clearOverlays();
		showMap(data);
	}

</script>