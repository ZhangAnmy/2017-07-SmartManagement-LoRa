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

 <link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script src="res/echarts.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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


.div-2 {
	backgroud: #f1f1f1;
	width: 95%;
	float: center;
	margin-left: 1%;
	margin-top: 15px;
	float: center;
}

.div-a {
	position: absolute;
	right: 10px;
	top: 25%;
	background: #f1f1f1;
	width: 68%;
	height: 75%;
}

.div-b {
	position: absolute;
	right: 70%;
	top: 25%;
	width: 28%;
	height: 65%;
	background: #f1f1f1;
	
}

.dshow{
	position: absolute;
	right: 0px;
	left: 14%;
	top: 15%;
	width: 95%;
	height: 15%;

}

table,th,td {
	text-align: left;
	font-size: 13px;
}
</style>

<body bgcolor="#f1f1f1">
	<div id="div1" class="div-2">
		<h3 style="text-align:center">
			<b>历史数据列表</b>
		</h3>
		<div class="dshow" style="">
				<form id="ddddd" method="post" action="" > 
				<table>
				<tr>
				<td style="text-align:left;">
				 <label style="font-size: 14px;">监控点:&nbsp;&nbsp;</label>
				</td>
				<td>
				
				<select style="height:35px; line-height:300px;" name="entityType" id="entityType" >
					<option value="垃圾桶">垃圾桶</option>
					<option value="古树">古树</option>
					<option value="井盖">井盖</option>
					<option value="下水道">下水道</option>
				</select>
				</td>
				
				<td >
					<label for="start" style="font-size: 13px;">&nbsp;&nbsp;开始时间:</label>
					<!--指定 date标记-->
				</td>
				<td class='input-group date' id='datetimepicker1'>
						<input class="form-control input-xs" type='text' id="startTime"
							name="startTime" data-date-format="yyyy-mm-dd hh:mm"/> <span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span> </span>
				</td>

					<td>
					<label for="end" style="font-size: 13px;">&nbsp;&nbsp;结束时间:</label>
					</td>
					<td class='input-group date' id='datetimepicker2'>
						<input class="form-control input-xs" type='text' id="endTime"
							name="endTime" data-date-format="yyyy-mm-dd hh:mm"/> <span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span> </span>&nbsp;&nbsp;
					</td>

				<td>
				<div>
					<button type="button" class="btn btn-default btn-sm" onclick="queryHistoryData()">确定</button>
				</div>
				</td>
				</tr>
				</table>
				</form>
			
		</div>
		<div class = "div-b">
		<table class="table" id="tableList" >
					<tr>
						<td>
							区域
						</td>
						<!--  td>
							正常
						</td>-->
						
						<td>
							预警
						</td>
						<td>
							报警
						</td>
					</tr>
					
					<tr>
						<td>
							岳麓区
						</td>
						
						<td>
						</td>
						
						<td>
						</td>
					</tr>
			
					<tr>
						<td>
							天心区
						</td>
						
						<td>
						</td>
						
						<td>
						</td>
					</tr>
					
					<tr>
						<td>
							雨花区
						</td>
						<td>
						</td>
						
						<td>
						</td>
					</tr>
					
					<tr>
						<td>
							开福区
						</td>
						
						<td>
						</td>
						
						<td>
						</td>
					</tr>
					
					<tr>
						<td>
							芙蓉区
						</td>
						
						<td>
						</td>
						
						<td>
						</td>
					</tr>
					
					<tr>
						<td>
							望城区
						</td>
						
						<td>
						</td>
						
						<td>
						</td>
					</tr>
					
					<tr>
						<td>
							平均
						</td>
						
						<td>
						</td>
						
						<td>
						</td>
					</tr>
					
					<tr>
						<td>
							总计
						</td>
						
						<td>
						</td>
						
						<td>
						</td>
					</tr>
					
				
					<!--<tr>
							<td>
							最少
						</td>
						<td>
							<s:property value="#sn.entityStatus" />
						</td>
						
							<td>
							
						</td>
						<td>
							<s:property value="#sn.entityStatus" />
						</td>
					</tr>-->
					
						<!--  <tr>
							<td>
							最多
						</td>
						<td>
							<s:property value="#sn.entityStatus" />
						</td>
						
							<td>
							
						</td>
						<td>
							<s:property value="#sn.entityStatus" />
						</td>
					</tr>-->
					
						<!--  <tr>
							<td>
							建议
						</td>
						<td>
							<s:property value="#sn.entityStatus" />
						</td>
						
							<td>
							
						</td>
						<td>
							<s:property value="#sn.entityStatus" />
						</td>
					</tr>-->
			</table>
		</div>
		</div>
		<div class = "div-a">
		    <div id="main" style="width:700px;height:380px;"></div>
		</div>
