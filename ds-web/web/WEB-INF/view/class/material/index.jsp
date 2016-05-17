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
        <th>已上传资料</th>
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
            <td> ${course.startTime}</td>
            <td>1</td>
            <td class="hidden-480">
                <div class="hidden-sm hidden-xs btn-group">
                    <a href="${ctx}/class/material/edit?id=${course.id}">
                        <img src="${ctx}/static/img/add_file.png" style="width:20px;height:20px"/>
                    </a>
                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
</body>
</html>
