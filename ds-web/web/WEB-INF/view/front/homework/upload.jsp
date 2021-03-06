<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
              上传作业
            </h3>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-md-12">
                 <div class="page-header ">
                   <h2 class="text-center">${task.topic} <small class="text-danger">截至时间：<fmt:formatDate value="${task.endTime}" pattern="yyyy-MM-dd" /> </small></h2>
                 </div>
                <form class="form-horizontal form" enctype="multipart/form-data" method="post" action="${ctx}/front/homework/upload">
                  <input type="hidden" name="taskId" value="${task.id}"/>
                  <div class="form-group">
                    <label   class="col-sm-2 control-label">作业名称 </label>
                    <div class="col-sm-10">
                      <input type="type" class="form-control" name="topic"  placeholder="作业">
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">作业描述</label>
                    <div class="col-sm-10">
                      <textarea rows="3" class="form-control" name="description" placeholder="作业描述"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label   class="col-sm-2 control-label">附件</label>
                    <div class="col-sm-10">
                      <input id="input-dim-2" name="pic" type="file"  class="file-loading" >
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
        showPreview:false,
        showUpload:false,
        autoReplace:true,
        allowedFileExtensions: ['jpg', 'gif', 'png', 'txt','doc','docx','xls','xlsx'],
      });
      //验证插件
      $(function(){
        $('.form').bootstrapValidator({
          feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
          },
          fields: {
            topic:{
              validators: {
                notEmpty: {
                }
              }
            },
            description: {
              validators: {
                notEmpty: {
                }
              }
            }
          }
        });
      });
    });

  </script>
</body>
</html>
