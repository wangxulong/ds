
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/frontCommon.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
  <style>
    body {
      position: relative;
    }
  </style>
</head>
<body>
<!--导航-->
<nav id="nav-index" class="navbar navbar-default navbar-fixed-top header" >
  <div class="container">
    <!--小屏幕导航按钮和Logo-->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-content"
              >
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="index.html" class="navbar-brand">DS课程平台</a>
    </div>

    <!--小屏幕导航按钮和Logo-->

    <!--导航-->
    <div class="collapse navbar-collapse" id="nav-content">
      <ul class="nav navbar-nav navbar-right">
        <li ><a href="#home">首页 </a></li>
        <li><a href="#course">课程组信息</a></li>
        <li><a href="#teacher">教师信息</a></li>
        <li><a href="#outline">课程大纲</a></li>
        <c:choose>
          <c:when test="${ not empty sessionScope.loginStudent}">
            <li >
              <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                  <a id="dLabel" href="#" data-target="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                      ${sessionScope.loginStudent.name}
                    <span class="caret"></span>
                  </a>
                  <ul class="dropdown-menu " aria-labelledby="dLabel">
                    <li ><a href="#" class="userCenter"><span class="glyphicon glyphicon-leaf text-success" ></span> 个人中心</a></li>
                    <li ><a href="${ctx}/front/logout" class="logout"><span class="glyphicon glyphicon-off text-danger" ></span> 退  出  </a></li>
                  </ul>
                </li>

              </ul>

            </li>
          </c:when>
          <c:otherwise>
            <li><a  class="btn btn-success btn-sm login" id="btnLogin" href="#" style="color:#000;">登录</a></li>
          </c:otherwise>
        </c:choose>

      </ul>
    </div>
  </div>
</nav>


<!--home-->
<section id="home"  >
  <div class="flicker-example wow fadeInUp" >
    <ul>
      <li data-background="${ctx}/static/front/js/libs/Flickerplate-2.1.1/img/flicker-1.jpg">
        <div class="flick-title">
          数据结构
        </div>
        <div class="flick-sub-text">
          ${course}
        </div>
      </li>
      <li data-background="${ctx}/static/front/js/libs/Flickerplate-2.1.1/img/flicker-2.jpg">
        <div class="flick-title">
          上海大学
        </div>
        <div class="flick-sub-text">
          上海大学（Shanghai University），简称上大，是上海市属、国家“211工程”重点建设的综合性大学
        </div>
      </li>
      <li data-background="${ctx}/static/front/js/libs/Flickerplate-2.1.1/img/flicker-3.jpg">
        <div class="flick-title">
          曹旻 副教授
        </div>
        <div class="flick-sub-text">
          工学博士，1988年从教。研究兴趣：软件工程，分布式计算，面向对象技术，网格计算等
        </div>
      </li>
    </ul>

  </div>


</section>
<!--home-->
<!--课程course-->
<section id="course">
  <div class="container">
    <div class="row">
      <div class="col-md-4 wow fadeInLeft" >
        <img src="${ctx}/static/front/images/course.png" class="img-responsive">
      </div>
      <div class="col-md-8 wow fadeInRight">
        <h2>${group.name}</h2>
        <p class="main">
          ${group.description}
        </p>

      </div>
    </div>
  </div>

</section>
<!--课程course-->
<!--teacher-->
<section id="teacher">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div id="main" style="width:500px;height:400px;" ></div>
      </div>
      <div class="col-md-6">
        <div id="teachState" style="width:500px;height:400px;" ></div>
      </div>
    </div>
    <div class="row">


      <div id="teach">
        <table id="sample-table-3" class="table table-striped table-bordered table-hover">
          <thead>
          <tr>
            <th>名字</th>
            <th>职称</th>
            <th>性别</th>
            <th>年龄</th>
            <th>状态</th>
            <th>教学计划</th>
          </tr>
          </thead>

          <tbody>

          <c:forEach items="${teachers}" var="teacher" varStatus="s">
            <tr>
              <td class="font-style"><a href="${ctx}/course/check/${teacher.id}">${teacher.name}</a></td>
              <td>${teacher.level}</td>
              <td>
                <c:choose>
                  <c:when test="${teacher.sex eq 1}">
                    男
                  </c:when>
                  <c:otherwise>
                    女
                  </c:otherwise>
                </c:choose>
              </td>
              <input type="hidden" id="age${s.count}" name="birthDay" value="${teacher.birthDate}">
              <td > <span id="ageValue${s.count-1}"  name="ageValue"> </span> </td>
              <td>
                <c:choose>
                  <c:when test="${teacher.state eq 1}">
                    教学中
                  </c:when>
                  <c:otherwise>
                    未教学
                  </c:otherwise>
                </c:choose>
              </td>
              <td>
                <c:choose>
                  <c:when test="${not empty teacher.teacherPlan}">
                    <a href="${ctx}/front/download/${teacher.teacherPlan}" class="btn btn-primary btn-sm">下载</a>
                  </c:when>
                  <c:otherwise>
                    <span class="label label-danger">暂无教学计划</span>
                  </c:otherwise>

                </c:choose>



              </td>
            </tr>
          </c:forEach>
          <span style="font-size:20px;">
            <c:forEach items="${levelNums}" var="levelNum">
              <c:out value="${levelNum.key}"/>
              <span style="color: #1165ff"><c:out value="${levelNum.value}"/></span>
              <span>人;</span>&nbsp;&nbsp;
            </c:forEach>
          <c:forEach items="${sexStateNums}" var="sexStateNum">
            <c:out value="${sexStateNum.key}"/>
            <span style="color: #1165ff"><c:out value="${sexStateNum.value}"/></span>
            <span>人;</span>&nbsp;&nbsp;
          </c:forEach>
          </span>

          </tbody>
        </table>
      </div>
    </div>
  </div>

