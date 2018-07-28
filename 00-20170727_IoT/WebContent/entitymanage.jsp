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

<script type="text/javascript" src="res/bootstrap-datetimepicker.min.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="res/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<link href="res/bootstrap-datetimepicker.min.css" rel="stylesheet">

</head>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style>
.dtree {
	position: fixed;
	float: right;
	width: 200px;
	border: 2px solid #000;
	background: #FAFAFA;
	z-index: 2;
	display: none;
}

.dtop {
	position: relative;
	height: 40%;
	width: 100%;
}

.dvalue {
	float: right;
	width: 25%;
	margin-top: 1%;
	margin-right: 5%;
}

.dpic {
	float: left;
	width: 18%;
	height: 75%;
	margin-bottom: 0;
	margin-left: 5%;
}

.dinfo {
	float: left;
	margin: 1% 0 0 10%;
	height: 75%;
	width: 40%;
	margin-left: 70px;
	height: 75%;
}

.ddata {
	position: relative;
	width: 100%;
	height: 55%;
	margin-top: 1%;
	border-top: 2px solid #000;
}

.dbtn {
	float: right;
	width: 25%;
	height: 50%;
	margin-top: 1%;
	margin-right: 5%;
}

.dchoosestart {
	position: relative;
	width: 100%;
	margin-top: 10px;
}

.dchooseend {
	position: relative;
	width: 100%;
	margin-top: 10px;
}

.dshow {
	position: relative;
	width: 30%;
	margin-top: 10px;
}

.dtable {
	float: left;
	width: 68%;
	height: 100%;
}

.ddraw {
	width: 100%;
	height: 100%;
}

caption {
	text-align: center;
	font-size: 12px;
	font-weight: 700;
}

td,th {
	font-size: 10px;
}

ul {
	height: 13%;
	width: 100%;
}

li {
	display: inline;
	font-size: 10px;
	width: 25%;
}
</style>

<script type="text/javascript">
	function show(obj, id) {
		var type = document.getElementById("entityType").innerText;
		if (type == "古树") {
			var objDiv = $("#" + id + "");
			$(objDiv).css("display", "block");
			$(objDiv).css("left", event.clientX);
			$(objDiv).css("top", event.clientY + 10);
		}
	}
	function hide(obj, id) {
		var objDiv = $("#" + id + "");
		$(objDiv).css("display", "none");
	}
	function onMouseOver() {

	}

	$(function() {
		var pic;
		var type = document.getElementById("entityType").innerText;
		var status = document.getElementById("entityStatus").innerText;
		var statusType = document.getElementById("statusType").innerText;
		var entityId = document.getElementById("entityId").innerText;

		$.ajax({
					type : "POST",
					url : "nodeCollectDataQueryMap",
					async : false,
					data : {
						"entityId" : entityId
					},
					success : function(data) {
						var jsondata = eval("(" + data + ")");
						document.getElementById("recordTime").innerHTML=jsondata[0].recordtime;
						if (type == "垃圾桶") {
							Col = document.getElementById("trashDataCol");
							Col.rows[1].cells[1].innerHTML = jsondata[0].value1;
							Col.rows[1].cells[2].innerHTML = jsondata[0].value2;
						} else if (type == "古树") {
							Col = document.getElementById("treeDataCol");
							Col.rows[1].cells[1].innerHTML = jsondata[0].value2;
							Col.rows[1].cells[2].innerHTML = jsondata[0].value3;
						} else if (type == "井盖") {
							Col = document.getElementById("lidDataCol");
							var countLight = 0;
							var countAngle = 0;
							for ( var i = 0; i < jsondata.length; i++) {
								if (jsondata[i].sensorType == "光照传感器"
										&& countLight == 0) {
									Col.rows[1].cells[3].innerHTML = jsondata[i].value1;
									countLight = 1;
								}
								if (jsondata[i].sensorType == "倾角传感器"
										&& countAngle == 0) {
									Col.rows[1].cells[1].innerHTML = jsondata[i].value2;
									Col.rows[1].cells[2].innerHTML = 180-jsondata[i].value3;
									countAngle = 1;
								}
								if (countAngle == 1 && countLight == 1)
									break;
							}
						} else if (type == "下水道") {
							Col = document.getElementById("sewerDataCol");
							Col.rows[1].cells[1].innerHTML = jsondata[0].value1;
						}
					}
				});

		if (type == "垃圾桶") {
			target = document.getElementById("trash_col");
			target.style.display = "block";
			pic = "trash";
			if (status == "预警") {
				if (statusType == "垃圾桶满溢")
					pic = "trash_warning";
				else if (statusType == "垃圾桶高温")
					pic = "trash_tpt_warning";
			} else if (status == "报警") {
				if (statusType == "垃圾桶满溢")
					pic = "trash_danger";
				else if (statusType == "垃圾桶高温")
					pic = "trash_tpt_danger";
			}
		} else if (type == "古树") {
			target = document.getElementById("tree_col");
			target.style.display = "block";
			pic = "tree";
			if (status == "预警")
				pic = "tree_warning";
			else if (status == "报警")
				pic = "tree_danger";
		} else if (type == "井盖") {
			target = document.getElementById("lid_col");
			target.style.display = "block";
			pic = "lid";
			if (status == "预警")
				pic = "lid_warning";
			else if (status == "报警")
				pic = "lid_danger";
		} else if (type == "下水道") {
			target = document.getElementById("sewer_col");
			target.style.display = "block";
			pic = "sewer";
			if (status == "预警")
				pic = "sewer_warning";
			else if (status == "报警")
				pic = "sewer_danger";
		}
		$('#imgArea').attr('src', "res/image/" + pic + ".png");

		$('#datetimepicker1').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd hh:ii',
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			startView : 2,
			pickerPosition : 'top-right',
			endDate : new Date()
		}).on('changeDate', function(e) {
			var startTime = e.date;
			$('#datetimepicker2').datetimepicker('setStartDate', startTime);
		});

		$('#datetimepicker2').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd hh:ii',
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			startView : 2,
			pickerPosition : 'top-right',
			endDate : new Date()
		}).on('changeDate', function(e) {
			var endTime = e.date;
			$('#datetimepicker1').datetimepicker('setEndDate', endTime);
		});
	});
	
	function cl() {
		var entityId = document.getElementById("entityId").innerText;
	    var option1 = document.getElementById("hisData");
	    var option2 = document.getElementById("mtInfo");
	    var target = document.getElementById("content");
	    var st = $("#startTime").val();
		var et = $("#endTime").val();
		
		if(st==null && et==null){
	    	if(option1.checked)
	  	  		target.src = "AnmyEchart.jsp?entityId=" + entityId;
	  	  	else if(option2.checked)
	  	  		target.src = "maintainQueryEntity?maintain.entityid="+ entityId;
	  	  	else alert("请选择类型！");
	  	  	}
	  	else if(st==null)
	  		alert("请选择开始时间！");
	  	else if(et==null)
	  		alert("请选择结束时间！");
	  	else{
	  		if(option1.checked)
	  	  		target.src = "AnmyEchart.jsp?entityId=" + entityId+"&startTime="+st+"&endTime="+et;
	  	  	else if(option2.checked)
	  	  		target.src = "maintainQueryEntity?maintain.entityid="
					+ entityId+"&maintain.condition.startTime="+st+"&maintain.condition.endTime="+et;
	  	  	else alert("请选择类型！");
	    } 		
	}
