<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>基本信息</title>
</head>
<body>
<%@include file="/include/frontCenterHeader.jsp"%>
<div class="container">
  <div class="row">
    <div class="col-md-2">
      <div class="list-group">
        <a href="user-leave.html" class="list-group-item ">
          我的请假
        </a>
        <a href="user-leave-submit.html" class="list-group-item active">我要请假</a>
      </div>
    </div>
    <div class="col-md-10">

      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">
            请假条
          </h3>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-md-12">
              <form class="form-horizontal">
                <div class="form-group">
                  <label  class="col-sm-2 control-label">请假时间</label>
                  <div class="col-sm-10">
                    <div class="input-group date form_date  " data-date="" data-date-format="yyyy-MM-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                      <input class="form-control" size="16" type="text" value="" readonly>
                      <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                      <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="hidden" id="dtp_input2" value="" /><br/>
                  </div>
                </div>
                <div class="form-group">
                  <label  class="col-sm-2 control-label">请假原因</label>
                  <div class="col-sm-10">
                    <textarea rows="3" class="form-control" placeholder="请假原因"></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label   class="col-sm-2 control-label">附件</label>
                  <div class="col-sm-10">
                    <input id="input-dim-2" name="homework" type="file" multiple class="file-loading" >
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary">提交</button>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>
</div>

<script>
  $(function(){
    //初始化上传控件
    $("#input-dim-2").fileinput({
      language: 'zh',
      uploadUrl: "/file-upload-batch/2",
      allowedFileExtensions: ["jpg", "png", "gif","doc","docx"],
      maxImageWidth: 250,
      maxImageHeight: 250
    });
  });

</script>
</body>
</html>
