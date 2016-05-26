<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>学生管理</title>
</head>
<body>
<div class="page-header">
    <h1>
        我的学生
        <small>
            <i class="icon-double-angle-right"></i>
            学生信息列表
        </small>
    </h1>
</div><!-- /.page-header -->
<table id="sample-table-1" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>姓名</th>
        <th>性别</th>
        <th>学生证号</th>
        <th>入学日期</th>
        <th>出生日期</th>

    </tr>
    </thead>

    <tbody>

    <c:forEach items="${myStudents}" var="student">
        <tr>
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>
                    ${student.name}
            </td>
            <td>
                <c:choose>
                    <c:when test="${student.sex eq 1}">
                        男
                    </c:when>
                    <c:otherwise>
                        女
                    </c:otherwise>
                </c:choose>

            </td>
            <td>
                    ${student.studentNumber}
            </td>

            <td>
                    <fmt:formatDate value="${student.joinDate}" pattern="yyyy-MM-dd" />
            </td>
            <td>
                <fmt:formatDate value="${student.birthDate}" pattern="yyyy-MM-dd" />
            </td>
        </tr>
    </c:forEach>




    </tbody>

</table>
<script>
    $(function(){
        $(".delete").on("click",function(){
            var r = confirm("确定要删除吗");
            if(r){
                var id = $(this).attr("data");
                window.location.href="${ctx}/student/delete/"+id;
            }
        });


    });
</script>
</body>
</html>
