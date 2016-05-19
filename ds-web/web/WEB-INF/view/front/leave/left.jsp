<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="list-group">
    <a href="${ctx}/front/leave/index" class="list-group-item
  <c:if test="${fn:contains(headerUri,'front/leave/index')}">
       active
    </c:if>
    ">
        我的请假
    </a>
    <a href="${ctx}/front/leave/submit" class="list-group-item
  <c:if test="${fn:contains(headerUri,'front/leave/submit')}">
       active
    </c:if>
    ">
        我要请假
    </a>

</div>
</body>
</html>
