<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="blue bigger">布置新作业</h4>
</div>


  <form:form class="form-horizontal" role="form" id="formSysRole" action="${ctx}/task/save" enctype="multipart/form-data">
    <!-- #section:elements.form -->
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 作业主题 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:input path="topic" placeholder="作业主题" class="form-control" />
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 截止时间 </label>

      <div class="col-sm-9">
        <div class="col-sm-12">
          <div class="row">
            <div class="col-sm-9">

              <div class="input-group"  >
                <form:input path="endTime" readonly="true" class="form-control date-picker"  type="text" data-date-format="yyyy-mm-dd"
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
      <label class="col-sm-3 control-label no-padding-right"> 作业内容 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:textarea path="content" cols="3" placeholder="作业内容" class="form-control" />
        </div>
      </div>
    </div>

    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"  > 上传附件 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:input path="file" type="file"    class="form-control"/>
        </div>
      </div>
    </div>
  </form:form>


<div class="modal-footer">
  <a class="btn btn-sm clear" href="${ctx}/task/index">
    <i class="ace-icon fa fa-times"></i>
    取消
  </a>
  <button class="btn btn-sm btn-primary btnSave">
    <i class="ace-icon fa fa-check"></i>
    保存
  </button>
</div>


<script>
  $(function(){
     $(".btnSave").on("click",function(){
       $("#formSysRole").submit();
     });
  });
  $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
    $(this).prev().focus();
  });
</script>
</body>
</html>
