<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>教师管理</title>
</head>
<body>
<a href="${ctx}/teacher/add" class="btn btn-success">
    添加
</a>
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
        <th>身份证号</th>
        <th>工作证号</th>
        <th>入职时间</th>
        <th>出生日期</th>
        <th>职称</th>
        <th>状态</th>
        <th>操作</th>

    </tr>
    </thead>

    <tbody>

    <c:forEach items="${teachers}" var="teacher">
        <tr>
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>
                    ${teacher.name}
            </td>
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
            <td>
                    ${teacher.idcard}
            </td>
            <td>
                    ${teacher.jobNumber}
            </td>
            <td>
                    <fmt:formatDate value="${teacher.joinDate}" pattern="yyyy-MM-dd" />
            </td>
            <td>
                <fmt:formatDate value="${teacher.birthDate}" pattern="yyyy-MM-dd" />
            </td>
            <td>
                    ${teacher.level}
            </td>
            <td>
                <c:choose>
                    <c:when test="${teacher.state eq 1}">
                        教学中
                    </c:when>
                    <c:otherwise>
                        未教学
                    </c:otherwise>
                </c:choose>
            </td>
            <td class="hidden-480">
                <div class="hidden-sm hidden-xs btn-group">
                        <%--<shiro:hasPermission name="s:add">--%>
                        <%--<button class="btn btn-xs btn-success addSysRole">--%>
                        <%--<i class="ace-icon fa fa-plus bigger-120 "></i>--%>
                        <%--</button>--%>
                        <%--</shiro:hasPermission>--%>

                    <a class="btn btn-xs btn-info "  href="${ctx}/teacher/edit/${teacher.id}"  >
                        <i class="ace-icon fa fa-pencil bigger-120"></i> 修改
                    </a>
                            <a class="btn btn-xs btn-info "  href="${ctx}/teacher/${teacher.id}/plan"  >
                                <i class="ace-icon fa fa-pencil bigger-120"></i> 教学计划
                            </a>
                    <a class="btn btn-xs btn-danger delete"  data="${teacher.id}">
                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    </a>


                </div>


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
                window.location.href="${ctx}/teacher/delete/"+id;
            }
        });


    });
</script>
</body>
</html>
