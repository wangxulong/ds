<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="blue bigger">分配资源</h4>
</div>

<div class="modal-body">
    <div class="widget-box widget-color-blue2">
      <%--<div class="widget-header">
        <h4 class="widget-title lighter smaller">Choose Categories</h4>
      </div>--%>
      <input type="hidden" value="${roleId}" id="roleId"/>
      <div class="widget-body">
        <div class="widget-main padding-8">
          <ul id="treeview"></ul>
        </div>
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

<script src="${ctx}/static/js/ace/assets/js/fuelux/fuelux.tree.js"></script>

<script>
   $(function(){
     //construct the data source object to be used by tree
     var remoteUrl = '${ctx}/sys/res/ajaxTree';
     var roleId = $("#roleId").val();

     var remoteDateSource = function(options, callback) {
       var parent_id = null
       if( !('text' in options || 'type' in options) ){
         parent_id = 0;//load first level data
       }
       else if('type' in options && options['type'] == 'folder') {//it has children
//         if('additionalParameters' in options && 'children' in options.additionalParameters)
//           parent_id = options.additionalParameters['id']
         parent_id=options.id;
       }

       if(parent_id !== null) {
         $.ajax({
           url: remoteUrl,
           data: 'parentId='+parent_id+"&roleId="+roleId,
           type: 'POST',
           dataType: 'json',
           success : function(data) {
               callback({ data: data })
           },
           error: function(response) {
             //console.log(response);
           }
         })
       }
     }

     $('#treeview').ace_tree({
       dataSource: remoteDateSource ,
       multiSelect: true,
       loadingHTML: '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>',
       'open-icon' : 'ace-icon tree-minus',
       'close-icon' : 'ace-icon tree-plus',
       'selectable' : true,
       'selected-icon' : 'ace-icon fa fa-check',
       'unselected-icon' : 'ace-icon fa fa-times',
       cacheItems: true,
       folderSelect: true
     });
     //show selected items inside a modal
     $('.btnSave').on('click', function() {
       var output = [];//根节点
       var items = $('#treeview').tree('selectedItems');
       console.info(items);
       for(var i in items) if (items.hasOwnProperty(i)) {
         var item = items[i];


        //添加选中节点
         if(-1==$.inArray(item.id,output)){
             //添加父节点
             var itemParentId = item.parentIds;
             if(itemParentId&&itemParentId!= 0){
               var itemParentIds = itemParentId.split("-");
                 $.each(itemParentIds,function(index,value){
                     if(-1==$.inArray(value,output)){
                         output.push(value);
                     }
                 });
             }
//             //添加父节点
//             if(-1==$.inArray(item.parentId,output)){
//                 output.push(item.parentId);
//             }
           output.push(item.id);
         }
         //output += item.additionalParameters['id'] + ":"+ item.text+"\n";
       }

       var outputStr="";
       if(output.length>1){
         $.each(output, function (i,value) {
            if(i==output.length-1){
              outputStr+=value;
            }else{
              outputStr+=value+",";
            }

         });
       }
       if(output.length==1){
            alert("请选择资源");
       }else{
         $.post("${ctx}/sys/role/saveRoleRes",{id:roleId,resourceIds:outputStr}, function (data) {
            if(data.status=="success"){
              $("#modal-form").modal("hide");
              parent.location.reload();
            }else{
              alert("分配资源失败");
            }
         },"JSON");
       }

     });

   });
   </script>
</body>
</html>
