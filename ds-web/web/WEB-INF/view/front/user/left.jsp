<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="list-group">
  <a href="${ctx}/front/user/index" class="list-group-item
    <c:if test="${fn:contains(headerUri,'front/user/index')}">
       active
    </c:if>
  ">
    基本信息
  </a>
  <a href="${ctx}/front/user/account" class="list-group-item
    <c:if test="${fn:contains(headerUri,'front/user/account')}">
       active
    </c:if>
  ">账号信息</a>
</div>
</body>
</html>
