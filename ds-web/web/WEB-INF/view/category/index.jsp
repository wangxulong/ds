<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>

    <title></title>
</head>
<body>
<button class="btn btn-success add">
    添加
</button>
<table id="sample-table-1" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>标题</th>
        <th>内容</th>
        <th>创建人</th>
        <th>创建时间</th>
        <th>热点</th>
        <th>操作</th>
    </tr>
    </thead>

    <tbody>

        <c:forEach items="${categorys}" var="category">
            <tr>
                <td class="center">
                    <label class="position-relative">
                        <input type="checkbox" class="ace" />
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>
                    ${category.title}
                </td>
                <td>
                    ${category.description}
                </td>
                <td>
                    ${category.userName}
                </td>
                <td>
                    ${category.createTime}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${question.status eq 3}">
                            <span class="text-danger">是</span>
                        </c:when>
                        <c:otherwise>不是</c:otherwise>
                    </c:choose>
                </td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                        <%--<shiro:hasPermission name="s:add">--%>
                            <%--<button class="btn btn-xs btn-success addSysRole">--%>
                                <%--<i class="ace-icon fa fa-plus bigger-120 "></i>--%>
                            <%--</button>--%>
                        <%--</shiro:hasPermission>--%>
                            <button class="btn btn-xs btn-success addQuestion">
                                <i class="ace-icon fa fa-plus bigger-120 "></i>
                            </button>
                            <button class="btn btn-xs btn-info editQuestion"   data="${category.id}">
                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </button>
                            <a class="btn btn-xs btn-danger delete"  data="${category.id}">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </a>
                            <button class="btn btn-xs btn-warning upToHot" data="${category.id}">
                                <i class="ace-icon glyphicon glyphicon-hand-up bigger-120"></i>
                            </button>
                            <button class="btn btn-xs btn-warning backToNormal" data="${category.id}">
                                <i class="ace-icon glyphicon glyphicon-hand-down"></i>
                            </button>
                            <a class="btn btn-xs btn-danger "  href="${ctx}/comment/question/index?contentId=${question.id}">
                                <i class="ace-icon glyphicon glyphicon-comment bigger-120"></i>
                            </a>

                    </div>

                    <div class="hidden-md hidden-lg">
                        <div class="inline position-relative">
                            <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown" data-position="auto">
                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                            </button>

                            <ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                <li>
                                    <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
                                                                                <span class="blue">
                                                                                    <i class="ace-icon fa fa-search-plus bigger-120"></i>
                                                                                </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
                                                                                <span class="green">
                                                                                    <i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
                                                                                </span>
                                    </a>
                                </li>

                                <li>
                                    <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
                                                                                <span class="red">
                                                                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                                                                </span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>




    </tbody>

</table>
<script>
    $(function(){
        $(".add").on("click",function(){
            $("#modal-form .modal-content").load("${ctx}/category/add",{},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".editQuestion").on("click",function(){
            var id = $(this).attr("data");
            $("#modal-form .modal-content").load("${ctx}/question/add",{id:id},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".delete").on("click",function(){
                var r = confirm("确定要删除吗");
            if(r){
                 var id = $(this).attr("data");
                 window.location.href="${ctx}/question/delete?id="+id;
            }

        });
        $(".upToHot").on("click",function(){
            var id = $(this).attr("data");
            window.location.href="${ctx}/question/hot?id="+id;
        });
        $(".backToNormal").on("click",function(){
            var id = $(this).attr("data");
            window.location.href="${ctx}/question/back?id="+id;
        });

    });
</script>
</body>
</html>
