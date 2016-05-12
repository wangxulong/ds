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
    课程组管理
    <small>
      <i class="icon-double-angle-right"></i>
      DS课程组信息
    </small>
  </h1>
</div><!-- /.page-header -->
<div class="row">
  <div class="col-md-12">
    <form:form class="form-horizontal form" role="form"  action="${ctx}/group/save">
      <form:hidden path="id"/>
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 名称 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <form:input path="name" placeholder="名称" class="form-control" />
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 描述 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <div class="wysiwyg-editor" id="editor" >${command.description}</div>
            <form:hidden path="description"/>
            <%--<form:textarea path="description" placeholder="课程组描述" style="resize:none;" rows="8" class="form-control wysiwyg-editor" />--%>
          </div>
        </div>
      </div>


    </form:form>
    <div class="clearfix form-actions text-center">

      <button class="btn btn-sm clear" >
        <i class="ace-icon fa fa-times"></i>
        取消
      </button>

      <button class="btn btn-sm btn-primary btnSave">
        <i class="ace-icon fa fa-check"></i>
        保存
      </button>
    </div>
  </div>
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
       $("#description").val(d);

       $(".form").submit();
     });
    $(".clear").on("click",function () {
        $(".form")[0].reset();
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
