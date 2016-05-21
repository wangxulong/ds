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
                            <th>标题</th>

                            <th>请假内容</th>
                            <th>请假日期</th>
                            <th>当前状态</th>
                            <th>附件</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${notes}" var="note" varStatus="s">
                            <tr nid="${note.id}">
                                <td class="center">
                                     ${s.count}
                                </td>
                                <td>${note.title}</td>

                                <td> ${note.content}</td>
                                <td><fmt:formatDate value="${note.time}" pattern="yyyy-MM-dd"></fmt:formatDate></td>
                                <td>
                                    <c:if test="${note.status == 0}">
                                        <span class="label label-sm label-warning">待审核</span>
                                    </c:if>
                                    <c:if test="${note.status == 1}">
                                        <span class="label label-sm label-success">已审核</span>
                                    </c:if>
                                    <c:if test="${note.status == 2}">
                                        <span class="label label-sm label-danger">已拒绝</span>
                                    </c:if>

                                </td>
                                <th>
                                    <c:choose>
                                        <c:when test="${empty note.attachId}">
                                            <span class="label label-sm label-danger">没有附件</span>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${ctx}/front/download/${note.attachId}" class="btn btn-primary btn-sm"> 下载</a>
                                        </c:otherwise>
                                    </c:choose>
                                </th>
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
