<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="s" uri="/WEB-INF/tld/struts-tags.tld "%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="expires" content="0">
    <title>ECharts</title>
    <link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
    <script src="res/echarts.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="js/qikoo.js"></script>
</head>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<style>
.dselect {

	position: absolute;
	right:1%;
	top: 1%;
	background: #f1f1f1;
	width: 3%;
	height: 10%;
	background: rgba(0, 0, 0, 0.5);
	
}
</style>
<script type="text/javascript">


</script>
<body>
    <div id="main" style="width:100%;height:300px;"></div>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));
        var entityId = <%= request.getParameter("entityId")%>;
        var st = "<%= request.getParameter("startTime")%>";
        var et = "<%= request.getParameter("endTime")%>";
        //alert("time is:"+st+","+et);
       $(function(){
        var params="entityId="+entityId+"&condition.startTime="+st+"&condition.endTime="+et;
        
   	 	$.ajax( {  
         type : "POST",  
         url : "nodeCollectDataQuery",  
         data: params,
         success : function(data) {  
			var jsondata = eval("("+data+")");
            //var value1= jsondata[0].value1
            var sensor= jsondata[0].sensorType;; 
            var length= jsondata.length;
             var columLabel = [];
       		 var columName = new Array();
       		 var columName1 = new Array();
       		 var columnValue1 = new Array();
       		 var columnValue2 = new Array();
       		 var columnValue3 = new Array();
       		 var sensorData = new Array();
       		 var time="";
        	 var value1="";
        	 var value2="";
        	 var value3="";
        	 var value4="";
        	 var value5="";
             for(var i=0;i<length;i++)
             {
            	sensor=jsondata[i].sensorType;
            	time = jsondata[i].recordtime;
            	time = time.substring(0,time.length-3);
            	
	            if(entityId.toString().startsWith("2"))//井盖
	            {
	            	if(sensor=="倾角传感器")
	            	{
	            		columName.push(time);
		            	if(jsondata[i].value1!="")
		            	{
		            		value1 = jsondata[i].value1;
		            		columnValue1.push(value1);
		            	}
		            	
		            	if(jsondata[i].value2!="")
		            	{
		            		value2 = jsondata[i].value2;
		            		columnValue2.push(value2);
		            	}
		            	
		            	if(jsondata[i].value3!="")
		            	{
		            		value3 = jsondata[i].value3;
		            		columnValue3.push(value3);
		            	}
	            	}
	            	
	            	if(sensor=="光照传感器")
	            	{
	            		columName1.push(time);
	            		value4 = jsondata[i].value1;
	            		sensorData.push(value4);
	            	}
	            }	
	            else
	            {
	            	columName.push(time);
	            	if(jsondata[i].value1!="")
	            	{
	            		value1 = jsondata[i].value1;
	            		columnValue1.push(value1);
	            	}
	            	
	            	if(jsondata[i].value2!="")
	            	{
	            		value2 = jsondata[i].value2;
	            		columnValue2.push(value2);
	            	}
	            	
	            	if(jsondata[i].value3!="")
	            	{
	            		value3 = jsondata[i].value3;
	            		columnValue3.push(value3);
	            	}
	            }	
            	//i=i+6;
             }
		   
		    if(!entityId.toString().startsWith("2") && !entityId.toString().startsWith("4"))
            {
             	if(sensor=="水位传感器")//下水道
             	{
             		sensor=sensor+"(mm)";
             		columLabel=[sensor];
             		buildChart(columLabel,columName,columnValue1);
             	}
             	else if(sensor=="倾角传感器")//古树
             	{
             		sensor=sensor+"(度)";
             		columLabel=[sensor];
             		buildChart2(columLabel,columName,columnValue1,columnValue2,columnValue3);
             	}
            }
            else
            {
             	if(entityId.toString().startsWith("2"))//井盖
             	{
             		columLabel=['倾角/光照(度/Lux)'];
             		buildChart4(columLabel,columName,columName1,columnValue1,columnValue2,columnValue3,sensorData);
             	}
             	else if(entityId.toString().startsWith("4"))//垃圾桶
             	{
             		columLabel=['超声波传感器(mm/摄氏度)'];
             		buildChart3(columLabel,columName,columnValue1,columnValue2);
             	}
             	 //console.info(arrData);
          		 //columnValue1.push(eval('(' + ("{'name':'"+columLabel+"','type':'line','data':["+arrData+"]}") + ')'));
             	//buildChart3(columLabel,columName,columnValue);
            }
         }  
     	});  
     });
      
      function buildChart(columLabel,columName,columnValue)
      {
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
            data:columLabel,
            x:'left'
          },
          
          dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 0,
	            end: 100
	        }
    	 ],
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
              data : columName
            }
          ],
          yAxis : [
            {
              min:0,
              type : 'value'
            }
          ],
          series :[ {
            name:columLabel,
            type:'line',
            data: columnValue
            }
          ] 
        };
        echart.setOption(option);
      }
      
       function buildChart2(columLabel,columName,columnValue1,columnValue2,columnValue3)
       {
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
            data:['航向角','俯仰角','横滚角'],
            x:'left'
          },
          
          dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 0,
	            end: 100
	        }
    	 ],
          grid: {
            left: '5%',
            right: '5%',
            bottom: '5%',
            top:'20%',
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
              type : 'category',
              data : columName
            }
          ],
          yAxis : [
            {
              min:0,
              type : 'value'
            }
          ],
          series: [
          {
          	name:'航向角',
          	type:'line',
          	data:columnValue1
          },
          {
          	name:'俯仰角',
          	type:'line',
          	data:columnValue2
          },
          {
          	name:'横滚角',
          	type:'line',
          	data:columnValue3
          }
          ]
        };
        echart.setOption(option);
      }
      
       function buildChart3(columLabel,columName,columnValue1,columnValue2)
       {
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
            data:['高度','温度'],
            x:'left'
          },
          
          dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 0,
	            end: 100
	        }
    	 ],
          grid: {
            left: '5%',
            right: '5%',
            bottom: '5%',
            top:'20%',
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
              },
              type : 'category',
              data : columName
            }
          ],
          yAxis : [
            {
              min:0,
              name:'高度(mm)',
              type : 'value'
            },
            {
              min:0,
              max:45,
              name:'温度(摄氏度)',
              //nameLocation: 'start',
              type : 'value',
              //inverse: true
            }
          ],
          series: [
          {
          	name:'高度',
          	type:'line',
          	animation: false,
            /*areaStyle: {
                normal: {}
            },*/
          	data:columnValue1
          },
          {
          	name:'温度',
          	type:'line',
          	yAxisIndex:1,
            animation: false,
            /*areaStyle: {
                normal: {}
            },*/
          	data:columnValue2
          }
          ]
        };
        echart.setOption(option);
      }
      
       function buildChart4(columLabel,columName,columName1,columnValue1,columnValue2,columnValue3,sensorData)
       {
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
           data:['航向角','俯仰角','横滚角','光照'],
           x:'left'
          },
          
          dataZoom: [
	        {
	            show: true,
	            realtime: true,
	            start: 0,
	            end: 100
	        }
    	 ],
          grid: {
            left: '5%',
            right: '5%',
            bottom: '5%',
            top:'20%',
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
              //interval:100,
              },
              type : 'category',
              data : columName
            },
            {
              axisLable:{
              show: true,
              rotate: 45,
              },
              type : 'category',
              data : columName1
            }
          ],
          yAxis : [
            {
              min:0,
              max:90,
              name:'角度(度)',
              type : 'value'
            },
            {
              min:0,
              max:600,
              name:'光照(Lux)',
              type : 'value',
              //inverse: true
            }
          ],
          series: [
          {
	          	name:'航向角',
	          	type:'line',
	          	animation: false,
	          	data:columnValue1
	      },
	      {
	          	name:'俯仰角',
	          	type:'line',
	          	animation: false,
	          	data:columnValue2
	      },
	      {
	          	name:'横滚角',
	          	type:'line',
	          	animation: false,
	          	data:columnValue3
	       },
          {
          	name:'光照',
          	type:'line',
          	//yAxisIndex:1,
            animation: false,
          	data:sensorData
          }
          ]
        };
        echart.setOption(option);
      }
    </script>
</body>
</html>
