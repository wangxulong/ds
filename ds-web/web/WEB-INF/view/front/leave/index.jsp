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
                        我的请假
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
                                时间
                            </th>
                            <th>
                                内容
                            </th>

                            <th>
                                状态
                            </th>
                            <th>
                                附件
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty leaves}">

                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${leaves}" var="leave" varStatus="s">
                                    <tr>
                                        <td>${s.count}</td>
                                        <td><fmt:formatDate value="${leave.leaveDate}" pattern="yyyy-MM-dd"/> </td>
                                        <td>${leave.content} </td>
                                        <td>
                                                ${leave.state.description}
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty leave.attachId}">
                                                    <a class="btn btn-primary btn-sm" href="${ctx}/front/download/${leave.attachId}">下载</a>
                                                </c:when>
                                                <c:otherwise>
                                                    没有附件
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
</html>
