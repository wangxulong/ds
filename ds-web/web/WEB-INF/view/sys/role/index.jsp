<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>

    <title>角色管理</title>
</head>
<body>

<div class="page-header">
    <h1>
        角色管理
        <small>
            <i class="icon-double-angle-right"></i>
            角色信息列表
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
        <th>角色名</th>
        <th>编码</th>
        <th>描述</th>
        <th class="hidden-480">操作</th>


    </tr>
    </thead>

    <tbody>

        <c:forEach items="${sysRoles}" var="sysRole">
            <tr>
                <td class="center">
                    <label class="position-relative">
                        <input type="checkbox" class="ace" />
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>
                    ${sysRole.roleName}
                </td>
                <td> ${sysRole.roleCode}</td>
                <td> ${sysRole.roleDesc}</td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                        <shiro:hasPermission name="sysRole:add">
                            <button class="btn btn-xs btn-success addSysRole">
                                <i class="ace-icon fa fa-plus bigger-120 "></i>
                            </button>
                        </shiro:hasPermission>

                       <%-- <shiro:hasPermission name="sysRole:edit">
                            <button class="btn btn-xs btn-info">
                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </button>
                        </shiro:hasPermission>--%>
                        <shiro:hasPermission name="sysRole:delete">
                            <c:if test="${sysRole.roleCode ne 'admin'}">

                                <a class="btn btn-xs btn-danger delete" data="${sysRole.id}">
                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                </a>
                            </c:if>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sysRole:allotRes">
                            <button class="btn btn-xs btn-warning addResource" data="${sysRole.id}">
                                <i class="ace-icon fa fa-flag bigger-120">分配资源</i>
                            </button>
                        </shiro:hasPermission>

                </div>

                </td>
         </tr>
        </c:forEach>




    </tbody>

</table>
<script>
    $(function(){
        $(".addSysRole").on("click",function(){
            $("#modal-form .modal-content").load("${ctx}/sys/role/add",{},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".addResource").on("click",function(){
            var id=$(this).attr("data");
            $("#modal-form .modal-content").load("${ctx}/sys/role/addRes",{id:id},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".delete").on("click",function(){
            var r = confirm("确定要删除吗");
            if(r){
                var id = $(this).attr("data");
                window.location.href = "${ctx}/sys/role/delete?id="+id;
            }
        });
    });
</script>
</body>
</html>
