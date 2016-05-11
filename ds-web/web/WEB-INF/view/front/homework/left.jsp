<%--
  Created by IntelliJ IDEA.
  User: wxl
  Date: 2016/5/11
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="list-group">
  <a href="${ctx}/front/homework/index" class="list-group-item
  <c:if test="${fn:contains(headerUri,'front/homework/index')}">
       active
    </c:if>
    ">
    我的作业
  </a>
  <a href="${ctx}/front/homework/upload" class="list-group-item
     <c:if test="${fn:contains(headerUri,'front/homework/upload')}">
       active
    </c:if>
  ">上传作业</a>
</div>
</body>
</html>
