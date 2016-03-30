<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>

    <title></title>
</head>
<body>
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

                        <shiro:hasPermission name="sysRole:edit">
                            <button class="btn btn-xs btn-info">
                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </button>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sysRole:delete">
                            <a class="btn btn-xs btn-danger" href="${ctx}/sys/role/delete?id=${sysRole.id}">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </a>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sysRole:allotRes">
                            <button class="btn btn-xs btn-warning addResource" data="${sysRole.id}">
                                <i class="ace-icon fa fa-flag bigger-120"></i>
                            </button>
                        </shiro:hasPermission>

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
    });
</script>
</body>
</html>
