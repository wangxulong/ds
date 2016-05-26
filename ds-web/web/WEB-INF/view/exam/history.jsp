<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/5/20
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>考试管理</title>
</head>
<body>
<div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <p>历年试卷</p>
        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label>
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th>学期</th>
                            <th>试卷标题</th>
                            <th class="hidden-480">简单描述</th>

                            <th>
                                <i class="icon-time bigger-110 hidden-480"></i>
                                截止时间
                            </th>
                          <%--  <th class="hidden-480">附件</th>--%>

                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach items="${exams}" var="exam" varStatus="s">
                        <tr>
                            <td class="center">
                                <label>
                                    <input type="checkbox" class="ace" />
                                    <span class="lbl"></span>
                                </label>
                            </td>

                            <td>
                               <span name="semester" id="semester${s.count-1}"></span>
                                <input type="hidden" id="year${s.count-1}" name="years" value="${exam.year}">
                                <input type="hidden" id="term${s.count-1}" name="terms" value="${exam.term}">
                                <input type="hidden" id="type${s.count-1}" name="types" value="${exam.examTypeId}">
                            </td>
                            <td>${exam.title}</td>
                            <td class="hidden-480">${exam.description}</td>
                            <td>${exam.endTime}</td>

                          <%--  <td class="hidden-480">
                                <span class="label label-sm label-warning" id="download"><a href="${ctx}/download/27">下载</a></span>
                            </td>
--%>
                            <td>
                                <div class="hidden-sm hidden-xs btn-group">
                                    <a class="btn btn-xs btn-success update" href="${ctx}/exam/edit?id=${exam.id}&type=${exam.examTypeId}">
                                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                                    </a>
                                    <a class="btn btn-xs btn-danger" href="${ctx}/exam/delete?id=${exam.id}&type=${exam.examTypeId}">
                                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>


                        </tbody>
                    </table>
                </div><!-- /.table-responsive -->
            </div><!-- /span -->
        </div><!-- /row -->
    </div>
</div>
<script>
   $(function(){
       var semester=document.getElementsByName("semester");
       var years=document.getElementsByName("years");
       var terms=document.getElementsByName("terms");
       var types=document.getElementsByName("types");
       var termsArray=["春季学期","秋季学期","冬季学期"];
       var typeArray=["A卷","B卷"];
       for(i=0;i<semester.length;i++){
           semester[i].value=years[i].value+termsArray[terms[i].value-1]+typeArray[types[i].value-1];
           //alert(semester[i].value);
           $("#semester"+i).html(semester[i].value);
       };
   });
  /* $(function(){
       $(".update").on("click",function(){
           $("#modal-form .modal-content").load("${ctx}/exam/update",${exams},function(){
               $("#modal-form").modal("show");
           });
       });
   });*/
</script>
</body>
</html>
