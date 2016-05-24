<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>研讨课</title>
    <script>
        var interval = 1000;
        $(function(){

            $('#sub_btn').unbind('click');
            $('#sub_btn').bind('click',function(){
                var stid = $("#inner_thead").attr("stid");


                var type=$('input:radio[name="scoretype"]:checked').val();


                if(type==1){
                    $('input[name="score"]').each(function(){
                        var score = $(this).val();
                        var studentId = $(this).parents("tr").attr("studentId");
                        $.ajax({
                            url:'${ctx}/class/seminarTopic/score',
                            type:'post',
                            data:{
                                score:score,
                                studentId:studentId,
                                topicId:stid,
                                type:1
                            },
                            success:function(msg){

                            },
                            error:function(msg){
                                alert("服务器访问错误!");
                            }
                        })
                    })

                }else {

                    $('select[name="level"]').each(function () {

                        var level = $(this).find("option:selected").text();
                        var studentId = $(this).parents("tr").attr("studentId");

                        $.ajax({
                            url:'${ctx}/class/seminarTopic/score',
                            type:'post',
                            data:{
                                level:level,
                                studentId:studentId,
                                topicId:stid,
                                type:2
                            },
                            success:function(msg){

                            },
                            error:function(msg){
                                alert("服务器访问错误!");
                            }
                        })
                    })
                }
                $("#myModal").hide();



                window.setInterval(function(){location.reload();},300);

            });

            $('a[name="score_btn"]').unbind('click');
            $('a[name="score_btn"]').bind('click',function(){

                $("#studentList").empty();
                var stid = $(this).parents("tr").attr("stid");
                $("#inner_thead").attr("stid",stid);
                $.ajax({
                    url:'${ctx}/class/seminarTopic/students',
                    type:'post',
                    dataType:'json',
                    data:{
                        'stid':stid
                    },
                    success:function(msg){
                        if(msg!=0){
                            var trs = "";
                            for(var i=0;i<msg.length;i++){
                                trs+='<tr studentId="'+msg[i].id+'">'+
                                        '<td >'+msg[i].name+'</td>'+
                                        '<td >'+msg[i].studentNumber+'</td>'+
                                        '<td><input type="text" class="form-control" name="score"/></td>'+
                                        '<td ><select name="level" class="form-control">'+
                                        '<option value="1">A+</option><option>A</option><option>A-</option> <option>B+</option> <option>B</option> <option>B-</option> <option>C+</option> <option>C</option> <option>C-</option> <option>D+</option> <option>D</option> <option>D-</option> <option>E</option>'+
                                        '</select></td></tr>';

                            }
                            $("#studentList").html(trs);
                        }
                    },
                    error:function(msg){
                        alert("服务器出错！");
                    }
                })

                $('#myModal').modal('show');
            });

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
                    var cc = trobj.find("td").eq(5);
                    cc.html("距开始还有："+day1+"天"+hour+"小时"+minute+"分"+second+"秒");
                }
            }, interval);

        })

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
        <th>人数</th>
        <th>状态</th>
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
            <td>${seminarTopic.pnum}</td>
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
                    <span class="label label-sm label-pink">完成抢答，等待提交</span>
                </c:if>
                <c:if test="${seminarTopic.status == 3}">
                    <span class="label label-sm label-success">已提交，等待给分</span>
                </c:if>
                <c:if test="${seminarTopic.status == 4}">
                    <span class="label label-sm label-danger">已结束</span>
                </c:if>
            </td>

            <td>

                <div class="hidden-sm hidden-xs btn-group">

                    <a class="btn btn-xs btn-info" href="javascript:;" name="update_btn">
                        <i class="ace-icon fa fa-pencil bigger-120"></i>
                    </a>
                    <a class="btn btn-xs btn-danger" href="javascript:;" name="delete_btn">
                        <i class="ace-icon fa fa-trash-o bigger-120"></i>
                    </a>
                    <c:if test="${seminarTopic.status == 3}">
                        <a class="btn btn-xs btn-warning" href="javascript:;" name="score_btn">
                            <i class="ace-icon fa fa-bell bigger-120"></i>打分
                        </a>
                    </c:if>


                </div>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" >
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="blue bigger">打分</h4>
            </div>
            <div style="margin: 10px 10px 10px 30px;">
                <input type="radio" name="scoretype" value="1" checked/>按分数
                <input type="radio" name="scoretype" value="2"/>按等级
            </div>
            <table border="1px solid #000" style="margin:0 auto;margin-top:10px;margin-bottom:10px;width:90%;" class="table table-striped table-bordered table-hover"><tbody>
                <thead>
                    <tr id="inner_thead" stid="">
                        <th>姓名</th>
                        <th>学号</th>
                        <th width="100px">打分</th>
                        <th width="100px">等级</th>
                    </tr>
                </thead>
                <tbody id="studentList">
               <%-- <tr studentId="">
                    <td >标题</td>
                    <td >123123</td>
                    <td ><input type="text" class="form-control"/></td>
                    <td><select id="level" name="level" class="form-control">
                        <option value="1">A+</option>
                        <option>A</option>
                        <option>A-</option>
                        <option>B+</option>
                        <option>B</option>
                        <option>B-</option>
                        <option>C+</option>
                        <option>C</option>
                        <option>C-</option>
                        <option>D+</option>
                        <option>D</option>
                        <option>D-</option>
                        <option>E</option>
                    </select></td>
                </tr>--%>
                </tbody>

            </table>


            <div class="modal-footer">
                <a class="btn btn-sm clear" onclick="$('#myModal').modal('hide');">
                    <i class="ace-icon fa fa-times"></i>
                    取消
                </a>
                <a class="btn btn-sm btn-success btnSave" href="javascript:;" id="sub_btn" nid="">
                    <i class="ace-icon fa fa-check"></i>
                    提交
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
