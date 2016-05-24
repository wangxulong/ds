<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>研讨课</title>
</head>
<body>
<div class="page-header">
    <h1>
        ${course.name}-研讨课
        <small>
            <i class="icon-double-angle-right"></i>
        </small>
    </h1>
</div>
<div style="padding:0px 10px 10px 10px;">
<a class="btn btn-success btn-sm" href="${ctx}/class/seminar/add?cid=${course.id}" name="add_btn">
    <i class="ace-icon fa fa-plus bigger-120 "></i>新增
</a>
</div>
<table id="sample-table-1" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>研讨课名称</th>
        <th>研讨课描述</th>
        <th>开始时间</th>
        <th>结束时间</th>
        <th class="hidden-480">操作</th>


    </tr>
    </thead>

    <tbody>
    <c:forEach items="${seminars}" var="seminar">
        <tr sid="${seminar.id}">
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>${seminar.name}</td>
            <td>${seminar.desc}</td>
            <td>${seminar.startTime}</td>
            <td>${seminar.endTime}</td>
            <td width="200px">

                <div class="hidden-sm hidden-xs btn-group">




                    <a class="btn btn-xs btn-info " href="${ctx}/class/seminarTopic/index?sid=${seminar.id}">
                        <i class="ace-icon fa fa-book bigger-120"></i> 题目
                    </a>

                    <a class="btn btn-xs btn-primary" href="javascript:;" name="update_btn">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                    </a>
                    <a class="btn btn-xs btn-danger" href="javascript:;" name="delete_btn">
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


        $('a[name="delete_btn"]').each(function(){
            $(this).unbind('click');
            $(this).bind('click',function(){
                if(window.confirm("确定要删除吗?")){
                    var sid = $(this).parents("tr").attr("sid");
                    var cid = ${course.id};
                    document.location.href="${ctx}/class/seminar/delete?cid="+cid+"&sid="+sid;
                }

            });
        })

        $('a[name="update_btn"]').each(function(){
            $(this).unbind('click');
            $(this).bind('click',function(){
                var sid = $(this).parents("tr").attr("sid");
                var cid = ${course.id};
                document.location.href="${ctx}/class/seminar/update?cid="+cid+"&sid="+sid;
            });
        })
    })
</script>
</body>

</html>
