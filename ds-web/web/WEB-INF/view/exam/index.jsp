<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
    <div class="page-content">
        <div class="page-header">
            <h1>
                考试管理
                <small>
                    <i class="icon-double-angle-right"></i>
                    请注意标题右上角的提示
                </small>
            </h1>
        </div><!-- /.page-header -->
        <!--主体部分-->
        <div class="tabbable">
            <ul class="nav nav-tabs" id="myTab">
                <li class="active">
                    <a data-toggle="tab" href="#home">
                        <i class="green icon-home bigger-110"></i>
                        上传试卷
                        <span class="badge badge-danger">2</span>
                    </a>
                </li>

                <li>
                    <a data-toggle="tab" href="#profile">
                        成绩提交
                        <span class="badge badge-danger">99+</span>
                    </a>
                </li>

                <li class="dropdown">
                    <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                       计算与统计 &nbsp;
                        <i class="icon-caret-down bigger-110 width-auto"></i>
                    </a>

                    <ul class="dropdown-menu dropdown-info">
                        <li>
                            <a data-toggle="tab" href="#dropdown1">百分制</a>
                        </li>

                        <li>
                            <a data-toggle="tab" href="#dropdown2">等级制</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <div class="tab-content">
                <!--上传试卷的tab-->
                <div id="home" class="tab-pane in active">
                    <p><a href="${ctx}/exam/history">查看历史</a></p>
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->

                            <div class="alert alert-info">
                                <i class="icon-hand-right"></i>

                                请先选择要上传的学期和试卷
                                <button class="close" data-dismiss="alert">
                                    <i class="icon-remove"></i>
                                </button>
                            </div>
                            <form:form class="form-horizontal" role="form" id="formSysRole" action="${ctx}/exam/upload" enctype="multipart/form-data">
                                <div class="row" id="yearlist">
                                    <div class="form-group col-md-4">
                                        <form:select path="year" class="form-control" id="year" onchange="selected()">
                                            <form:option value=""></form:option>
                                        </form:select>

                                    </div>
                                    <div class="form-group col-md-4">
                                        <form:select path="term" class="form-control" id="term"  onchange="selected()">
                                            <form:option value=""></form:option>
                                            <form:option value="1">春季学期</form:option>
                                            <form:option value="2">秋季学期</form:option>
                                            <form:option value="3">冬季学期</form:option>
                                        </form:select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <form:select path="examTypeId" class="form-control" id="exemtype" onchange="selected()">
                                            <form:option value=""></form:option>
                                            <form:option value="1">A卷</form:option>
                                            <form:option value="2">B卷</form:option>
                                        </form:select>
                                    </div>
                                </div>
                                <!--隐藏的提交组件-->
                                <div class="hidden center" id="form-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="blue bigger">发布考试试卷</h4>
                                    </div>

                                        <!-- #section:elements.form -->
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> 试卷标题 </label>

                                            <div class="col-sm-9">
                                                <div class="col-sm-9">
                                                    <form:input path="title" placeholder="试卷主题" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> 开始时间 </label>

                                            <div class="col-sm-9">
                                                <div class="col-sm-12">
                                                    <div class="row">
                                                        <div class="col-sm-9">

                                                            <div class="input-group"  >
                                                                <form:input path="startTime" readonly="true" class="form-control date-picker"  type="text" data-date-format="yyyy-mm-dd"
                                                                            data-date-language="zh-CN"
                                                                />
                                                                <span class="input-group-addon">
                                                                  <i class="fa fa-calendar bigger-110"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> 结束时间 </label>

                                            <div class="col-sm-9">
                                                <div class="col-sm-12">
                                                    <div class="row">
                                                        <div class="col-sm-9">

                                                            <div class="input-group"  >
                                                                <form:input path="endTime" readonly="true" class="form-control date-picker"  type="text" data-date-format="yyyy-mm-dd"
                                                                            data-date-language="zh-CN"
                                                                />
                                                                <span class="input-group-addon">
                                                                  <i class="fa fa-calendar bigger-110"></i>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"> 简单描述 </label>

                                            <div class="col-sm-9">
                                                <div class="col-sm-9">
                                                    <form:textarea path="description" cols="3" placeholder="简单描述" class="form-control" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label no-padding-right"  > 上传附件 </label>

                                            <div class="col-sm-9">
                                                <div class="col-sm-9">
                                                    <form:input path="pic" type="file"    class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                    </form:form>
                                    <hr/>
                                    <button class="btn btn-sm" data-dismiss="modal">
                                        <i class="ace-icon fa fa-times"></i>
                                        取消
                                    </button>

                                    <button class="btn btn-sm btn-primary btnSave">
                                        <i class="ace-icon fa fa-check"></i>
                                        保存
                                    </button>
                                </div>
                                <!--已经提交的组件-->
                                <div class="center hidden" id="submited">
                                    <label class="control-label no-padding-right" onclick="call()"> 文件名 </label>
                                    <a class="btn btn-xs btn-success " href="#" >
                                        下载
                                    </a>
                                </div>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div>
                <!--成绩提交的tab-->
                <div id="profile" class="tab-pane">
                    <p>成绩提交界面</p>
                    <div>
                        <div class="flag-style">
                            <span>成绩提交</span>

                        <%--    <a class="btn btn-xs btn-success " href="${ctx}/task/add" >
                                <i class="ace-icon fa fa-plus bigger-120 "></i>
                            </a>--%>

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
                                <th>学号</th>
                                <th>姓名</th>
                                <th>平时成绩</th>
                                <th>考试成绩</th>
                                <th class="hidden-480">操作</th>


                            </tr>
                            </thead>

                            <tbody>

                            <c:forEach items="${allStu}" var="stu">
                                <tr>
                                    <td class="center">
                                        <label class="position-relative">
                                            <input type="checkbox" class="ace" />
                                            <span class="lbl"></span>
                                        </label>
                                    </td>
                                    <td>${stu.studentNumber}</td>
                                    <td> ${stu.name}</td>
                                    <td>${stu.sex}</td>
                                    <td> ${stu.age}</td>
                                    <td class="hidden-480">
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <a class="btn btn-xs btn-success" href="#">
                                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                                            </a>
                                            <a class="btn btn-xs btn-danger" href="#">
                                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--计算统计的tab-->
                <div id="dropdown1" class="tab-pane">
                    <p>学生姓名  成绩</p><br/>
                    <p>wxl                  100</p><br/>
                </div>

                <div id="dropdown2" class="tab-pane">
                    <p>学生姓名  等级</p><br/>
                    <p>wxl        A++</p><br/>
                </div>
            </div>
        </div>
    </div><!-- /.page-content -->
    <script type="text/javascript">
        function entity(year,term,type){
            this.year=year;
            this.term=term;
            this.type=type;
        };
        function selected(){
            var year=document.getElementById('year')
            var term=document.getElementById('term')
            var exemtype=document.getElementById('exemtype')
            if(year.value&&term.value&&exemtype.value) {
                var JSONString =JSON.stringify(new entity(year.value,term.value,exemtype.value));
                //alert(JSONString);
                $.get("${ctx}/exam/search","jsonString="+JSONString,function(data){
                    //alert("bofore"+data+data=="success");
                   if(data=="success") {
                       alert("该学期的试卷已上传过,可以在历史记录中查询");
                       //$("#submited").removeClass('hidden');
                       $("#form-content").addClass('hidden')
                   }else{
                       alert("请上传试卷");
                       $("#form-content").removeClass('hidden');
                       //$("#submited").addClass('hidden');
                   }
                });
            }
            else {
                $("#form-content").addClass('hidden');
                //$("#submited").addClass('hidden');
            }
        };
        $(function(){
            var mydate = new Date();
            var year=mydate.getFullYear();
            for(var i=year;i>=2010;i--) {
                $("#year").append("<option>"+i+"</option>")
            }
        });
        $(function(){
            $(".btnSave").on("click",function(){
                $("#formSysRole").submit();
                alert("试卷提交成功")
            });
        });
        $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
    </script>
    <script>
        function call(year,term,type){
            alert("before1");
            $.get("${ctx}/exam/search?year="+year,function(data){
                    alert(data);
            });
        };
    </script>
</body>
</html>
