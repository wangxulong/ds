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
              作业信息
            </h3>
          </div>
          <div class="panel-body">
            <table class="table table-bordered">
              <thead>
              <tr>
                <th>
                  #
                </th>
                <th>
                  作业名称
                </th>
                <th>
                  时间
                </th>
                <th>
                  作业状态
                </th>
                <th>
                  操作
                </th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <td>
                  1
                </td>
                <td>
                  链表作业
                </td>
                <td>
                  2016-04-12
                </td>
                <td>
                  已提交
                </td>
                <td>
                  <a class="btn btn-sm btn-primary">下载</a>
                </td>
              </tr>
              <tr class="success">
                <td>
                  2
                </td>
                <td>
                  图操作作业
                </td>
                <td>
                  2016-08-12
                </td>
                <td>
                  已评阅
                </td>
                <td>
                  <a class="btn btn-sm btn-primary">下载</a>
                </td>
              </tr>
              </tbody>
            </table>
            <ul class="pagination">
              <li>
                <a href="#">上一页</a>
              </li>
              <li>
                <a href="#">1</a>
              </li>
              <li>
                <a href="#">2</a>
              </li>
              <li>
                <a href="#">3</a>
              </li>
              <li>
                <a href="#">4</a>
              </li>
              <li>
                <a href="#">5</a>
              </li>
              <li>
                <a href="#">下一页</a>
              </li>
            </ul>
          </div>

        </div>

      </div>
    </div>
  </div>
</body>
</html>