</body>

  <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));
        //myChart.setOption(option);
        $(function(){
          
          queryHistoryData();
		
		  $('#datetimepicker1').datetimepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd hh:ii',
			autoclose : true,
			todayBtn : true,
			todayHighlight : true,
			startView : 2,
			pickerPosition : 'botton-right',
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
			pickerPosition : 'botton-right',
			endDate : new Date()
		}).on('changeDate', function(e) {
			var endTime = e.date;
			$('#datetimepicker1').datetimepicker('setEndDate', endTime);
		});
        });
           
        function queryHistoryData()
        {
        	var entityType = document.getElementById("entityType").value;
        	var st = document.getElementById("startTime").value;
        	var et = document.getElementById("endTime").value;
        	
        	$.ajax( {  
     	        
                 type : "POST",  
                 url : "nodeCollectDataCountQuery?entityType="+entityType+"&condition.startTime="+st+"&condition.endTime="+et,  
                 success : function(data) {  
                	 //alert(data);
					var jsondata = eval("("+data+")");
                    var areaName = new Array();//岳麓区等
                    var normalValue = new Array(); //正常值
                    var warnValue = new Array(); //预警值
                    var alarmValue = new Array(); //报警值
                    var warnCount=0;
                    var alarmCount=0;
                    
                    areaName=['岳麓','天心','雨花','开福','芙蓉','望城'];  
                    
                    Col = document.getElementById("tableList");

                    for(var i=0;i<jsondata.length;i++)//area
                    {
                       warnValue.push(jsondata[i][1]);//预警值
                       alarmValue.push(jsondata[i][2]);//报警值
                       Col.rows[i+1].cells[1].innerHTML = jsondata[i][1];
					   Col.rows[i+1].cells[2].innerHTML = jsondata[i][2];
					   warnCount=warnCount+jsondata[i][1];
					   alarmCount=alarmCount+jsondata[i][2];
                    }
                    Col.rows[7].cells[1].innerHTML = (warnCount/areaName.length).toFixed(2);
					Col.rows[7].cells[2].innerHTML = (alarmCount/areaName.length).toFixed(2);
					Col.rows[8].cells[1].innerHTML = warnCount;
					Col.rows[8].cells[2].innerHTML = alarmCount;
                    buildData(areaName,warnValue,alarmValue);
                 }  
             });
        }
       
      function buildData(areaName,warnValue,alarmValue)
      {
        var columLabel = ['历史数据区'];
        var chart = document.getElementById('main');
        var echart = echarts.init(chart);
        var option = {
        		title : {
        	        text: columLabel,
        	         x: 'center',
        	        align: 'right'
        	    },
          tooltip : {
            trigger: 'axis',
            axisPointer : {
              type : 'shadow'
            }
          },
         
          legend: {
            data:['预警次数','报警次数'],
            x:'left'
          },
          
          /*dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 0,
	            end: 100
	        }
    	 ],*/
          grid: {
            left: '5%',
            right: '5%',
            bottom: '5%',
            top:'15%',
            containLabel: true
          },
          toolbox: {
  	        show : true,
  	        feature : {
  	        	//dataZoom:{yAxisIndex:'none'},
  	            mark : {show: true},
  	            dataView : {show: true, readOnly: false},
  	            magicType : {show: true, type: ['line', 'bar']},
  	            restore : {show: true},
  	            saveAsImage : {show: true}
  	        }
  	    },
  	    calculable : true,
          xAxis : [
            {
              axisLable:{
              show: true,
              rotate: 45,
              interval:0,
              },
              min:0,
              type : 'category',
              data : areaName
            }
          ],
          yAxis : [
            {
              min:0,
              type : 'value'
            }
          ],
          series :[ {
            name:'预警次数',
            type:'bar',
            data: warnValue
            },
            {
            name:'报警次数',
            type:'bar',
            data: alarmValue
            }
          ] 
        };
        echart.setOption(option);
      }
    </script>
</html>
