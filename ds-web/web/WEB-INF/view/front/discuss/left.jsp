<%--
  Created by IntelliJ IDEA.
  User: wxl
  Date: 2016/5/22
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="list-group">
  <a href="${ctx}/front/discuss/index" class="list-group-item
    <c:if test="${fn:contains(headerUri,'front/discuss/index')}">
      active
    </c:if>">
    我参与的研讨课
  </a>
  <a href="${ctx}/front/discuss/upload" class="list-group-item
    <c:if test="${fn:contains(headerUri,'front/discuss/upload')}">
      active
    </c:if>">
    上传研讨课作业</a>
  <a href="${ctx}/front/discuss/join" class="list-group-item
    <c:if test="${fn:contains(headerUri,'front/discuss/join')}">
      active
    </c:if>
    ">
    研讨课报名</a>
</div>
</body>
</html>
