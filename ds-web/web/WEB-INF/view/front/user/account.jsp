<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>账号信息</title>
</head>
<body>
  <%@include file="/include/frontCenterHeader.jsp"%>
  <div class="container">
    <div class="row">
      <div class="col-md-2">
        <%@include file="left.jsp"%>
      </div>
      <div class="col-md-10">

        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">
              修改登录账号
            </h3>
          </div>

          <div class="panel-body">
            <c:if test="${not empty resultMessage}">
              <div class="alert
             <c:choose>
                <c:when test="${resultMessage.status eq 'success'}">
                  alert-success
                </c:when>
                 <c:otherwise>
                 alert-danger
                </c:otherwise>
            </c:choose>
             alert-dismissible text-center" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <strong>${resultMessage.message}</strong>
              </div>
            </c:if>
            <div class="row">
              <div class="col-md-12">
                <form class="form-horizontal form" method="post" action="${ctx}/front/user/account/change">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">原密码</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="password" placeholder="原密码">
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="newPassword" placeholder="新密码">
                    </div>
                  </div>
                  <div class="form-group">
                    <label  class="col-sm-2 control-label">确认密码</label>
                    <div class="col-sm-10">
                      <input type="password" class="form-control" name="confirmPassword" placeholder="确认密码">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" class="btn btn-primary">修改</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>

        </div>

      </div>
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