</script>

<body
	style="margin: 0; padding: 0; background-color: #f1f1f1; overflow-y:hidden;">
	<div id="treeDetail" class="dtree">
		<table class="table table-condensed" style="width:200px;">
			<caption>古树详情</caption>
			<tbody>
				<s:iterator id="st" value="treeList" />
				<tr>
					<th style="width:40px;">名称</th>
					<td><s:property value="#st.treeName" />
					</td>
				</tr>
				<tr>
					<th>科属</th>
					<td><s:property value="#st.treeType" />
					</td>
				</tr>
				<tr>
					<th>树龄</th>
					<td><s:property value="#st.treeYears" />
					</td>
				</tr>
				<tr>
					<th>树高</th>
					<td><s:property value="#st.treeHeight" />
					</td>
				</tr>
				<tr>
					<th>树径</th>
					<td><s:property value="#st.treeDemeter" />
					</td>
				<tr>
					<th>备注</th>
					<td><s:property value="#st.remark" /></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="dtop">
		<h2 style="text-align:center">
			<b>监控点详情</b>
		</h2>
		<!--  
		<h1>
			<%String entityId = request.getParameter("entityId");
			out.println(entityId);%>
		</h1>
		-->
		<div id="tree_col" class="dvalue" style="display:none;">
			<table id="treeDataCol" class="table">
				<thead>
					<tr>
						<th>状态值</th>
						<th>俯仰角</th>
						<th>横滚角</th>
					</tr>
				</thead>
				<tbody>
					<tr class="success" style="color:blue;">
						<td>当前值</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="warning">
						<td>预警值</td>
						<td>20</td>
						<td>20</td>
					</tr>
					<tr class="danger">
						<td>报警值</td>
						<td>30</td>
						<td>30</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="lid_col" class="dvalue" style="display:none;">
			<table id="lidDataCol" class="table">
				<thead>
					<tr>
						<th>状态值</th>
						<th>俯仰角</th>
						<th>横滚角</th>
						<th>光照强度</th>
					</tr>
				</thead>
				<tbody>
					<tr class="success" style="color:blue">
						<td>当前值</td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<tr class="warning">
						<td>预警值</td>
						<td>20</td>
						<td>20</td>
						<td>18</td>
					</tr>
					<tr class="danger">
						<td>报警值</td>
						<td>30</td>
						<td>30</td>
						<td>28</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="trash_col" class="dvalue" style="display:none;">
			<table id="trashDataCol" class="table">
				<thead>
					<tr>
						<th>状态值</th>
						<th>高度差</th>
						<th>温度(°C)</th>
					</tr>
				</thead>
				<tbody>
					<tr class="success" style="color:blue">
						<td>当前值</td>
						<td></td>
						<td></td>
					</tr>
					<tr class="warning">
						<td>预警值</td>
						<td>150</td>
						<td>35</td>
					</tr>
					<tr class="danger">
						<td>报警值</td>
						<td>100</td>
						<td>40</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="sewer_col" class="dvalue" style="display:none;">
			<table id="sewerDataCol" class="table">
				<thead>
					<tr>
						<th>状态值</th>
						<th>水位值</th>
					</tr>
				</thead>
				<tbody>
					<tr class="success" style="color:blue">
						<td>当前值</td>
						<td></td>
					</tr>
					<tr class="warning">
						<td>预警值</td>
						<td>150</td>
					</tr>
					<tr class="danger">
						<td>报警值</td>
						<td>200</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="dpic">
			<a id="atree" href="#"
				onMouseOver="javascript:show(this,'treeDetail');"
				onMouseOut="javascript:hide(this,'treeDetail');"> <img
				id="imgArea" src="" style="display:block; width:100%; height:100%;" />
			</a>
		</div>

		<div class="dinfo">
			<s:iterator id="sn" value="entityList" />
			<ul class="list-inline">
				<li style="width:16%; font-weight:800">编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</li>
				<li id="entityId"><s:property value="#sn.entityId" /></li>

				<li style="width:16%;font-weight:800">监控类型:</li>
				<li id="entityType"><s:property value="#sn.entityType" /></li>
			</ul>
			<ul class="list-inline">
				<li style="width:16%;font-weight:800">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态:</li>
				<li id="entityStatus"><s:property value="#sn.entityStatus" />
				</li>

				<li style="width:16%;font-weight:800">事件类型:</li>
				<li id="statusType"><s:property value="#sn.statusType" /></li>
			</ul>
			<ul class="list-inline">
				<li style="width:16%;font-weight:800">时&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;间:</li>
				<li id="recordTime"></li>
				<li style="width:16%;font-weight:800">区&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;域:</li>
				<li><s:property value="#sn.area" /></li>
			</ul>
			<ul class="list-inline">
				<li style="width:16%;font-weight:800">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</li>
				<li><s:property value="#sn.detailAddress" />
				<li style="width:16%;font-weight:800">&nbsp;负&nbsp;&nbsp;责&nbsp;&nbsp;人&nbsp;:</li>
				<li><s:property value="#sn.user.userName" /></li>
			</ul>
			<ul class="list-inline">
				<li style="width:16%;font-weight:800">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</li>
				<li><s:property value="#sn.user.tel" /></li>

				<li style="width:16%;font-weight:800">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</li>
				<li><s:property value="#sn.remark" /></li>
			</ul>
		</div>


	</div>
	<div class="ddata">
		<div class="dbtn">
			<form class="form-inline">
				<div>
					<label class="checkbox-inline" style="font-size: 10px;"> <input
						type="radio" name="optionsRadios" id="hisData" value="option1">历史数据
					</label> <label class="checkbox-inline" style="font-size: 10px;"> <input
						type="radio" name="optionsRadios" id="mtInfo" value="option2">处理记录
					</label>
				</div>
				<div class="dchoosestart">
					<label for="start" style="font-size: 10px;">开始时间：</label>
					<!--指定 date标记-->
					<div class='input-group date' id='datetimepicker1'>
						<input class="form-control input-xs" type='text' id="startTime"
							data-date-format="yyyy-mm-dd hh:mm" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span> </span>
					</div>
				</div>

				<div class="dchooseend">
					<label for="end" style="font-size: 10px;">结束时间：</label>
					<div class='input-group date' id='datetimepicker2'>
						<input class="form-control input-xs" type='text' id="endTime"
							data-date-format="yyyy-mm-dd hh:mm" /> <span
							class="input-group-addon"> <span
							class="glyphicon glyphicon-calendar"></span> </span>
					</div>
				</div>
				<div class="dshow">
					<button id="sel" type="button" onclick="cl();"
						class="btn btn-default btn-sm">确定</button>
				</div>
			</form>
		</div>

		<div class="dtable">
			<div class="ddraw" style="border:1px;;">
				<iframe id="content" frameborder=0 src=""
					style="WIDTH: 100%; HEIGHT: 100%;"> </iframe>
			</div>
		</div>
	</div>


</body>
</html>