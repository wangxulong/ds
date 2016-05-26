<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/5/21
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>考试修改</title>
</head>
<body>
<修改界面>
<form:form class="form-horizontal" role="form"  commandName="exam" action="${ctx}/exam/update" enctype="multipart/form-data">
    <!--隐藏的提交组件-->
        <form:input path="id" class="hidden"/>
        <form:input path="year" class="hidden"/>
        <form:input path="term" class="hidden"/>
        <form:input path="examTypeId" class="hidden"/>
    <div class="center" id="form-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="blue bigger">发布考试试卷</h4>
        </div>

        <!-- #section:elements.form -->
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right" > 试卷标题 </label>

            <div class="col-sm-9">
                <div class="col-sm-9">
                    <form:input path="title" placeholder="试卷主题" class="form-control" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"> 开始时间 </label>

            <div class="col-sm-9">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-9">

                            <div class="input-group"  >
                                <form:input path="startTime" readonly="true" class="form-control date-picker"  type="text" data-date-format="yyyy-mm-dd"
                                            data-date-language="zh-CN"
                                />
                                                                <span class="input-group-addon">
                                                                  <i class="fa fa-calendar bigger-110"></i>
                                                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"> 结束时间 </label>

            <div class="col-sm-9">
                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-9">

                            <div class="input-group"  >
                                <form:input path="endTime" readonly="true" class="form-control date-picker"  type="text" data-date-format="yyyy-mm-dd"
                                            data-date-language="zh-CN"/>
                                                                <span class="input-group-addon">
                                                                  <i class="fa fa-calendar bigger-110"></i>
                                                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"> 简单描述 </label>

            <div class="col-sm-9">
                <div class="col-sm-9">
                    <form:textarea path="description" cols="3" placeholder="简单描述" class="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"  > 上传附件 </label>

        <div class="col-sm-9">
            <div class="col-sm-9">
                <form:input path="pic" type="file"    class="form-control"/>
            </div>
        </div>
    </div>

        <hr/>
        <a class="btn btn-sm" data-dismiss="modal" href="${ctx}/exam/history">
            <i class="ace-icon fa fa-times"></i>
            取消
        </a>

        <button class="btn btn-sm btn-primary btnSave">
            <i class="ace-icon fa fa-check"></i>
            保存
        </button>
    </div>
</form:form>
</body>
</html>
