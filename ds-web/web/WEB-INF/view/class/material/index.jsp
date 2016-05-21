<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="page-header">
    <h1>
        研讨课资料
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
        <th>课程名称</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th class="hidden-480">操作</th>


    </tr>
    </thead>

    <tbody>
    <c:forEach items="${courseList}" var="course">
        <tr>
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>${course.name}</td>
            <td>${course.startTime}</td>
            <td>${course.endTime}</td>
            <td width="200px">
                <div class="hidden-sm hidden-xs btn-group">
                    <a class="btn btn-minier btn-info" href="${ctx}/class/material/edit?id=${course.id}">
                        资料管理
                        <i class="icon-print  align-top bigger-125 icon-on-right"></i>
                    </a>

                    <a class="btn btn-minier btn-warning" href="${ctx}/class/material/edit?id=${course.id}">
                        学生请假
                        <i class="icon-print  align-top bigger-125 icon-on-right"></i>
                    </a>

                    <a class="btn btn-minier btn-success" href="${ctx}/class/material/edit?id=${course.id}">
                        研讨课
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
