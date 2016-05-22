<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="page-header">
    <h1>
        课堂教学
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
            <td>
                <div class="hidden-sm hidden-xs btn-group">
                    <a class="btn btn-minier btn-info" href="${ctx}/class/material/edit?id=${course.id}">
                        <i class="ace-icon fa fa-book bigger-120"></i>资料管理
                    </a>

                    <a class="btn btn-minier btn-warning" href="${ctx}/class/note/index?cid=${course.id}">
                        <i class="ace-icon fa fa-coffee bigger-120"></i>学生请假
                    </a>

                    <a class="btn btn-minier btn-success" href="${ctx}/class/seminar/index?cid=${course.id}">
                        <i class="ace-icon fa fa-eraser bigger-120"></i>研讨课
                    </a>

                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
</body>
</html>
