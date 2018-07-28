<%@ page language="java"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <script src="res/echarts.min.js"></script>
       <script src="res/jquery-3.2.1.min.js"></script>
	<link href="res/bootstrap.min.css" type="text/css" rel="stylesheet">
</head>
<body>
    <div id="main" style="width:600px;height:300px ;OVERFLOW-Y: scroll; OVERFLOW-X:hidden; "></div>
    <script type="text/javascript">
        var myChart = echarts.init(document.getElementById('main'));
        var cellSize = [60, 60];
        var pieRadius = 30;

        // 模拟数据
      
function getVirtulData() {
    var date = +echarts.number.parseDate('2017-02-01');
    var end = +echarts.number.parseDate('2017-03-01');
    var dayTime = 3600 * 24 * 1000;
    var data = [];
    for (var time = date; time < end; time += dayTime) {
        data.push([
            echarts.format.formatTime('yyyy-MM-dd', time),
            Math.floor(Math.random() * 10000)
        ]);
    }
    return data;
}


        var scatterData = getVirtulData();

        option = {
            tooltip : {},
            legend: {
                data: ['工作', '娱乐', '睡觉'],
                bottom: 20
            },
            calendar: {
                top: 'middle',
                left: 'center',
                orient: 'vertical',
                cellSize: cellSize,
                yearLabel: {
                    show: false,
                    textStyle: {
                        fontSize: 30
                    }
                },
                dayLabel: {
                    margin: 20,
                    firstDay: 1,
                    nameMap: ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六']
                },
                monthLabel: {
                    show: false
                },
                range: ['2017-02']
            },
            series: [{
                id: 'label',
                type: 'scatter',
                coordinateSystem: 'calendar',
                symbolSize: 1,
                label: {
                    normal: {
                        show: true,
                        formatter: function (params) {
                            return echarts.format.formatTime('dd', params.value[0]);
                        },
                        offset: [-cellSize[0] / 2 + 10, -cellSize[1] / 2 + 10],
                        textStyle: {
                            color: '#000',
                            fontSize: 14
                        }
                    }
                },
                data: scatterData
            }]
        };
      myChart.setOption(option);
        

    </script>
</body>
</html>