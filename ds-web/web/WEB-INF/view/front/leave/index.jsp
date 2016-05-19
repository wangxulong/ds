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
                          我的请假
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
                                  时间
                              </th>
                              <th>
                                  内容
                              </th>

                              <th>
                                  状态
                              </th>

                          </tr>
                          </thead>
                          <tbody>
                          <tr  class="success">
                              <td>
                                  1
                              </td>
                              <td>
                                  2016-04-12
                              </td>
                              <td>
                                  肚子疼
                              </td>


                              <td>已提交</td>

                          </tr>
                          <tr >
                              <td>
                                  2
                              </td>
                              <td>
                                  2016-03-12
                              </td>
                              <td>
                                  牙疼
                              </td>


                              <td>已批阅</td>

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
