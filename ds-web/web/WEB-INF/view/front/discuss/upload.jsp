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
        <%@include file="left.jsp"%>
      </div>
      <div class="col-md-10">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">
              上传研讨课作业
            </h3>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-md-12">
                <form class="form-horizontal form" method="post" enctype="multipart/form-data" action="${ctx}/front/discuss/${id}/upload">

                  <div class="form-group">
                    <label   class="col-sm-2 control-label">附件</label>
                    <div class="col-sm-10">
                      <input id="input-dim-2" name="file" type="file" multiple class="file-loading" >
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-primary">上传</button>
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
        allowedFileExtensions: ["jpg", "png", "gif","doc","docx","txt"],
        showUpload:false,
        autoReplace:true
      });
      $('.form').bootstrapValidator({
        feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
          file:{
            validators: {
              notEmpty: {
              }
            }
          }
        }
      });
    });

  </script>
</body>
</html>
