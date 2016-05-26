<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="page-header">
  <h1>
    课程管理
    <small>
      >> 修改课程信息
    </small>
  </h1>
</div>


  <form:form class="form-horizontal" role="form" commandName="course" id="formSysRole" action="${ctx}/course/update" enctype="multipart/form-data">
    <!-- #section:elements.form -->
    <form:input path="id" type="hidden" value="${course.id}"/>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 课程名字 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:input path="name" placeholder="课程名字" class="form-control"  value="${course.name}"/>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 课程简介 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <div class="wysiwyg-editor" id="editor" >${course.outline}</div>
          <form:hidden path="outline"  />
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"  > 教学计划 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:input path="file" type="file"   class="form-control"/>
        </div>
      </div>
    </div>
  </form:form>


<div class="modal-footer">
  <a class="btn btn-sm clear" href="${ctx}/course/index">
    <i class="ace-icon fa fa-times"></i>
    取消
  </a>
  <button class="btn btn-sm btn-primary btnSave">
    <i class="ace-icon fa fa-check"></i>
    保存
  </button>
</div>

<script src="${ctx}/static/js/ace/assets/js/bootstrap-wysiwyg.js"></script>
<script src="${ctx}/static/js/ace/assets/js/markdown/bootstrap-markdown.js"></script>
<script src="${ctx}/static/js/ace/assets/js/jquery.hotkeys.js"></script>
<script src="${ctx}/static/js/ace/assets/js/bootstrap-wysiwyg.js"></script>
<script src="${ctx}/static/js/ace/assets/js/bootbox.js"></script>
<script>
  $(function(){
     $(".btnSave").on("click",function(){
       var d= $('#editor').html();
       $("#outline").val(d);
       $("#formSysRole").submit();
     });
  });
  $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
    $(this).prev().focus();
  });

  $('#editor').ace_wysiwyg({
    toolbar:
            [
              'font',
              null,
              'fontSize',
              null,
              {name:'bold', className:'btn-info'},
              {name:'italic', className:'btn-info'},
              {name:'strikethrough', className:'btn-info'},
              {name:'underline', className:'btn-info'},
              null,
              {name:'insertunorderedlist', className:'btn-success'},
              {name:'insertorderedlist', className:'btn-success'},
              {name:'outdent', className:'btn-purple'},
              {name:'indent', className:'btn-purple'},
              null,
              {name:'justifyleft', className:'btn-primary'},
              {name:'justifycenter', className:'btn-primary'},
              {name:'justifyright', className:'btn-primary'},
              {name:'justifyfull', className:'btn-inverse'},
              null,
              {name:'createLink', className:'btn-pink'},
              {name:'unlink', className:'btn-pink'},
              null,
              {name:'insertImage', className:'btn-success'},
              null,
              'foreColor',
              null,
              {name:'undo', className:'btn-grey'},
              {name:'redo', className:'btn-grey'}
            ],
    'wysiwyg': {
      //fileUploadError: showErrorAlert
    }
  }).prev().addClass('wysiwyg-style2');
</script>
</body>
</html>
