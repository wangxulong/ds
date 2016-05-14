<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <div class="flag-style">
       <span>课程组管理</span>
    </div>
    <table id="sample-table-2" class="table table-striped table-bordered table-hover flag">
        <thead>
            <tr>
                <th><button id="test" class="button-style">课程组介绍</button></th>
                <th><button id="teacher" class="button-style">课程组老师</button></th>

            </tr>
        </thead>
    </table>
    <div id="group">
        <p id="description"> ${group}
            <a  href="${ctx}/group/index">
                <i class="ace-icon fa fa-pencil bigger-120"></i>
            </a>
        </p>
    </div>
    <div>
        <table id="sample-table-3" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>名字</th>
                <th>职称</th>
                <th>性别</th>
                <th>年龄</th>
                <th>状态</th>
                <th>总体介绍</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${teachers}" var="teacher">
                <tr>
                    <td>${teacher.name}</td>
                    <td>${teacher.level}</td>
                    <td>
                        <c:choose>
                            <c:when test="${teacher.sex eq 1}">
                                男
                            </c:when>
                            <c:otherwise>
                                女
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td> ${teacher.age}</td>
                    <td>
                        <c:choose>
                            <c:when test="${teacher.state eq 1}">
                                教学中
                            </c:when>
                            <c:otherwise>
                                未教学
                            </c:otherwise>
                        </c:choose>
                        <a  href="">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <div class="flag-style">
        <span>课程信息</span>

        <a class="btn btn-xs btn-success " href="${ctx}/course/add" >
            <i class="ace-icon fa fa-plus bigger-120 "></i>
        </a>

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
            <th>课程名字</th>
            <th>设立时间</th>
            <th style="width:50%;" >课程简介</th>
            <th class="hidden-480">操作</th>


        </tr>
        </thead>

        <tbody>

        <c:forEach items="${Course}" var="course">
            <tr>
                <td class="center">
                    <label class="position-relative">
                        <input type="checkbox" class="ace" />
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>${course.name}</td>
                <td>${course.startTime}</td>
                <td> ${course.outline}</td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                        <a class="btn btn-xs btn-success" href="${ctx}/course/edit/${course.id}">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </a>
                        <a class="btn btn-xs btn-danger" href="${ctx}/course/delete/${course.id}">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script type="text/javascript">
    $("#group").hide();
    $(document).ready(function(){
        $("#test").click(function () {
                $("#group").show();
//                $("#description").text("jkdfghf");
        });
    });

</script>
</body>
</html>
