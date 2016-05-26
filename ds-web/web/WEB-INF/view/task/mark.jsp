<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>


<div>
    <!--批阅作业-->
    <div class="flag-style">
        <span>批阅作业</span>
        <span style="margin-left: 20px;font-size: 12px;">当前正在批阅的作业批次：</span><span style="color: blue;font-size: 12px;">${nowTask}</span>
    </div>

        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>学生学号</th>
                <th>学生姓名</th>
                <th>提交时间</th>
                <th>作业成绩</th>
                <th class="hidden-480">批阅</th>
            </tr>
            </thead>

            <tbody>

            <c:forEach items="${homeworkList}" var="hl" varStatus="ss">
                <tr>
                    <td>${hl.studentCard}</td>
                    <td>${hl.studentName}</td>
                    <td>${hl.finishTime}</td>
                    <c:choose>

                        <c:when test="${not empty hl.homeworkScore}">
                            <td>${hl.homeworkScore}</td>
                        </c:when>
                        <c:otherwise>
                            <td>0</td>
                        </c:otherwise>
                    </c:choose>

                    <td class="hidden-480">
                        <div class="hidden-sm hidden-xs btn-group">
                            <%--<input id="homework${ss.count}" name="homeworkNum"type="hidden" value="${hl.homeworkId}">--%>
                            <input class="input-sm homeworkScore" type="text" data="${hl.homeworkId}" id="markValue${ss.count}"/>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    <div class="modal-footer">
        <a class="btn btn-sm clear" href="${ctx}/task/index">
            <i class="ace-icon fa fa-times"></i>
            返回
        </a>
        <button class="btn btn-sm btn-primary btnSave" id="submit">
            <i class="ace-icon fa fa-check"></i>
            提交
        </button>
    </div>

</div>
<script>
    function getScore(){
        var scoreList = new Array();
        $(".homeworkScore").each(function(){
            var homeworkId = $(this).attr("data");
            var homeworkScore = $(this).val() || "0";
            var result = {id:homeworkId,value:homeworkScore};
            scoreList.push(result);
        });
         return JSON.stringify(scoreList);
    }



    $("#submit").click(function(){

       var data = getScore();
        /*var brithDay=document.getElementsByName("homeworkNum");
        var saveDataAry=[];
        for(var i=0;i<brithDay.length;i++){
            var tempData = {"id":$("#homework"+(i+1)).val(),"value":$("#markValue"+(i+1)).val()};
            saveDataAry.push(tempData);
        }

        var stringtest =JSON.stringify(saveDataAry);*/
        var url ="${ctx}/task/saveScore";
        $.post(url,{stringtest:data},function(result){
            if(result){
                alert("提交成功！");
                window.location.href = "${ctx}/task/index";
            }
        });
       /* $.ajax({
            url:url,
            type:"POST",
            dataType:"json",
            contentType:"application/json",
            data:stringtest,
            success:function(msg){
                alert("提交成功！")
            },
            error:function(msg){
                if(msg.status==200||msg.status==4){
                    alert("提交成功！");
                }
            }
        });*/
    });

</script>

</body>
</html>