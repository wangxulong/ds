<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>请假管理</title>

</head>
<body>
<div class="page-header">
    <h1>
        ${course.name}-请假管理
        <small>
            <i class="icon-double-angle-right"></i>
        </small>
    </h1>
</div>
<select class="ui-pg-selbox" role="listbox" style="margin-bottom: 10px;" id="listtype">
    <option role="option" value="-1" selected="selected">全部</option>
    <option role="option" value="0">待审核</option>
    <option role="option" value="1">已审核</option>
    <option role="option" value="2">已拒绝</option>
</select>

<table id="sample-table-1" class="table table-striped table-bordered table-hover" listType="${type}">
    <thead>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>标题</th>

        <th>请假人</th>
        <th>请假课程</th>
        <th>当前状态</th>
        <th class="hidden-480">操作</th>


    </tr>
    </thead>

    <tbody>
    <c:forEach items="${notes}" var="note">
        <tr nid="${note.id}">
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>${note.title}</td>

            <td> ${note.student.name}</td>
            <td> ${note.course.name}</td>
            <td>
                <c:if test="${note.status == 0}">
                    <span class="label label-sm label-warning">待审核</span>
                </c:if>
                <c:if test="${note.status == 1}">
                    <span class="label label-sm label-success">已审核</span>
                </c:if>
                <c:if test="${note.status == 2}">
                    <span class="label label-sm label-danger">已拒绝</span>
                </c:if>

            </td>
            <td class="hidden-480">
                <div class="hidden-sm hidden-xs btn-group">
                    <a class="btn btn-xs btn-info" href="javascirpt:;" name="detail" nid="${note.id}">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                    </a>
                       <%-- <c:if test="${not empty note.attachId}">
                            <a href="${ctx}/download/${note.attachId}" class="btn btn-primary btn-xs"> 下载附件</a>
                        </c:if>--%>

                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    </table>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="blue bigger">请假详细</h4>
            </div>


            <table border="1px solid #000" style="margin:0 auto;margin-top:10px;margin-bottom:10px;width:90%;" class="table table-striped table-bordered table-hover">
                <tr>
                    <th width="100px">标题</th>
                    <td id="title"></td>
                </tr>
                <tr>
                    <th>申请人</th>
                    <td id="student"></td>
                </tr>
                <tr>
                    <th>请假课程</th>
                    <td id="course"></td>
                </tr>
                <tr>
                    <th>请假时间</th>
                    <td id="time"></td>
                </tr>
                <tr>
                    <th>请假内容</th>
                    <td id="content"></td>
                </tr>
            </table>

            <div class="modal-footer">
                <a class="btn btn-sm clear" onclick="$('#myModal').modal('hide');">
                    <i class="ace-icon fa fa-times"></i>
                    取消
                </a>
                <a class="btn btn-sm btn-success btnSave" href="javascript:;" id="approve_btn" nid="">
                    <i class="ace-icon fa fa-check"></i>
                    通过
                </a>
                <a class="btn btn-sm btn-danger btnSave" href="javascript:;" id="dismiss_btn" nid="">
                    <i class="ace-icon fa fa-bell"></i>
                    拒绝
                </a>
            </div>
        </div>
    </div>
    </div>
<script>
    $(function(){
        var type = ${type};
        $("#listtype").find("option").each(function(){
            if($(this).val()==type){
                $(this).attr("selected",true);
            }
        })
        $("a[name='detail']").each(function(){
            $(this).unbind("click");
            $(this).bind("click",function(){
                var nid = $(this).attr("nid");
                $.ajax({
                    url:'${ctx}/class/note/get',
                    data:{
                        'id':nid
                    },
                    type:'post',
                    dataType:'json',
                    success:function(msg){
                        $("#title").text(msg.title);
                        $('#student').text(msg.student.name);
                        $('#course').text(msg.course.name);
                        $('#time').text(msg.time);
                        $("#content").text(msg.content);
                        $("#approve_btn").attr('nid',nid);
                        $("#dismiss_btn").attr('nid',nid);
                        if(msg.status!=0){
                            $("#approve_btn").hide();
                            $("#dismiss_btn").hide();
                        }else{
                            $("#approve_btn").show();
                            $("#dismiss_btn").show();
                        }
                    },
                    error:function(msg){
                        alert("服务器出错!");
                    }
                })
                $("#myModal").modal('show');
            })
        })

        $("#approve_btn").unbind("click");
        $("#approve_btn").bind("click",function(){
            var nid = $(this).attr("nid");
            $.ajax({
                url:'${ctx}/class/note/approve',
                type:'post',
                dataType:'json',
                data:{
                    'id':nid
                },
                success:function(msg){
                    if(msg.status==100){
                        $("#myModal").modal('hide');
                        var approveObj = "<span class='label label-sm label-success'>已审核</span>";
                        $("tr").each(function(){
                            if($(this).attr("nid")==nid){
                                $(this).find("td").eq(4).html(approveObj);
                            }
                        })

                    }else{
                        alert("服务器错误!");
                    }
                },
                error:function (msg) {
                    alert("服务器错误!");
                }
            })
        });


        $("#dismiss_btn").unbind("click");
        $("#dismiss_btn").bind("click",function(){
            var nid = $(this).attr("nid");
            $.ajax({
                url:'${ctx}/class/note/dismiss',
                type:'post',
                dataType:'json',
                data:{
                    'id':nid
                },
                success:function(msg){
                    if(msg.status==100){
                        $("#myModal").modal('hide');

                        var dismissObj = "<span class='label label-sm label-danger'>已拒绝</span>";

                        $("tr").each(function(){
                            if($(this).attr("nid")==nid){
                                $(this).find("td").eq(4).html(dismissObj);
                            }
                        })

                    }else{
                        alert("服务器错误!");
                    }
                },
                error:function (msg) {
                    alert("服务器错误!");
                }
            })
        });

        $("#listtype").change(function(){
            var type = $(this).find("option:selected").val();
            document.location.href='${ctx}/class/note/index?type='+type+'&cid='+${course.id};
        })
    })
</script>
</body>
</html>
