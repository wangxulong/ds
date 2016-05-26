<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>

    <title>用户信息管理</title>
</head>
<body>
<div class="page-header">
    <h1>
        用户管理
        <small>
            <i class="icon-double-angle-right"></i>
            用户信息列表
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
        <th>用户名</th>
        <th>密码</th>
        <th>用户角色</th>
        <th class="hidden-480">状态</th>


    </tr>
    </thead>

    <tbody>

        <c:forEach items="${sysUsers}" var="sysUser">
            <tr>
                <td class="center">
                    <label class="position-relative">
                        <input type="checkbox" class="ace" />
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>
                    ${sysUser.userName}
                </td>
                <td> ${sysUser.password}</td>
                <td>
                    <c:forEach items="${sysUser.userRoleNames}" var="userRoleName">
                        <span class="label label-sm label-success">${userRoleName}</span>
                    </c:forEach>
                </td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                        <shiro:hasPermission name="sysUser:add">
                            <button class="btn btn-xs btn-success addSysUser">
                                <i class="ace-icon fa fa-plus bigger-120 "></i>
                            </button>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sysUser:edit">
                            <button class="btn btn-xs btn-info edit" data="${sysUser.id}">
                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </button>
                        </shiro:hasPermission>
                        <shiro:hasPermission name="sysUser:delete">
                            <c:if test="${sysUser.userName ne 'admin'}">
                                <a class="btn btn-xs btn-danger delete" data="${sysUser.id}" >
                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                </a>
                            </c:if>

                        </shiro:hasPermission>
                        <shiro:hasPermission name="sysUser:allotRole">
                            <button class="btn btn-xs btn-warning addRole" data="${sysUser.id}">
                                <i class="ace-icon fa fa-flag bigger-120">分配角色</i>
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
        $(".addSysUser").on("click",function(){
            $("#modal-form .modal-content").load("${ctx}/sys/user/add",{},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".edit").on("click",function(){
            var id = $(this).attr("data");
            $("#modal-form .modal-content").load("${ctx}/sys/user/add",{id:id},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".delete").on("click",function(){
            var r = confirm("确定要删除吗");
            if(r){
                var id = $(this).attr("data");
                window.location.href="${ctx}/sys/user/delete?id="+id;
            }
        });


        $(".addRole").on("click",function(){
            var userId = $(this).attr("data");
            $("#modal-form .modal-content").load("${ctx}/sys/user/addRole",{id:userId},function(){
                $("#modal-form").modal("show");
            });
        });

    });
</script>
</body>
</html>
