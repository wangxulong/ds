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
  <h4 class="blue bigger">添加资源</h4>
</div>

<div class="modal-body">
  <form:form class="form-horizontal" role="form" id="formSysRes" action="${ctx}/sys/res/save">
    <!-- #section:elements.form -->
    <form:hidden path="parentId"/>
    <form:hidden path="type"/>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 资源名 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:input path="name" placeholder="资源名" class="form-control" />
        </div>
      </div>
    </div>
    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 资源编码 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:input path="resourceCode" placeholder="资源编码" class="form-control" />
        </div>
      </div>
    </div>
  </form:form>
</div>

<div class="modal-footer">
  <button class="btn btn-sm" data-dismiss="modal">
    <i class="ace-icon fa fa-times"></i>
    取消
  </button>

  <button class="btn btn-sm btn-primary btnSave">
    <i class="ace-icon fa fa-check"></i>
    保存
  </button>
</div>
<script>
  $(function(){
     $(".btnSave").on("click",function(){
       $("#formSysRes").submit();
     });
  });
</script>
</body>
</html>
