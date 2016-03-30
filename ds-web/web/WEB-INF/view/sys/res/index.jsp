<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>

    <title></title>
</head>
<body>

<div class="col-sm-6">
    <div class="widget-box">
        <div class="widget-header widget-header-flat">
            <h4 class="widget-title smaller">菜单管理</h4>

            <div class="widget-toolbar">
                <a class="btn btn-primary" href="javascript:void(0);" id="addParentMenu" role="button">添加菜单</a>
            </div>
        </div>

        <div class="widget-body">
            <div class="widget-main">
                <div class="dd" id="nestable">
                    <ol class="dd-list">
                        <c:forEach items="${menus}" var="menu" varStatus="s">
                            <li class="dd-item" data-id="${s.count}">
                                <div class="dd-handle">
                                        ${menu.parent.name}
                                    <div class="pull-right action-buttons">
                                        <a class="blue addChildMenu" href="#"  data="${menu.parent.id}">
                                            <i class="ace-icon fa fa-plus bigger-130"></i>
                                        </a>
                                    </div>

                                </div>
                                <c:if test="${not empty menu.children}">
                                    <ol class="dd-list">
                                        <c:forEach items="${menu.children}" var="child">
                                            <li class="dd-item">
                                                <div class="dd-handle">
                                                        ${child.name}
                                                    <div class="pull-right action-buttons">
                                                        <a class="blue addButton" href="#"  data="${child.id}">
                                                            <i class="ace-icon fa fa-plus bigger-130"></i>
                                                        </a>
                                                        <a class="red deleteMenu" href="#" data="${child.id}">
                                                            <i class="ace-icon fa fa-trash-o bigger-130"></i>
                                                        </a>

                                                    </div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ol>

                                </c:if>
                            </li>
                        </c:forEach>

                    </ol>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-sm-6" id="btnContent">

</div>

<script src="${ctx}/static/js/ace/assets/js/jquery.nestable.js"></script>
<script type="text/javascript">
    jQuery(function($){

        $('.dd').nestable();

        $('.dd-handle a').on('mousedown', function(e){
            e.stopPropagation();
        });

        $('[data-rel="tooltip"]').tooltip();

        $(".addChildMenu").on("click",function(e){
            e.preventDefault();
            var parentId = $(this).attr("data");
            $("#modal-form .modal-content").load("${ctx}/sys/res/add",{type:"menu",parentId:parentId},function(){
                $("#modal-form").modal("show");
            });
        });
        $(".addButton").on("click",function(e){
            e.preventDefault();
            var parentId = $(this).attr("data");
            $("#btnContent").load("${ctx}/sys/res/addButton",{parentId:parentId},function(){
            });
        });



        $(".deleteMenu").on("click",function(e){
            e.preventDefault();
            var id = $(this).attr("data");
            window.location.href="${ctx}/sys/res/delete?id="+id;
        });

        $("#addParentMenu").on("click",function(e){
            e.preventDefault();
            $("#modal-form .modal-content").load("${ctx}/sys/res/add",{type:"folder",parentId:0},function(){
                $("#modal-form").modal("show");
            });
        });


    });
</script>
<style>
    .dd-handle{
        cursor:pointer
    }
</style>
</body>
</html>
