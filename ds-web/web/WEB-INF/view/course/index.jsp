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

                <th><a href="${ctx}/group/index">课程组介绍</a></th>
                <%--<th><span id="test">课程组介绍</span></th>--%>
                <th><a href="${ctx}/course/index">课程组老师</a></th>

            </tr>
        </thead>
    </table>
    <div id="group">
        <p id="description"></p>

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
    $(document).ready(function(){
        $("#test").click(function () {

            $("#group").show();

        });
    });

</script>
</body>
</html>
