<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我提交的作业</title>
</head>
<body>
  <%@include file="/include/frontCenterHeader.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <%@include file="left.jsp"%>
      </div>
      <div class="col-md-10">
        <div class="alert alert-info" role="alert">
          <h5 class="text-center " style="font-size:25px;">
            作业： ${task.topic}
          </h5>
        </div>
        <div class="panel panel-default">

          <div class="panel-heading">
            <h3 class="panel-title">
              我提交的作业
            </h3>
          </div>
          <div class="panel-body">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>#</th>
                <th>作业名称</th>
                <th>描述</th>
                <th>提交时间</th>
                <th>状态</th>
                <th>操作</th>
              </tr>
              </thead>
              <tbody>
                  <c:forEach items="${homeworks}" var="myHomework" varStatus="s">
                    <tr>
                      <td>${s.count}</td>
                      <td>${myHomework.topic}</td>
                      <td>${myHomework.description}</td>
                      <td><fmt:formatDate value="${myHomework.createTime}" pattern="yyyy-MM-dd"/></td>
                      <td>
                        <c:choose>
                          <c:when test="${empty myHomework.score}">
                            <span class="label label-danger">未批阅</span>
                          </c:when>
                          <c:otherwise>
                            <span class="label label-success">已批阅</span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                      <td>
                        <c:choose>
                          <c:when test="${not empty myHomework.attachmentId}">
                            <a href="${ctx}/front/download/${myHomework.attachmentId}" class="btn btn-primary btn-sm">下载</a>
                          </c:when>
                          <c:otherwise>
                            <span class="text-danger">没有附件</span>
                          </c:otherwise>
                        </c:choose>
                      </td>
                    </tr>
                  </c:forEach>
              </tbody>
            </table>
          </div>

        </div>

      </div>
    </div>
  </div>
</body>
</html>
