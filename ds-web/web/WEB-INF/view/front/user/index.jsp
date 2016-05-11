<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>基本信息</title>
</head>
<body>
  <%@include file="/include/frontCenterHeader.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <%@include file="left.jsp"%>
      </div>
      <div class="col-md-10">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">
              基本信息
            </h3>
          </div>
          <div class="panel-body">
            <div class="row">
              <div class="col-md-12">
                <form class="form-horizontal">
                  <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">姓名</label>
                    <div class="col-sm-10">
                      <input type="text" readonly class="form-control form-control-static" id="name" value="${student.name}">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="stuNo" class="col-sm-2 control-label">学号</label>
                    <div class="col-sm-10">
                      <input type="text" class="form-control" id="stuNo" value="${student.studentNumber}">
                    </div>
                  </div>

                </form>
              </div>
            </div>
          </div>

        </div>

      </div>
    </div>
  </div>
</body>
</html>
