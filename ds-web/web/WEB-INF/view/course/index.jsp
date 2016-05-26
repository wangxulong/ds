<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <div class="page-header">
        <h1>
            课程组管理
        </h1>
    </div>
    <table id="sample-table-2" class="table table-striped table-bordered table-hover flag">
        <thead>
            <tr>
                <%--<th><button id="test" class="button-style">课程组介绍</button></th>--%>
                <th><button id="teacher" class="button-style">课程组老师</button></th>

            </tr>
        </thead>
    </table>
    <%--<div id="group" style="height:251px;">
        <p id="description"> ${group}
            <a  href="${ctx}/group/index">
                <i class="ace-icon fa fa-pencil bigger-120"></i>
            </a>
        </p>
    </div>--%>
    <div id="teach">
        <table id="sample-table-3" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>名字</th>
                <th>职称</th>
                <th>性别</th>
                <th>年龄</th>
                <th>状态</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${teachers}" var="teacher" varStatus="s">
                <tr>
                    <td>${teacher.name}</td>
                    <td>${teacher.level}</td>
                    <td>
                        <c:choose>
                            <c:when test="${teacher.sex eq 1}">
                                男
                            </c:when>
                            <c:otherwise>
                                女
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <input type="hidden" id="age${s.count}" name="birthDay" value="${teacher.birthDate}">
                    <td > <span id="ageValue${s.count-1}"  name="ageValue"> </span> </td>
                    <td>
                        <c:choose>
                            <c:when test="${teacher.state eq 1}">
                                教学中
                            </c:when>
                            <c:otherwise>
                                未教学
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            <c:forEach items="${levelNums}" var="levelNum">
                <c:out value="${levelNum.key}"/>
                <span style="color: #1165ff"><c:out value="${levelNum.value}"/></span>
                <span>人;</span>&nbsp;&nbsp;
            </c:forEach>
            <c:forEach items="${sexStateNums}" var="sexStateNum">
                <c:out value="${sexStateNum.key}"/>
                <span style="color: #1165ff"><c:out value="${sexStateNum.value}"/></span>
                <span>人;</span>&nbsp;&nbsp;
            </c:forEach>
            </tbody>

        </table>
    </div>

    <div class="flag-style">
        <span>课程信息</span>

        <%--<a class="btn btn-xs btn-success " href="${ctx}/course/add" >
            <i class="ace-icon fa fa-plus bigger-120 "></i>
        </a>--%>

    </div>
    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
        <thead>
        <tr>

            <th>课程名字</th>
            <th>设立时间</th>
            <th style="width:50%;" >课程简介</th>
            <th class="hidden-480">操作</th>


        </tr>
        </thead>

        <tbody>

        <c:forEach items="${Course}" var="course">
            <tr>

                <td>${course.name}</td>
                <td>${course.startTime}</td>
                <td> ${course.outline}</td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                        <a class="btn btn-xs btn-success" href="${ctx}/course/edit/${course.id}">
                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                        </a>
                      <%--  <a class="btn btn-xs btn-danger" href="${ctx}/course/delete/${course.id}">
                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                        </a>--%>
                    </div>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>

<script type="text/javascript">
//    $("#group").hide();
    //$("#teach").hide();
    $(document).ready(function(){
       /* $("#test").click(function () {
            $("#group").show();
            $("#teach").hide();
        });
        $("#teacher").click(function () {
            $("#teach").show();
            $("#group").hide();
        });*/
    });
</script>
<script type="text/javascript">


    function getAge(dateString) {
        var today = new Date();
        var birthDate = new Date(dateString);
        var age = today.getFullYear() - birthDate.getFullYear();
        var m = today.getMonth() - birthDate.getMonth();
        if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        return age;
    }
//    $("#ageValue").html(getAge($("#age").val()));
    $(function(){
        var brithDay=document.getElementsByName("birthDay");
        var ageValue = document.getElementsByName("ageValue");
        for(i=0;i<brithDay.length;i++){
            ageValue[i].value=getAge(brithDay[i].value);
            $("#ageValue"+i).html(ageValue[i].value);

        }
    });
</script>
</body>
</html>
