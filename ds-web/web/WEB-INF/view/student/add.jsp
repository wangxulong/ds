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
    学生管理
    <small>
      <i class="icon-double-angle-right"></i>
      编辑学生信息
    </small>
  </h1>
</div><!-- /.page-header -->
<div class="row">
  <div class="col-md-12">
    <form:form class="form-horizontal form" role="form"  action="${ctx}/student/save">
      <form:hidden path="id"/>
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 学生姓名 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <form:input path="name" placeholder="学生姓名" class="form-control" />
          </div>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 学生证号 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <form:input path="studentNumber" placeholder="学生证号" class="form-control" />
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
      <div class="form-group ">
        <label class="col-sm-3 control-label no-padding-right"> 入学时间 </label>
        <div class="col-sm-9">
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
      <div class="form-group">
        <label class="col-sm-3 control-label no-padding-right"> 课程 </label>

        <div class="col-sm-9">
          <div class="col-sm-9">
            <c:choose>
              <c:when test="${ empty command.id}">
                <select name="courseId" class="form-control">
                  <c:forEach items="${courses}" var="course">
                    <option value="${course.courseId}"
                            <c:if test="${myCourse.id eq course.courseId}"> selected</c:if>
                            >${course.teacherName} --- ${course.courseName}  </option>
                  </c:forEach>
                </select>
              </c:when>
              <c:otherwise>
                <c:forEach items="${courses}" var="course">
                          <c:if test="${myCourse.id eq course.courseId}">
                            <p   class="form-control-static"> ${course.teacherName} -- ${course.courseName}</p>
                          </c:if>
                </c:forEach>
              </c:otherwise>
            </c:choose>

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
      <a class="btn btn-sm clear" href="${ctx}/student/index">
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





<script>
  $(function(){
     $(".btnSave").on("click",function(){
       $(".form").submit();
     });
    $(".clear").on("click",function () {
        $(".form")[0].reset();
    });
  });
  $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
    $(this).prev().focus();
  });
</script>
</body>
</html>
