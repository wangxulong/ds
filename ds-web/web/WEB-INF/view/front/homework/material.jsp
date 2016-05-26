<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        课程资料
                    </h3>
                </div>
                <div class="panel-body">

                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <c:forEach items="${materials}" var="material" varStatus="s">
                            <c:if test="${material.pid eq 0}">
                                <div class="panel panel-default">
                                    <div class="panel-heading" role="tab" id="heading${s.count}">
                                        <h4 class="panel-title">
                                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${s.count}" aria-expanded="true" aria-controls="collapseOne">
                                                ${material.name}
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapse${s.count}" class="panel-collapse collapse " role="tabpanel" aria-labelledby="heading${s.count}">
                                        <div class="panel-body">
                                            <table class="table table-condensed">
                                                <thead>
                                                    <tr>
                                                        <th>名称</th>
                                                        <th>描述</th>
                                                        <th>附件</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                     <c:forEach items="${materials}" var="child" varStatus="sChild">
                                                         <c:if test="${child.pid eq material.id}">
                                                             <tr>
                                                                 <td>${child.name}</td>
                                                                 <td>${child.desc}</td>
                                                                 <td>
                                                                     <a href="${child.path}" class="btn btn-primary btn-sm">下载</a>
                                                                 </td>
                                                             </tr>
                                                         </c:if>

                                                     </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </c:if>

                        </c:forEach>

                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
</html>
