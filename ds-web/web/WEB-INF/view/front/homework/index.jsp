<%@ page import="java.util.Date" %>
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
        <div class="alert alert-info" role="alert">
          <h5 class="text-center">
            <span class="glyphicon glyphicon-info-sign"></span>
            如果老师提交有附件，请下载附件，查看具体作业信息！
          </h5>
        </div>
        <div class="panel panel-default">

          <div class="panel-heading">
            <h3 class="panel-title">
              作业信息
            </h3>
          </div>
          <div class="panel-body">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>#</th>
                <th>作业名称</th>
                <th>描述</th>
                <th>开始时间</th>
                <th>结束时间</th>
                <th>状态</th>
                <th>操作</th>

              </tr>
              </thead>
              <tbody>
                  <c:forEach items="${tasks}" var="task" varStatus="s">
                    <tr>
                      <td>${s.count}</td>
                      <td>${task.topic}</td>
                      <td>${task.content}</td>
                      <td><fmt:formatDate value="${task.createTime}" pattern="yyyy-MM-dd"/></td>
                      <td><fmt:formatDate value="${task.endTime}" pattern="yyyy-MM-dd"/></td>
                      <td>
                        <c:set var="now" value="<%= new Date()%>" />
                          <c:choose>
                            <c:when test="${task.endTime gt now}">
                               <span class="text-success">已开始</span>
                            </c:when>
                            <c:otherwise>
                              <span class="text-danger">已结束</span>
                            </c:otherwise>
                          </c:choose>
                          
                      </td>
                      <td>
                        <a href="${ctx}/front/homework/${task.id}/my" class="btn btn-success btn-sm" >我的提交</a>
                        <a href="${ctx}/front/homework/upload/${task.id}" class="btn btn-success btn-sm" >提交作业</a>
                        <c:if test="${not empty task.attachId}">
                          <a href="#" class="btn btn-primary btn-sm" >下载</a>
                        </c:if>


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
