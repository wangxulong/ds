<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>教学计划</title>
</head>
<body>
<div class="row">
    <div class="col-md-6">
        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>时间</th>
                <th>内容</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${schedules}" var="schedule">
                <tr>

                    <td>
                        <fmt:formatDate value="${schedule.createTime}" pattern="yyyy-MM-dd HH:mm:dd" />
                    </td>
                    <td>
                            ${schedule.content}
                    </td>
                    <td>
                        <a class="btn btn-xs btn-info "  href="${ctx}/download/${schedule.id}"  >
                            <i class="ace-icon fa fa-pencil bigger-120"></i> 下载
                        </a>
                    </td>

                </tr>
            </c:forEach>




            </tbody>

        </table>
    </div>
    <div class="col-md-6">
        <div class="widget-box">
            <div class="widget-header">
                <h4>上传教学计划</h4>
            </div>

            <div class="widget-body">
                <div class="widget-main no-padding">

                    <form class="form-horizontal" method="post" action="${ctx}/teacher/${teacherId}/plan" enctype="multipart/form-data">
                        <fieldset>
                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"> 简介 </label>

                                <div class="col-sm-10">
                                    <div class="col-sm-12">
                                        <textarea name="content" cols="3" placeholder="简介" class="form-control"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label no-padding-right"  > 附件 </label>

                                <div class="col-sm-10">
                                    <div class="col-sm-12">
                                        <input class="form-control" type="file"   name="file"/>
                                    </div>
                                </div>
                            </div>
                        </fieldset>



                        <div class="form-actions center">
                            <button type="submit" class="btn btn-sm btn-success btnSubmit">
                                提交
                                <i class="icon-arrow-right icon-on-right bigger-110"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function(){
        $(".btnSubmit").on("click",function(){
             $(this).attr("disable",true);
        });


    });
</script>
</body>
</html>
