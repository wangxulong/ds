<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>基本信息</title>
</head>
<body>
  <%@include file="/include/frontCenterHeader.jsp"%>

  <div class="container">
      <div class="row">
          <div class="col-md-12">

              <div class="panel panel-default">
                  <div class="panel-heading">
                      <h3 class="panel-title">
                          综合成绩
                      </h3>
                  </div>
                  <div class="panel-body">
                      <div class="alert alert-success " role="alert">
                          <h2 class="text-center">
                              <c:choose>
                                  <c:when test="${empty score}">
                                      暂无成绩
                                  </c:when>
                                  <c:otherwise>
                                      考试成绩：${score}
                                  </c:otherwise>
                              </c:choose>
                          </h2>
                      </div>
                  </div>

              </div>

          </div>
      </div>
  </div>
</body>
</html>
