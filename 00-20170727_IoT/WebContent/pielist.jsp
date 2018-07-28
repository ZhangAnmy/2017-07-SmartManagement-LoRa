<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    		<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
    <!-- 引入 echarts.js -->
    <script src="res/echarts.min.js"></script>
</head>
<body>

  <body>
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </body>

    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width:800px;height:400px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: 'Node Status'
            },
            tooltip: {},
            legend: {
                data:['']
            },
            xAxis: {
				axisLabel: {
            	rotate: 45,
        		},
                data: ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
            },
            yAxis: {},
            series: [{
                name: '',
                type: 'bar',
                data: [15, 20, 19, 14, 15, 20,18,19,22,15, 20, 19, 14, 15, 20,18,19,22,15, 20, 19, 14, 15, 20,18,19,22,15, 20, 19, 14, 15, 20,18,19,22]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        //myChart.setOption(option);
        
        
      $(function(){
        buildData();
      });
      //生成数据
      function buildData()
      {
        var title=['垃圾桶报警频次','古树倾角记录','下水道水位监测'];
        var allData = "v1=30,v2=50,v3=60,v4=80,v5=100";
        var columLabel = ['清理次数'];
        var columName = ['芙蓉区','天心区','岳麓区','雨花区','开福区'];
        var columnValue1 = new Array();
        //var columnValue2 = new Array();
        var arrData = new Array();
        for(var i=0;i<columLabel.length;i++)
        {
          for(var j=0;j<columName.length;j++)
          {
            arrData.push(Math.floor(Math.random()*10+i*10));
          }
          console.info(arrData);
          columnValue1.push(eval('(' + ("{'name':'"+columLabel[i]+"','type':'line','data':["+arrData+"]}") + ')'));
        }
        buildChart(columLabel,columName,columnValue1);
      }
      //生成图形
      function buildChart(columLabel,columName,columnValue1)
      {
        var chart = document.getElementById('main');
        var echart = echarts.init(chart);
        var option = {
        		title : {
        	        text: '各区域报警频次',
        	    },
          tooltip : {
            trigger: 'axis',
            axisPointer : {
              type : 'shadow'
            }
          },
         
          legend: {
            data:columLabel
          },
          grid: {
            left: '10%',
            right: '10%',
            bottom: '5%',
            top:'15%',
            containLabel: true
          },
          toolbox: {
  	        show : true,
  	        feature : {
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
              rotate: 45,
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
          series : columnValue1
        };
        echart.setOption(option);
      }
    </script>
</body>
</html>





