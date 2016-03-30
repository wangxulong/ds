<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="blue bigger">添加角色</h4>
</div>

<div class="modal-body">
  <div class="row">
    <div class="col-xs-12">
        <!-- PAGE CONTENT BEGINS -->
        <form class="form-horizontal" method="post" role="form" id="formAddRole" action="${ctx}/sys/user/saveRole">
          <div class="form-group">
           <%-- <label class="col-sm-3 control-label no-padding-top" for="duallist"> Dual listbox </label>--%>
              <input type="hidden" name="id" value="${id}">
            <div class="col-sm-12">
              <!-- #section:plugins/input.duallist -->
              <select multiple="multiple" size="10" name="roleList" id="duallist">
                <c:forEach items="${sysRoles}" var="sysRole">
                   <option value="${sysRole.id}"
                           <c:if test="${not empty user.roleIds and fn:contains(user.roleIds,sysRole.id)}"> selected="selected"</c:if>
                           >${sysRole.roleName}</option>
                </c:forEach>
               <%-- <option value="option1">Option 1</option>
                <option value="option2">Option 2</option>
                <option value="option3" selected="selected">Option 3</option>
                <option value="option4">Option 4</option>
                <option value="option5">Option 5</option>
                <option value="option6" selected="selected">Option 6</option>
                <option value="option7">Option 7</option>
                <option value="option8">Option 8</option>
                <option value="option9">Option 9</option>
                <option value="option0">Option 10</option>--%>
              </select>

              <!-- /section:plugins/input.duallist -->
            </div>
          </div>
        </form>
      </div>
    </div>

</div>

<div class="modal-footer">
  <button class="btn btn-sm" data-dismiss="modal">
    <i class="ace-icon fa fa-times"></i>
    取消
  </button>

  <button class="btn btn-sm btn-primary btnSave">
    <i class="ace-icon fa fa-check"></i>
    保存
  </button>
</div>
<script src="${ctx}/static/js/ace/assets/js/jquery.bootstrap-duallistbox.js"></script>

<script>
  $(function(){
    var demo1 = $('#duallist').bootstrapDualListbox(
            {
              infoTextFiltered: '<span class="label label-purple label-lg">没有信息</span>',
              filterPlaceHolder:"过滤",
              infoTextEmpty:"空",
              infoText: '角色数目：{0}'

            });
    var container1 = demo1.bootstrapDualListbox('getContainer');
    container1.find('.btn').addClass('btn-white btn-info btn-bold');


     $(".btnSave").on("click",function(){
       $("#formAddRole").submit();
       /* var selectedRoles =  $('select[name="roleList_helper2"]').find("option");
         var selectRole = "";
         $.each(selectedRoles,function(index,value){
             selectRole+=$(value).attr("value")+',';
         });
         console.info(selectRole);*/

     });
  });
</script>
</body>
</html>
