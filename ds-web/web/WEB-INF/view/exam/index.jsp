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

                                请选择要上传的学期和试卷
                                <button class="close" data-dismiss="alert">
                                    <i class="icon-remove"></i>
                                </button>
                            </div>
                            <form role="form">
                                <div class="row" id="yearlist">
                                    <div class="form-group col-md-4">
                                        <select class="form-control" id="year">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <select class="form-control">
                                            <option>春季学期</option>
                                            <option>秋季学期</option>
                                            <option>冬季学期</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <select class="form-control">
                                            <option>A卷</option>
                                            <option>B卷</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="input-group hidden">
                                    <input type="text" class="form-control" placeholder="试卷的标题">
                                </div>
                                <br/>
                                <div class="fallback">
                                    <input name="filename" type="file" />
                                    <input type="hidden" name="theFilePath" value="">
                                </div>
                                <br/>
                                <div >
                                    <input   type="submit" value="提交"/>
                                </div>
                            </form>
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
    <script>
        $(function(){
            var mydate = new Date();
            var year=mydate.getFullYear();
            for(var i=year;i>=2010;i--) {
                $("#year").append("<option>"+i+"</option>")
            }
        });
    </script>
</body>
</html>
