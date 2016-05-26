<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>修改密码</title>
</head>
<body>

<div class="page-header">
    <h1>
        修改密码
        <small>
            <i class="icon-double-angle-right"></i>
        </small>
    </h1>
</div><!-- /.page-header -->
<div class="row">
    <div class="col-md-12">
        <form class="form-horizontal form" role="form" method="post" action="${ctx}/admin/password">
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> 原密码 </label>

                <div class="col-sm-9">
                    <div class="col-sm-9">
                        <input name="password" type="password" placeholder="原始密码" class="form-control" />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> 新密码 </label>

                <div class="col-sm-9">
                    <div class="col-sm-9">
                        <input name="newPassword"  type="password" placeholder="新密码" class="form-control" />
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> 确认密码 </label>

                <div class="col-sm-9">
                    <div class="col-sm-9">
                        <input name="confirmPassword" type="password" placeholder="确认密码" class="form-control" />
                    </div>
                </div>
            </div>
            <div class="clearfix form-actions text-center">

                <a class="btn btn-sm clear" href="${ctx}/admin/index">
                    <i class="ace-icon fa fa-times"></i>
                    取消
                </a>

                <button type="submit" class="btn btn-sm btn-primary btnSave">
                    <i class="ace-icon fa fa-check"></i>
                    保存
                </button>
            </div>

        </form>

    </div>
</div>
<script>
    $(function(){
        $('.form').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                password:{
                    validators: {
                        notEmpty: {
                        }
                    }
                },
                newPassword: {
                    validators: {
                        notEmpty: {
                        },
                        identical: {
                            field: 'confirmPassword'
                        }/*,
                         different: {
                         field: 'password'
                         }*/
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                        },
                        identical: {
                            field: 'newPassword'
                        },

                    }
                }
            }
        });
    });

</script>
</body>
</html>
