<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="${ctx}/static/fileinput/css/fileinput.min.css" />
    <script src="${ctx}/static/fileinput/js/fileinput.js" type="text/javascript"></script>
    <script src="${ctx}/static/fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="${ctx}/static/fileinput/js/fileinput_locale_zh.js"></script>

    <script>
        $(function(){
            $("#pic").fileinput({
                 language: 'zh',
                'showUpload':false,
                'previewFileType':'any',
                allowedFileTypes : [ 'image' ],
                allowedFileExtensions : [ 'jpg', 'png', 'gif' ]
            });
        })

    </script>
    <title></title>
</head>
<body>
<div class="row">
    <div class="col-xs-12">
<!-- PAGE CONTENT BEGINS -->
    <div class="page-header">
        <h1>
            添加需求
        </h1>
    </div>
    <form:form  class="form-horizontal" role="form" method="POST" enctype="multipart/form-data" action="${ctx}/require/save">
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"  > 标题 </label>

            <div class="col-sm-9">
            <form:input path="title"   placeholder="标题" class="col-xs-10 col-sm-5" />
            </div>

        </div>

        <div class="space-4"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"  > 类型 </label>

            <div class="col-sm-9">
                <form:select path="type" items="${categorys}" itemLabel="title"
                             itemValue="id" class="col-xs-10 col-sm-5"/>
            </div>

        </div>

        <div class="space-4"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"  > 内容 </label>

            <div class="col-sm-9">
                <form:textarea path="description"   placeholder="内容"  class="col-xs-10 col-sm-5" />
            </div>

        </div>

        <div class="space-4"></div>
        <div class="form-group">
            <label class="col-sm-3 control-label no-padding-right"  > 图片 </label>

            <div class="col-sm-9">
                <input type="file" name="pic" id="pic"  class="file"/>
            </div>

        </div>
        <div class="clearfix form-actions">
            <div class="col-md-offset-3 col-md-9">
                <input class="btn btn-info" type="submit">
                    <i class="icon-ok bigger-110"></i>
                </input>

                &nbsp; &nbsp; &nbsp;
                <a class="btn" type="reset" href="${ctx}/require/index">
                    <i class="icon-undo bigger-110"></i>
                    返回
                </a>
            </div>
        </div>

    </form:form>
    </div>

</div>

</body>

</html>