</section>
<!--teacher-->

<section id="outline" >
  <div class="container">
    <div class="row">
      <div class="col-md-12 wow bounce text-left">
          ${group.outline}
      </div>
    </div>
  </div>
</section>


<!--footer-->
 <%@include file="/include/frontFooter.jsp"%>
<!--footer-->

<script type="text/javascript">


  function getAge(dateString) {
    var today = new Date();
    var birthDate = new Date(dateString);
    var age = today.getFullYear() - birthDate.getFullYear();
    var m = today.getMonth() - birthDate.getMonth();
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
      age--;
    }
    return age;
  }
  //    $("#ageValue").html(getAge($("#age").val()));
  $(function(){
    var brithDay=document.getElementsByName("birthDay");
    var ageValue = document.getElementsByName("ageValue");
    for(i=0;i<brithDay.length;i++){
      ageValue[i].value=getAge(brithDay[i].value);
      $("#ageValue"+i).html(ageValue[i].value);

    }
  });
</script>




<script >


  //    小屏幕导航点击关闭菜单
  $(".navbar-collapse a").on("click",function(){
    $(".navbar-collapse").collapse("hide");
  });
  //初始化WoW
  new WOW().init();
  //singlePageNav
  $('.nav').onePageNav({
    offset:0,
    filter: ':not(.userCenteruserCenter)'
  });
  $(function(){
    $('.flicker-example').flickerplate(
            {
              auto_flick 				: true,
              auto_flick_delay 		: 8,
              flick_animation 		: 'transform-slide'
            });
    $("#btnLogin").on("click",function (e) {
      e.preventDefault();

      $("#modelLogin").modal("show");
    });
  });
</script>
<!--loginForm-->
<div class="modal fade" id="modelLogin">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">
          登录
        </h4>
      </div>
      <div class="modal-body">
        <div class="container-fluid">
          <div class="alert alert-danger alert-dismissible text-center hidden " id="resultAlert" role="alert" >
            <strong id="errorMessage"></strong>
          </div>
          <form class="form">
            <div class="form-group">
              <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                  <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon1">
                                             <span class="glyphicon glyphicon-user"></span>
                                        </span>
                    <input type="text" class="form-control" placeholder="学号" name="name" aria-describedby="basic-addon1">
                  </div>
                </div>
                <div class="col-md-2"></div>
              </div>


            </div>
            <div class="form-group">
              <div class="row">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                  <div class="input-group">
                                        <span class="input-group-addon" id="basic-addon2">
                                            <span class="glyphicon glyphicon-lock"></span>
                                        </span>
                    <input type="password" class="form-control" name="password" placeholder="密码" aria-describedby="basic-addon2">
                  </div>
                </div>
                <div class="col-md-2"></div>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary loginBtn">登录</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>

  function refreshIndex(){
    window.location.href = "${ctx}/front/index";
  }
  $(function(){
    <c:if test="${not empty sessionScope.login}">
    $("#modelLogin").modal("show");
    ${sessionScope.remove("login")}
    </c:if>
    $(".loginBtn").on("click",function(){
         $(this).attr("disabled","true");
         $(this).text("登录中");
        $("#resultAlert").addClass("hidden");
        var data = $(".form").serialize();
        $.post("${ctx}/front/login",data,function(result){
          $(".loginBtn").removeAttr("disabled")
          $(".loginBtn").text("登录");
          if(result.status === 'error'){
            $("#resultAlert").removeClass("hidden");
            $("#resultAlert").addClass("show");
            $("#errorMessage").html(result.message);
          }else{
            refreshIndex();
          }
        });

    });

    $(".logout").on("click",function(){
        window.location.href = "${ctx}/front/logout";
    });
    $(".userCenter").on("click",function(){
      window.location.href = "${ctx}/front/user/index";
    });

  });
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
