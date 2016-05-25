<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>基本信息</title>
</head>
<body>
  <%@include file="/include/frontCenterHeader.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <%@include file="left.jsp"%>
      </div>
      <div class="col-md-10">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">
              研讨课报名
            </h3>
          </div>
          <div class="panel-body">
            <c:forEach items="${seminars}" var="seminar">
               <div class="alert alert-info text-center" role="alert">
              <span class="glyphicon glyphicon-info-sign"></span>
              ${seminar.name}  &nbsp;&nbsp;&nbsp; <span class="text-danger">截止时间:
                 <fmt:formatDate value="${seminar.endTime}" pattern="yyyy-MM-dd"
                       />  </span>
            </div>
            <div class="container-fluid">

                  <c:forEach items="${seminar.seminarTopics}" var="topic">
                    <div class="row panel "  >


                      <div class="col-md-9">

                        <blockquote>
                          <p class="countDownText" data="${topic.endTime}"></p>
                          <p><strong>${topic.name}</strong>
                          </p>
                          <p>${topic.desc}</p>

                          <footer>${topic.demand}</footer>
                        </blockquote>
                      </div>
                      <div class="col-md-3">
                        <c:choose>
                          <c:when test="${topic.joined}">
                            <a   class="btn btn-info btnJoin disabled">参与中</a>
                          </c:when>
                          <c:when test="${!topic.available}">
                            <a  class="btn btn-default btnJoin disabled">无效</a>
                          </c:when>
                          <c:otherwise>
                            <a href="${ctx}/front/discuss/${topic.id}/join" class="btn btn-primary btnJoin">立即参与</a>
                          </c:otherwise>
                        </c:choose>


                      </div>

                    </div>
                  </c:forEach>

              </div>

            </div>

            </c:forEach>

           <%-- <div class="alert alert-info text-center" role="alert">
              <span class="glyphicon glyphicon-info-sign"></span>
              请选择感兴趣的研讨内容进行报名
            </div>
            <div class="row clearfix">
              <div class="col-md-12 column">
                <div class="row">
                  <div class="col-md-4">
                    <div class="thumbnail">
                      <img alt="300x200" class="img-responsive" src="images/index-background.jpg" />
                      <div class="caption">
                        <h3>
                          链表的操作
                        </h3>
                        <p>
                          使用链表结构可以克服数组链表需要预先知道数据大小的缺点，链表结构可以充分利用计算机内存空间，实现灵活的内存动态管理。
                        </p>
                        <p>
                          <a class="btn btn-primary" href="#">立即参与</a>
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="thumbnail">
                      <img alt="300x200" class="img-responsive" src="images/index-background.jpg" />
                      <div class="caption">
                        <h3>
                          链表的操作
                        </h3>
                        <p>
                          使用链表结构可以克服数组链表需要预先知道数据大小的缺点，链表结构可以充分利用计算机内存空间，实现灵活的内存动态管理。
                        </p>
                        <p>
                          <a class="btn btn-primary" href="#">立即参与</a>
                        </p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-4">
                    <div class="thumbnail">
                      <img alt="300x200" class="img-responsive" src="images/index-background.jpg" />
                      <div class="caption">
                        <h3>
                          链表的操作
                        </h3>
                        <p>
                          使用链表结构可以克服数组链表需要预先知道数据大小的缺点，链表结构可以充分利用计算机内存空间，实现灵活的内存动态管理。
                        </p>
                        <p>
                          <a class="btn btn-primary" href="#">立即参与</a>
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>--%>
          </div>

        </div>

      </div>
    </div>
  </div>
<script>
  $(function(){
    $(".btnJoin").on("click",function(){
      $(this).addClass("disabled");
      $(this).text("已经提交");
    });

     $(".countDownText").each(function(i,v){
       var endTime = $(this).attr('data');
       $(this).countdown({
         date: endTime,
         render:function(data){
           //$(this.el).html("<div>" +  this.leadingZeros(data.days, 3) + " <span>天</span></div><div>" + this.leadingZeros(data.hours, 2) + " <span>小时</span></div><div>" + this.leadingZeros(data.min, 2) + " <span>分钟</span></div><div>" + this.leadingZeros(data.sec, 2) + " <span>秒</span></div>");
           return  $(this.el).html('<span class="text-danger"> 剩余：'+ data['days']+'天'+data['hours']+'小时'+data['min']+'分'+data['sec']+'秒 </span>');
         }
       });
     });

  });
</script>
  <script type="text/javascript" src="${ctx}/static/js/jquery-countdown/jquery.countdown.min.js" charset="UTF-8"></script>

  <%--<script type="text/javascript" src="${ctx}/static/js/jquery-countdown/countdown.min.js" charset="UTF-8"></script>--%>


</body>
</html>
