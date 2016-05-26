<%--
  Created by IntelliJ IDEA.
  User: liu
  Date: 2016/5/26
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>提交成绩</title>
</head>
<body>
<table id="sample-table-1" class="table table-striped table-bordered table-hover">
    <thead>
    <div class="row">
        <div class="form-group col-md-2">
            <p >平时成绩比重</p>
        </div>
        <div class="form-group col-md-2">
            <p>考试成绩比重</p>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-2">
            <select id="usualPercent" >
                <option value="0">0</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
            </select>
        </div>
        <div class="form-group col-md-2">
            <p id="examPercent"></p>
        </div>
        <div class="form-group col-md-2">
           <button onclick="percent()">统计</button>
        </div>
    </div>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>学号</th>
        <th>姓名</th>
        <th>平时成绩</th>
        <th>考试成绩</th>
        <th>总成绩</th>


    </tr>
    </thead>

    <tbody>

    <c:forEach items="${allStuScore}" var="stu" varStatus="status">
        <tr sid="${stu.studentId}" cid="${stu.courseId}">
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>${stu.studentNumber}</td>
            <td> ${stu.name}</td>
            <td>
                <input class="hidden-480" id="usualScore" name="usualScore" value="${stu.usualScore}" disabled="true">
            </td>
            <td><input class="hidden-480" id="examScore" name="examScore" value="${stu.examScore}"></td>
            <td><input class="hidden-480" id="score" name="score" value="${stu.score}" disabled="true"></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal-footer">
    <a class="btn btn-sm clear" href="#">
        <i class="ace-icon fa fa-times"></i>
        返回
    </a>
    <button class="btn btn-sm btn-primary btnSave" id="submit">
        <i class="ace-icon fa fa-check"></i>
        提交
    </button>
</div>
<script>
    function percent(){
        var usualPercent=document.getElementById("usualPercent");
        var examPercent=document.getElementById("examPercent");
        //alert("first"+homeworkPercent.value);获取homePercent初始值出错
        examPercent.value=10-usualPercent.value;
        $("#examPercent").html(examPercent.value);
        $("tr").each(function(){
            if($(this).attr("sid")!=null){
                var usualScore = $(this).find("td").eq(3).find("input").val();
                var examScore = $(this).find("td").eq(4).find("input").val();
                var finalScore = usualScore*usualPercent.value/10+examScore*(10-usualPercent.value)/10;
                $(this).find("td").eq(5).find("input").val(finalScore);
            }
        });
    };
    function getAllScores(){
        var scoreList = new Array();
        $("tr").each(function(){
            if($(this).attr("sid")!=null) {
                var stuId=$(this).attr("sid");
                var courseId=$(this).attr("cid");
                var usualScore=$(this).find("td").eq(3).find("input").val();
                var examScore = $(this).find("td").eq(4).find("input").val();
                var finalScore = $(this).find("td").eq(5).find("input").val();
                result = {stuId: stuId, courseId: courseId,usualScore:usualScore,examScore:examScore,finalScore:finalScore};
                scoreList.push(result);
            }
        });
        return JSON.stringify(scoreList);
    };
    $("#submit").click(function(){
        var data = getAllScores();
        var url ="${ctx}/score/saveScore";
        $.post(url,{jsonData:data},function(result){
            if(result){
                alert("提交成功！");
                //window.location.href = "${ctx}/task/index";
            }
        });
    });
</script>
</body>
</html>
