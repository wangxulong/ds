<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <!--布置作业-->
    <div class="page-header">
        <h1>
            课堂教学
            <a class="btn btn-xs btn-success " title="布置作业" href="${ctx}/task/add" >
                <i class="ace-icon fa fa-plus bigger-120 "></i>
            </a>
        </h1>
    </div>
    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
        <thead>
        <tr>

            <th>作业主题</th>
            <th>作业内容</th>
            <th>布置时间</th>
            <th>截止时间</th>
            <th class="hidden-480">操作</th>


        </tr>
        </thead>

        <tbody>

        <c:forEach items="${allTask}" var="task" varStatus="vs">
            <tr>
                <td>${task.topic}</td>
                <td> ${task.content}</td>
                <td>${task.createTime}</td>
                <td> ${task.endTime}</td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                            <a class="btn btn-xs btn-success" title="修改作业" href="${ctx}/task/edit/${task.id}">
                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </a>
                            <a class="btn btn-xs btn-danger" title="删除作业" href="${ctx}/task/delete/${task.id}">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </a>
                            <a class="btn btn-xs btn-success" href="${ctx}/task/assess/${task.id}">
                                <i class="ace-icon fa fa-icon-ok bigger-120"></i>批阅作业
                            </a>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<%--<script type="text/javascript">--%>
    <%--$(function(){--%>
        <%--$("#assess*").click(function(){--%>
            <%--var tId= $("#taskId*").val();--%>
            <%--alert(tId);--%>
        <%--});--%>
    <%--});--%>

<%--</script>--%>
</body>
</html>
