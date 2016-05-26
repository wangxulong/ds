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
              研讨课信息
            </h3>
          </div>
          <div class="panel-body">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>
                  #
                </th>
                <th>
                  研讨课主题
                </th>
                <th>
                  课题内容
                </th>
                <th>
                  时间
                </th>
                <th>
                  状态
                </th>
                <th>
                  操作
                </th>
              </tr>
              </thead>
              <tbody>
                <c:forEach items="${myTopics}" var="myTopic" varStatus="s">
                  <tr>
                    <td>${s.count}</td>
                    <td>${myTopic.seminarName}</td>
                    <td>${myTopic.topicName}</td>
                    <td><fmt:formatDate value="${myTopic.joinTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                    <td >
                      <c:choose>
                        <c:when test="${myTopic.state eq 0}">
                          <span class="label label-info ">已提交</span>
                        </c:when>
                        <c:when test="${myTopic.state eq 1}">
                          <span class="label label-success">已选择</span>
                          </c:when>
                        <c:when test="${myTopic.state eq 2}">
                          <span class="label label-danger">选择失败</span>
                          选择失败</c:when>
                      </c:choose>


                    </td>
                    <td>
                      <%--<a href="#" class="btn btn-primary btn-sm">详情</a>--%>
                      <c:if test="${myTopic.state eq 0}">
                        <button data="${myTopic.studentTopicId}" class="btn btn-danger btn-sm delete">退选</button>
                      </c:if>
                      <c:if test="${myTopic.state eq 1}">
                        <a href="${ctx}/front/discuss/${myTopic.studentTopicId}/upload" class="btn btn-info btn-sm">提交作业</a>
                      </c:if>
                      <c:if test="${not empty myTopic.attachId}">
                        <a href="${ctx}/front/download/${myTopic.attachId}" class="btn btn-info btn-sm">下载作业</a>
                      </c:if>
                    </td>

                    </c:forEach>
                  </tr>


              </tbody>
                </table>
          </div>

        </div>

      </div>
    </div>

  </div>
<script>
  $(function(){
    $(".delete").on("click",function(){
      var r = confirm("确定要退选吗");
      if(r){
        var id = $(this).attr("data");
        window.location.href="${ctx}/front/discuss/"+id+"/delete";
      }
    });
  });
</script>
</body>
</html>
