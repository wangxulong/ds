<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/static/front/css/bootstrap.min.css" />
<!-- Bootstrap -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="${ctx}/static/front/js/jquery.min.js"></script>
<script src="${ctx}/static/front/js/bootstrap.min.js"></script>

<script src="${ctx}/static/front/js/libs/file-input/js/fileinput.min.js"></script>
<script src="${ctx}/static/front/js/libs/file-input/js/fileinput_locale_zh.js"></script>
<link href="${ctx}/static/front/js/libs/file-input/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

<%--validator--%>
<link rel="stylesheet" href="${ctx}/static/js/bootstrapvalidator/dist/css/bootstrapValidator.css"/>
<script type="text/javascript" src="${ctx}/static/js/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${ctx}/static/js/bootstrapvalidator/dist/js/language/zh_CN.js"></script>
<%--date--%>
<link href="${ctx}/static/js/datetimepicker/css/bootstrap-datetimepicker.min.css" media="all" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/static/js/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx}/static/js/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>


<html>
<head>
    <title></title>
  <style>
    .file-drop-zone{
      height: auto !important;
    }
  </style>
</head>
<body>
<!--导航-->
<nav class="navbar navbar-default   header" >
  <div class="container">
    <!--小屏幕导航按钮和Logo-->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-content"
              >
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="${ctx}/front/index" class="navbar-brand">DS课程平台</a>
    </div>

    <!--小屏幕导航按钮和Logo-->

    <!--导航-->
    <div class="collapse navbar-collapse" id="nav-content">
      <ul class="nav navbar-nav navbar-left">
        <li <c:if test="${fn:contains(headerUri,'/front/user/')}">class="active" </c:if> ><a href="${ctx}/front/user/index" ><span class="glyphicon glyphicon-user"></span> 个人信息 </a></li>
        <li <c:if test="${fn:contains(headerUri,'/front/homework/')}">class="active" </c:if>><a href="${ctx}/front/homework/index" ><span class="glyphicon glyphicon-tasks"></span> 作业&资料</a></li>
        <li <c:if test="${fn:contains(headerUri,'/front/discuss/')}">class="active" </c:if> ><a href="${ctx}/front/discuss/index" ><span class="glyphicon glyphicon-comment"></span> 研讨课</a></li>
        <li <c:if test="${fn:contains(headerUri,'/front/leave/')}">class="active" </c:if> ><a href="${ctx}/front/leave/index" ><span class="glyphicon glyphicon-tags "></span> 请假</a></li>
        <li <c:if test="${fn:contains(headerUri,'/front/exam/')}">class="active" </c:if>><a href="${ctx}/front/exam/index"><span class="glyphicon glyphicon-bookmark"></span> 成绩</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a id="dLabel" data-target="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
            ${sessionScope.loginStudent.name}
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu" aria-labelledby="dLabel">
            <li ><a href="${ctx}/front/logout"><span class="glyphicon glyphicon-off text-danger" ></span>  退出</a></li>
            <li ><a href="${ctx}/front/index"><span class="glyphicon glyphicon-home text-danger" ></span>  首页面</a></li>
          </ul>
        </li>

      </ul>
    </div>
  </div>
</nav>
</body>
</html>
