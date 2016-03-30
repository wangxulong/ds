<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>

    <title></title>
</head>
<body>
<p class="bg-info"> 当前问答为：${question.title}
<a class="btn btn-primary" href="${ctx}/question/index"> 返回</a>
<a class="btn btn-success addComment" > 添加</a>
</p>

<table id="sample-table-1" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>评论内容</th>
        <th>评论人</th>
        <th>评论时间</th>
        <th>操作</th>
    </tr>
    </thead>

    <tbody>

        <c:forEach items="${comments}" var="comment">
            <tr>
                <td class="center">
                    <label class="position-relative">
                        <input type="checkbox" class="ace" />
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>
                    ${comment.content}
                </td>
                <td>
                    ${comment.userName}
                </td>

                <td>
                    ${comment.createTime}
                </td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                        <%--<shiro:hasPermission name="s:add">--%>
                            <%--<button class="btn btn-xs btn-success addSysRole">--%>
                                <%--<i class="ace-icon fa fa-plus bigger-120 "></i>--%>
                            <%--</button>--%>
                        <%--</shiro:hasPermission>--%>
                            <button class="btn btn-xs btn-success addComment">
                                <i class="ace-icon fa fa-plus bigger-120 "></i>
                            </button>
                            <button class="btn btn-xs btn-info editComment"   data="${comment.id}">
                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </button>
                            <a class="btn btn-xs btn-danger delete"  data="${comment.id}">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </a>
                            <button class="btn btn-xs btn-warning upToHot" data="${comment.id}" >
                                <i class="ace-icon fa fa-flag bigger-120"></i>
                            </button>

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
        $(".addComment").on("click",function(){
            var contentId = "${question.id}";
            var contentType = "${question.type}";
            $("#modal-form .modal-content").load("${ctx}/comment/question/add",{contentId:contentId,contentType:contentType},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".editComment").on("click",function(){
            var id = $(this).attr("data");
            $("#modal-form .modal-content").load("${ctx}/comment/question/add",{id:id},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".delete").on("click",function(){
                var r = confirm("确定要删除吗");
            if(r){
                 var id = $(this).attr("data");
                 window.location.href="${ctx}/comment/question/delete?id="+id;
            }

        });



    });
</script>
</body>
</html>
