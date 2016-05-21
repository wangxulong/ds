<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>研讨课</title>
</head>
<body>
<div class="page-header">
    <h1>
        ${course.name}-研讨课
        <small>
            <i class="icon-double-angle-right"></i>
        </small>
    </h1>
</div>
<table id="sample-table-1" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>研讨课名称</th>
        <th>研讨课描述</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th class="hidden-480">操作</th>


    </tr>
    </thead>

    <tbody>
    <c:forEach items="${seminars}" var="seminar">
        <tr>
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>${seminar.name}</td>
            <td>${seminar.desc}</td>
            <td>${seminar.startTime}</td>
            <td>${seminar.endTime}</td>
            <td width="200px">

                <div class="hidden-sm hidden-xs btn-group">
                    <a class="btn btn-minier btn-info" href="${ctx}/class/material/edit?id=${seminar.id}">
                        资料管理
                        <i class="icon-print  align-top bigger-125 icon-on-right"></i>
                    </a>


                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
