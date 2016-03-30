<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="widget-box">
  <div class="widget-header widget-header-flat">
    <h4 class="widget-title smaller"> ${menu.parent.name}--功能按钮</h4>
  </div>

  <div class="widget-body">
    <div class="widget-main">
      <div class="dd" id="nestable">
        <ol class="dd-list">
            <li class="dd-item">
              <div class="dd-handle">
                  ${menu.parent.name}
                <div class="pull-right action-buttons">
                  <a class="blue add-button" href="#"  data="${menu.parent.id}">
                    <i class="ace-icon fa fa-plus bigger-130"></i>
                  </a>
                </div>

              </div>
              <c:if test="${not empty menu.children}">
                <ol class="dd-list">
                  <c:forEach items="${menu.children}" var="child">
                    <li class="dd-item">
                      <div class="dd-handle">
                          ${child.name}
                        <div class="pull-right action-buttons">
                          <a class="red deleteMenu" href="#" data="${child.id}">
                            <i class="ace-icon fa fa-trash-o bigger-130"></i>
                          </a>

                        </div>
                      </div>
                    </li>
                  </c:forEach>
                </ol>

              </c:if>
            </li>

        </ol>
      </div>
    </div>
  </div>
</div>

<script>
  $(function () {
    $(".add-button").on("click",function(e){
      e.preventDefault();
      var parentId = $(this).attr("data");
      $("#modal-form .modal-content").load("${ctx}/sys/res/add",{type:"button",parentId:parentId},function(){
        $("#modal-form").modal("show");
      });
    });
  });
</script>
</body>
</html>
