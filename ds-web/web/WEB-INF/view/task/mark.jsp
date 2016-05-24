<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>


<div>
    <!--批阅作业-->
    <div class="flag-style">
        <span>批阅作业</span><span>当前正在批阅的作业批次：***/span>
    </div>
    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
        <thead>
        <tr>

            <th>学生姓名</th>
            <th>提交时间</th>
            <th>作业成绩</th>
            <th>作业状态</th>
            <th class="hidden-480">批阅</th>
        </tr>
        </thead>

        <tbody>

        <%--<c:forEach items="${allTask}" var="task" varStatus="vs">--%>
            <%--<tr>--%>
                <%--<td>${task.topic}</td>--%>
                <%--<td> ${task.content}</td>--%>
                <%--<td>${task.createTime}</td>--%>
                <%--<td> ${task.endTime}</td>--%>
                <%--<td class="hidden-480">--%>
                    <%--<div class="hidden-sm hidden-xs btn-group">--%>
                        <%--<a class="btn btn-xs btn-success" title="修改作业" href="${ctx}/task/edit/${task.id}">--%>
                            <%--<i class="ace-icon fa fa-pencil bigger-120"></i>--%>
                        <%--</a>--%>
                        <%--<a class="btn btn-xs btn-danger" title="删除作业" href="${ctx}/task/delete/${task.id}">--%>
                            <%--<i class="ace-icon fa fa-trash-o bigger-120"></i>--%>
                        <%--</a>--%>
                        <%--<a class="btn btn-xs btn-success" href="${ctx}/task/assess/${task.id}">--%>
                            <%--<i class="ace-icon fa fa-icon-ok bigger-120"></i>批阅作业--%>
                        <%--</a>--%>
                    <%--</div>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</c:forEach>--%>
        </tbody>
    </table>

</div>


<%--<div class="modal-footer">--%>
    <%--<a class="btn btn-sm clear" href="${ctx}/task/index">--%>
        <%--<i class="ace-icon fa fa-times"></i>--%>
        <%--取消--%>
    <%--</a>--%>
    <%--<button class="btn btn-sm btn-primary btnSave">--%>
        <%--<i class="ace-icon fa fa-check"></i>--%>
        <%--保存--%>
    <%--</button>--%>
<%--</div>--%>


<script>
    $(function(){
        $(".btnSave").on("click",function(){
            $("#formSysRole").submit();
        });
    });
    $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
        $(this).prev().focus();
    });
</script>
</body>
</html>