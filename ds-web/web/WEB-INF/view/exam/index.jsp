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
                <div id="home" class="tab-pane in active">
                    <p>试卷上传</p>
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
                                                    <form:input path="title" placeholder="作业主题" class="form-control" />
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
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div>

                <div id="profile" class="tab-pane">
                    <p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid.</p>
                </div>

                <div id="dropdown1" class="tab-pane">
                    <p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade.</p>
                </div>

                <div id="dropdown2" class="tab-pane">
                    <p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin.</p>
                </div>
            </div>
        </div>
    </div><!-- /.page-content -->
    <script type="text/javascript">
        function selected(){
            var year=document.getElementById('year')
            var term=document.getElementById('term')
            var exemtype=document.getElementById('exemtype')
            if(year.value&&term.value&&exemtype.value)
                $("#form-content").removeClass('hidden')
            else
                $("#form-content").addClass('hidden')
        };
    </script>
    <script>
        $(function(){
            var mydate = new Date();
            var year=mydate.getFullYear();
            for(var i=year;i>=2010;i--) {
                $("#year").append("<option>"+i+"</option>")
            }
            $("#exemtitle").removeClass('hidden');
        });
    </script>
    <script>
        $(function(){
            $(".btnSave").on("click",function(){
                $("#formSysRole").submit();
                alert("走了")
            });
        });

        $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });
     /*   $(function(){
            var year=document.getElementById('year')

            alert(year.key)
            year.index(3)
            $("#exemtitle").removeClass('hidden');
        });*/
    </script>
</body>
</html>
