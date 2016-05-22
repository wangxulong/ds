<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="modal-header">
  <h4 class="blue bigger">新增研讨课</h4>
</div>

<div style="margin-top:20px;">
<form:form class="form-horizontal" role="form" id="formSysRole" action="${ctx}/class/seminar/save" enctype="multipart/form-data">
  <!-- #section:elements.form -->
  <div class="form-group">
    <label class="col-sm-3 control-label no-padding-right"> 名称</label>

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
        <form:textarea path="desc" cols="3" placeholder="描述" class="form-control" />
      </div>
    </div>
  </div>


  <div class="form-group">
    <label class="col-sm-3 control-label no-padding-right"> 开始时间 </label>

    <div class="col-sm-9">
      <div class="col-sm-9">
        <form:input path="startTime" type="date" cols="3" placeholder="开始时间" class="form-control" />
      </div>
    </div>
  </div>

  <div class="form-group">
    <label class="col-sm-3 control-label no-padding-right"> 结束时间 </label>

    <div class="col-sm-9">
      <div class="col-sm-9">
        <form:input path="endTime" type="date" cols="3" placeholder="结束时间" class="form-control" />
      </div>
    </div>
  </div>
  <form:input path="courseId" type="hidden" cols="3" placeholder="课程编号" class="form-control" value="${cid}"/>
  <form:input path="id" type="hidden" class="form-control" />
</form:form>


<div class="modal-footer">
  <a class="btn btn-sm clear" href="javascript:history.back()">
    <i class="ace-icon fa fa-times"></i>
    取消
  </a>
  <button class="btn btn-sm btn-primary btnSave">
    <i class="ace-icon fa fa-check"></i>
    保存
  </button>
</div>
</div>

<script>
  $(function(){
     $(".btnSave").on("click",function(){
       $("#formSysRole").submit();
     });
  });

</script>
</body>
</html>
