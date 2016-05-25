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
        <span>批阅作业</span>
        <span>当前正在批阅的作业批次：***</span>
    </div>
    <form action="${ctx}/task/mark">
        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>

                <th>学生姓名</th>
                <th>提交时间</th>
                <th>作业成绩</th>
                <th class="hidden-480">批阅</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${homeworkList}" var="hList">
                <tr>
                    <td>${hList.studentName}</td>
                    <td> ${hList.finishTime}</td>
                    <td>${hList.homeworkScore}</td>

                    <td class="hidden-480">
                        <div class="hidden-sm hidden-xs btn-group">
                            <input class="input-sm" type="text" id="form-field-4">
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <%--<input type="submit">--%>
    </form>

    <div class="modal-footer">
        <a class="btn btn-sm clear" href="${ctx}/task/index">
            <i class="ace-icon fa fa-times"></i>
            取消
        </a>
        <button class="btn btn-sm btn-primary btnSave">
            <i class="ace-icon fa fa-check"></i>
            保存
        </button>
    </div>


</div>





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