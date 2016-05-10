<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>学生管理</title>
</head>
<body>
<a href="${ctx}/student/add" class="btn btn-success">
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
        <%--<th>性别</th>
        <th>身份证号</th>
        <th>工作证号</th>
        <th>入职时间</th>
        <th>出生日期</th>
        <th>操作</th>--%>

    </tr>
    </thead>

    <tbody>

    <c:forEach items="${pager.results}" var="student">
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
          <%--  <td>
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
                    ${student.idcard}
            </td>
            <td>
                    ${student.jobNumber}
            </td>
            <td>
                    <fmt:formatDate value="${student.joinDate}" pattern="yyyy-MM-dd" />
            </td>
            <td>
                <fmt:formatDate value="${student.birthDate}" pattern="yyyy-MM-dd" />
            </td>
            <td class="hidden-480">
                <div class="hidden-sm hidden-xs btn-group">
                        &lt;%&ndash;<shiro:hasPermission name="s:add">&ndash;%&gt;
                        &lt;%&ndash;<button class="btn btn-xs btn-success addSysRole">&ndash;%&gt;
                        &lt;%&ndash;<i class="ace-icon fa fa-plus bigger-120 "></i>&ndash;%&gt;
                        &lt;%&ndash;</button>&ndash;%&gt;
                        &lt;%&ndash;</shiro:hasPermission>&ndash;%&gt;

                    <a class="btn btn-xs btn-info "  href="${ctx}/student/edit/${student.id}"  >
                        <i class="ace-icon fa fa-pencil bigger-120"></i> 修改
                    </a>
                    <a class="btn btn-xs btn-danger delete"  data="${student.id}">
                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    </a>


                </div>


            </td>--%>
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
