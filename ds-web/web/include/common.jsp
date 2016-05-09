<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />


<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/bootstrap.css" />
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/font-awesome.css" />

<!-- page specific plugin styles -->
<!--[if IE 7]>
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/font-awesome-ie7.css" />
<![endif]-->
<!-- text fonts -->
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/ace-fonts.css" />

<!-- ace styles -->
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/ace.css" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/ace-part2.css" class="ace-main-stylesheet" />
<![endif]-->

<!--[if lte IE 9]>
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/ace-ie.css" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="${ctx}/static/js/ace/assets/js/ace-extra.js"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="${ctx}/static/js/ace/assets/js/html5shiv.js"></script>
<script src="${ctx}/static/js/ace/assets/js/respond.js"></script>
<![endif]-->

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='${ctx}/static/js/ace/assets/js/jquery.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
window.jQuery || document.write("<script src='${ctx}/static/js/ace/assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='${ctx}/static/js/ace/assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>

<script src="${ctx}/static/js/ace/assets/js/bootstrap.js"></script>
<script src="${ctx}/static/js/ace/assets/js/typeahead.jquery.js"></script>
<!-- ace scripts -->

<script src="${ctx}/static/js/ace/assets/js/ace-elements.js"></script>
<script src="${ctx}/static/js/ace/assets/js/ace.js"></script>

<!--addRole-->
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/bootstrap-duallistbox.css" />

<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/chosen.css" />
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/daterangepicker.css" />
<link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/colorpicker.css" />

<script src="${ctx}/static/js/ace/assets/js/fuelux/fuelux.spinner.js"></script>
<script src="${ctx}/static/js/ace/assets/js/date-time/bootstrap-datepicker.js"></script>
<script src="${ctx}/static/js/ace/assets/js/date-time/bootstrap-timepicker.js"></script>
<script src="${ctx}/static/js/ace/assets/js/date-time/moment.js"></script>
<script src="${ctx}/static/js/ace/assets/js/date-time/daterangepicker.js"></script>
<script src="${ctx}/static/js/ace/assets/js/bootstrap-colorpicker.js"></script>
<script src="${ctx}/static/js/ace/assets/js/jquery.knob.js"></script>
<script src="${ctx}/static/js/ace/assets/js/jquery.autosize.js"></script>
<script src="${ctx}/static/js/ace/assets/js/jquery.inputlimiter.1.3.1.js"></script>
<script src="${ctx}/static/js/ace/assets/js/jquery.maskedinput.js"></script>
<script src="${ctx}/static/js/ace/assets/js/bootstrap-tag.js"></script>