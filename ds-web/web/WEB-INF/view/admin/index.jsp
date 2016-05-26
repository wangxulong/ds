<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <div class="row">
    <div class="col-md-6">
      <div class="widget-box">
        <div class="widget-header widget-header-flat widget-header-small">
          <h5>
            <i class="icon-signal"></i>
            教师职称比例
          </h5>

        </div>

        <div class="widget-body">
          <div class="widget-main">

            <div id="main" style="width:500px;height:400px;" ></div>

          </div><!-- /widget-main -->
        </div><!-- /widget-body -->
      </div>
    </div>
    <div class="col-md-6">
      <div class="widget-box">
        <div class="widget-header widget-header-flat widget-header-small">
          <h5>
            <i class="icon-signal"></i>
            教师授课状态
          </h5>

        </div>

        <div class="widget-body">
          <div class="widget-main">

            <div id="teachState" style="width:500px;height:400px;" ></div>

          </div><!-- /widget-main -->
        </div><!-- /widget-body -->
      </div>
    </div>
  </div>
  <script>
    $(function(){
      // 基于准备好的dom，初始化echarts实例
      var levelChart = echarts.init(document.getElementById('main'));
      var stateChart = echarts.init(document.getElementById('teachState'));
      var teacherLevel = JSON.parse('${teacherLevel}');
      var teachState = JSON.parse('${teachState}');
      // 指定图表的配置项和数据
      var levelChartOption = {
        title : {
          text: '教师职称比例',
          x:'center'
        },
        tooltip : {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: teacherLevel.legendData
        },
        series : [
          {
            name: '职称',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data: teacherLevel.seriesData,
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      };

      // 使用刚指定的配置项和数据显示图表。
      levelChart.setOption(levelChartOption);

      var stateChartOption = {
        title : {
          text: '教学人数统计',
          x:'center'
        },
        tooltip : {
          trigger: 'item',
          formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: teachState.legendData
        },
        series : [
          {
            name: '教学人数统计',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data: teachState.seriesData,
            itemStyle: {
              emphasis: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      };
      stateChart.setOption(stateChartOption);
    });
  </script>
  <script src="${ctx}/static/js/echarts.common.min.js"></script>

  </body>
</html>
