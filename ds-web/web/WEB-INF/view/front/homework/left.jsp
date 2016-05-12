
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="list-group">
  <a href="${ctx}/front/homework/index" class="list-group-item
  <c:if test="${fn:contains(headerUri,'front/homework')}">
       active
    </c:if>
    ">
    作业信息
  </a>
  <%--<a href="${ctx}/front/homework/upload" class="list-group-item
     <c:if test="${fn:contains(headerUri,'front/homework/upload')}">
       active
    </c:if>
  ">上传作业</a>--%>
</div>
</body>
</html>
