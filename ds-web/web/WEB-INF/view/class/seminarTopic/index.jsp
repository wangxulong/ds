<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>研讨课</title>
    <script>

        var interval = 1000;
        function ShowCountDown(year,month,day,divname)
        {

            var now = new Date();
            var endDate = new Date(year, month-1, day);
            var leftTime=endDate.getTime()-now.getTime();
            var leftsecond = parseInt(leftTime/1000);
//var day1=parseInt(leftsecond/(24*60*60*6));
            var day1=Math.floor(leftsecond/(60*60*24));
            var hour=Math.floor((leftsecond-day1*24*60*60)/3600);
            var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60);
            var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60);
            var cc = document.getElementById(divname);
            cc.innerHTML = "距开始还有："+day1+"天"+hour+"小时"+minute+"分"+second+"秒";
        }

    </script>
</head>
<body>
<div class="page-header">
    <h1>
        ${seminar.name}-问题
        <small>
            <i class="icon-double-angle-right"></i>
        </small>
    </h1>
</div>
<div style="padding:0px 10px 10px 10px;">
    <a class="btn btn-success btn-sm" href="${ctx}/class/seminarTopic/add?sid=${seminar.id}" name="add_btn">
        <i class="ace-icon fa fa-plus bigger-120 "></i>新增
    </a>
</div>
<table id="sample-table-1" class="table table-striped table-bordered table-hover">
    <thead>
    <tr>
        <th class="center">
            <label class="position-relative">
                <input type="checkbox" class="ace" />
                <span class="lbl"></span>
            </label>
        </th>
        <th>标题</th>
        <th>描述</th>
        <th>要求</th>
        <th>状态</th>
        <th>打分</th>
        <th class="hidden-480">操作</th>


    </tr>
    </thead>

    <tbody>
    <script>
        var arr = [];
    </script>
    <c:forEach items="${seminar.seminarTopics}" var="seminarTopic">
        <tr startTime="${seminarTopic.startTime}" stid="${seminarTopic.id}">
            <td class="center">
                <label class="position-relative">
                    <input type="checkbox" class="ace" />
                    <span class="lbl"></span>
                </label>
            </td>
            <td>${seminarTopic.name}</td>
            <td>${seminarTopic.desc}</td>
            <td>${seminarTopic.demand}</td>
            <td width="250px">

                <c:if test="${seminarTopic.status == 0}">
                    距开始还有：0天 0小时 0分 0秒
                    <script>
                        var id = ${seminarTopic.id};
                        arr.push(id);
                    </script>
                    <%--<span class="label label-sm label-warning" >未开始</span>--%>
                </c:if>
                <c:if test="${seminarTopic.status == 1}">
                    <span class="label label-sm label-info">开始抢答</span>
                </c:if>
                <c:if test="${seminarTopic.status == 2}">
                    <span class="label label-sm label-success">完成抢答</span>
                </c:if>
                <c:if test="${seminarTopic.status == 3}">
                    <span class="label label-sm label-danger">已结束</span>
                </c:if>
            </td>
            <td>

            </td>
            <td>

                <div class="hidden-sm hidden-xs btn-group">

                    <a class="btn btn-xs btn-info" href="javascript:;" name="update_btn">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                    </a>
                    <a class="btn btn-xs btn-danger" href="javascript:;" name="delete_btn">
                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    </a>

                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<script>

    $(function(){
        $('a[name="delete_btn"]').each(function(){
            $(this).unbind('click');
            $(this).bind('click',function(){
                if(window.confirm("确定要删除吗？")){
                    var stid = $(this).parents("tr").attr("stid");
                    var sid = ${seminar.id};
                    document.location.href="${ctx}/class/seminarTopic/delete?sid="+sid+"&stid="+stid;
                }
            })
        })

        $('a[name="update_btn"]').each(function(){
            $(this).unbind('click');
            $(this).bind('click',function(){
                var stid = $(this).parents("tr").attr("stid");
                var sid = ${seminar.id};
                document.location.href="${ctx}/class/seminarTopic/update?sid="+sid+"&stid="+stid;

            })
        })
        window.setInterval(function(){

            for(var i=0;i<arr.length;i++){
                var time;
                var trobj;
                $("tr").each(function(){

                    if($(this).attr("stid")==arr[i]){
                        time = $(this).attr('startTime');
                        trobj = $(this);
                    }
                })
                var year = time.substr(0,4);
                var month = time.substr(5,2);
                var day = time.substr(8,2);
                var now = new Date();
                var endDate = new Date(year, month-1, day);
                var leftTime=endDate.getTime()-now.getTime();
                var leftsecond = parseInt(leftTime/1000);
//var day1=parseInt(leftsecond/(24*60*60*6));
                var day1=Math.floor(leftsecond/(60*60*24));
                var hour=Math.floor((leftsecond-day1*24*60*60)/3600);
                var minute=Math.floor((leftsecond-day1*24*60*60-hour*3600)/60);
                var second=Math.floor(leftsecond-day1*24*60*60-hour*3600-minute*60);
                var cc = trobj.find("td").eq(4);
                cc.html("距开始还有："+day1+"天"+hour+"小时"+minute+"分"+second+"秒");
            }
        }, interval);

    })

</script>
</body>
</html>
