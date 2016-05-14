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
    教师管理
    <small>
      <i class="icon-double-angle-right"></i>
      编辑教师信息
    </small>
  </h1>
</div><!-- /.page-header -->
<div class="row">
  <div class="col-md-12">
    <form:form class="form-horizontal form" role="form"  action="${ctx}/teacher/save">
      <form:hidden path="id"/>
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 教师姓名 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <form:input path="name" placeholder="教师姓名" class="form-control" />
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 身份证号 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <form:input path="idcard" placeholder="身份证号" class="form-control" />
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 工作证号 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <form:input path="jobNumber" placeholder="工作证号" class="form-control" />
          </div>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 性别 </label>
        <div class="col-sm-9">
          <label class="radio-inline">
            <form:radiobutton path="sex" value="1" class="ace" />
            <span class="lbl"> 男</span>
          </label>
          <label class="radio-inline">
            <form:radiobutton path="sex" value="0" class="ace" />
            <span class="lbl"> 女</span>
          </label>
        </div>
      </div>

      <div class="form-group ">
        <label class="col-sm-3 control-label no-padding-right"> 出生年月 </label>
        <div class="col-sm-9">
          <div class="col-sm-12">
          <div class="row">
            <div class="col-sm-9">

              <div class="input-group"  >
                <form:input path="birthDate" readonly="true" class="form-control date-picker" id="birth" type="text" data-date-format="yyyy-mm-dd"
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
      <div class="form-group ">
        <label class="col-sm-3 control-label no-padding-right"> 入职时间 </label>
        <div class="col-sm-9">
        <div class="col-sm-12">
          <div class="row">
            <div class="col-sm-9">

              <div class="input-group"  >
                <form:input path="joinDate" readonly="true" class="form-control date-picker" id="birth" type="text" data-date-format="yyyy-mm-dd"
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
        <label class="col-sm-3 control-label no-padding-right"> 状态</label>
        <div class="col-sm-9">
          <label class="radio-inline">
            <form:radiobutton path="state" value="1" class="ace" />
            <span class="lbl"> 教学中</span>
          </label>
          <label class="radio-inline">
            <form:radiobutton path="state" value="0" class="ace" />
            <span class="lbl"> 未教学</span>
          </label>
        </div>
      </div>
        <div class="form-group">
          <label class="col-sm-3 control-label no-padding-right">职称</label>
          <div class="col-sm-9">
            <div class="col-sm-9">
              <form:select path="level" style="width:100%;" id="form-field-select-3">
                <form:option value="">&nbsp;</form:option>
                <form:option value="教授">教授</form:option>
                <form:option value="副教授">副教授</form:option>
                <form:option value="讲师">讲师</form:option>
                <form:option value="助教">助教</form:option>
              </form:select>
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

      <%-- <div class="form-group ">
         <label class="col-sm-3 control-label no-padding-right"> 离职时间 </label>
         <div class="col-sm-9">
           <div class="row">
             <div class="col-sm-9">
               <div class="input-group"  >
                 <form:input path="leaveDate" readonly="true"  class="form-control date-picker" id="birth" type="text" data-date-format="yyyy-mm-dd"
                             data-date-language="zh-CN"
                 />
                                                                     <span class="input-group-addon">
                                                                         <i class="fa fa-calendar bigger-110"></i>
                                                                     </span>
               </div>
             </div>
           </div>

         </div>
       </div>--%>
    </form:form>
    <div class="clearfix form-actions text-center">
      <a class="btn btn-sm clear" href="${ctx}/teacher/index">
        <i class="ace-icon fa fa-arrow-left"></i>
        返回
        </a>
      <button class="btn btn-sm clear" >
        <i class="ace-icon fa fa-times"></i>
        清除
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
