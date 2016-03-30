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
  <h4 class="blue bigger">编辑评论信息</h4>
</div>

<div class="modal-body">
  <form:form class="form-horizontal form" role="form"  action="${ctx}/comment/question/save">
    <!-- #section:elements.form -->
    <form:hidden path="id"/>
    <form:hidden path="contentId"/>
    <form:hidden path="contentType"/>

    <div class="form-group">
      <label class="col-sm-3 control-label no-padding-right"> 评论内容 </label>

      <div class="col-sm-9">
        <div class="col-sm-9">
          <form:textarea path="content" placeholder="评论内容" class="form-control" />
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
       $(".form").submit();
     });
  });
</script>
</body>
</html>
