<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title>资料管理</title>

<link rel="stylesheet" href="${ctx}/static/ztree/css/demo.css" type="text/css">
<link rel="stylesheet" href="${ctx}/static/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<!--<script type="text/javascript" src="${ctx}/static/ztree/js/jquery-1.4.4.min.js"></script>-->
<script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="${ctx}/static/ztree/js/jquery.ztree.exedit.js"></script>
<script src="${ctx}/static/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <SCRIPT type="text/javascript">
    var cid = ${course.id}
    var countNum = 1;
    var isParent = 1;
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: beforeClick,
            onClick: onClick,
            beforeRename:beforeRename,

        }
    };
    var zNodes =[
    ];
    if(cid){
        $.ajax({
            url:'${ctx}/class/getNode',
            data:{
                'cid':cid
            },
            async:false,
            type:'post',
            dataType:'json',
            success:function(msg){
                zNodes = msg;
            },
            error:function(msg){
                alert(msg.status);
            }
        })
    }


    function beforeClick(treeId, treeNode, clickFlag) {
    }
    function onClick(event, treeId, treeNode, clickFlag) {
        if(!treeNode.isParent){
            $("#detail").show(200);
            $("#detail").attr("tid",treeNode.id);
        }else{
            $("#detail").hide(200);
            $("#detail").attr("tid",0);
        }
    }
    function beforeRename(treeId, treeNode,newName, isCancel){
        var pid;
        pid = treeNode.pId;
        if(pid==null){
            pid = 0;
        }
        if(treeNode!=null&&treeNode.isParent){
            $.ajax({
                url:'${ctx}/class/makedir',
                data:{
                    'cid':cid,
                    'pid':pid,
                    'name':newName
                },
                async:false,
                type:'post',
                dataType:'json',
                success:function(msg){
                    window.setInterval(200);
                    if(msg.status==100){
                        treeNode.id = msg.id;
                        zTree = $.fn.zTree.getZTreeObj("treeDemo");
                        zTree.updateNode(treeNode);
                    }else if(msg.status==101){
                        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                        var callbackFlag = $("#callbackTrigger").attr("checked");
                        zTree.removeNode(treeNode, callbackFlag);
                        alert("文件夹已存在!");

                    }else{
                        alert("服务器出错!");
                    }

                },
                error:function(msg){
                    alert(msg.status);
                }
            })
        }


    }
    function remove(e) {
        if(!confirm("确定要删除文件及其子文件吗?")) return;
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                nodes = zTree.getSelectedNodes(),
                treeNode = nodes[0];
        if (nodes.length == 0) {
            alert("请先选择一个节点");
            return;
        }
        var tar_id = treeNode.id;
        $.ajax({
            url:'${ctx}/class/material/edit/delete',
            type:'post',
            dataType:'json',
            data:{'id':tar_id},
            success:function(msg){
                if(msg.status==100) {
                    alert("删除成功！");
                    zTree.removeNode(treeNode);
                    var parentNode = treeNode.getParentNode();
                    parentNode.isParent=true;
                    zTree.updateNode(parentNode);
                }

            },
            error:function(msg){
                alert(msg.status);
            }

        })

    };

    function add(e) {
        isParent = 1;
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                isParent = e.data.isParent,
                nodes = zTree.getSelectedNodes(),
                treeNode = nodes[0];
        if(nodes.length == 0){
            treeNode = zTree.addNodes(treeNode, { pId:0, isParent:isParent, name:"新建文件夹" });
            zTree.editName(treeNode[0]);
            return;
        }
        if(treeNode.isParent==false){
            alert("请选择一个文件夹！");
            return;
        }

        if (treeNode) {
            treeNode = zTree.addNodes(treeNode, { pId:treeNode.id, isParent:isParent, name:"新建文件夹" });
        } else {
            treeNode = zTree.addNodes(null, { pId:0, isParent:isParent, name:"新建文件夹"});
        }
        if (treeNode) {
            zTree.editName(treeNode[0]);
        } else {
            alert("请选择一个文件夹!");
        }
    };

    function addLeaf(e) {
        isParent = 0;
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                isParent = e.data.isParent,
                nodes = zTree.getSelectedNodes(),
                treeNode = nodes[0];
        if(treeNode.isParent==false){
            alert("请选择一个文件夹！");
            return;
        }
        var tid = treeNode.id;
        $("#sub_btn").show();
        $("#sub_btn2").hide();
        $("#uploaded_file").hide();
        $('#myModal').modal('show');
       // $("#upload_btn").bind("click",function(){
        $("#sub_btn").unbind("click");
        $("#sub_btn").bind("click",function(){
            $('#myModal').modal('hide');
            var name = $("#name").val();
            var desc = $("#desc").val();
            $('#file_upload').uploadify('settings','formData',{"pid":tid,"name":name,"desc":desc,"courseId":cid});
            $('#file_upload').uploadify('upload', '*');

            return;
        });

        if (treeNode) {
            treeNode = zTree.addNodes(treeNode, {id:123, pId:treeNode.id, isParent:isParent, name:"新建文件" });
        } else {
            treeNode = zTree.addNodes(null, {id:123, pId:0, isParent:isParent, name:"新建文件"});
        }
        if (treeNode) {
            zTree.editName(treeNode[0]);
        } else {
            alert("请选择一个文件夹!");
        }

    };

    $(document).ready(function(){
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#create").bind("click", {isParent:true}, add);
        $("#upload").bind("click", {isParent:false}, addLeaf);
        $("#remove").bind("click",remove);

        $('#file_upload').uploadify({
            'swf'      : '${ctx}/static/uploadify/uploadify.swf',
            'uploader' : '${ctx}/class/uploadFile',
            'auto':false,
            'fileObjName' : 'file',
            'fileSizeLimit' : '0',
            'onUploadSuccess' : function(file, data, response) {

                var msg = strToJson(data);
                var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                        nodes = zTree.getSelectedNodes(),
                        treeNode = nodes[0];
                treeNode.name = msg.name;
                treeNode.id = msg.id;
                zTree.updateNode(treeNode);

            }




        });

        $("#detail").bind("click",function(){

            var tid = $(this).attr("tid");
            $.ajax({
                url:"${ctx}/class/material/edit/getOneNode",
                type:'post',
                dataType:'json',
                data:{
                    'id':tid
                },
                success:function(msg){

                    $("#name").val(msg.name);
                    $("#desc").val(msg.desc);
                    $("#uploaded_file a").attr("href",msg.path);
                    var dirs = msg.path.split('/');
                    var fileName = dirs[dirs.length-1];

                    $("#uploaded_file a").text(fileName);
                    $("#uploaded_file").show(100);
                    $("#sub_btn").hide();
                    $("#sub_btn2").show();
                    $("#sub_btn2").unbind("click");
                    $("#sub_btn2").bind("click",function(){

                        $('#myModal').modal('hide');
                        var name = $("#name").val();
                        var desc = $("#desc").val();
                        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                                nodes = zTree.getSelectedNodes(),
                                treeNode = nodes[0];
                        var pid = treeNode.getParentNode().id;
                        var tid = treeNode.id;
                        $('#file_upload').uploadify('settings','formData',{"id":tid,"pid":pid,"name":name,"desc":desc,"courseId":cid});
                        $('#file_upload').uploadify('upload', '*');


                        return;
                    });
                    $('#myModal').modal('show');
                },
                error:function(msg){
                    alert("error");
                }
            })
        });


    });
    function strToJson(str){
        var json = eval('(' + str + ')');
        return json;
    }
    //-->
</SCRIPT>
    <style>
        .op_btn{
            margin-bottom:30px;
        }
        .op_btn a{
            width:100px;
        }
    </style>
</head>

<BODY>

    <div class="page-header">
    <h1 align="left">
        ${course.name}-资料管理
        <small>
            <i class="icon-double-angle-right"></i>
        </small>
    </h1>
    </div>





    <div class="zTreeDemoBackground left" style="float:left;margin-left:50px;">
        <ul id="treeDemo" class="ztree"></ul>
    </div>
    <div class="right" style="float:left">

        <div style="margin-left:80px;margin-top: 100px">
        <div class="op_btn">
            <a class="btn btn-xs btn-primary " href="javascript:;" id="detail" style="display: none;" tid="0">
                <i class="ace-icon fa fa-upload bigger-120"></i> 查看
            </a>
        </div>
        <div class="op_btn">
            <a class="btn btn-xs btn-success " href="javascript:;" id="create">
                <i class="ace-icon fa fa-file bigger-120"></i> 新建文件夹
            </a>
        </div>
        <div class="op_btn">
            <a class="btn btn-xs btn-success " href="javascript:;" id="upload">
                <i class="ace-icon fa fa-upload bigger-120"></i> 上传文件
            </a>
        </div>

        <div class="op_btn">
            <a class="btn btn-xs btn-danger " href="javascript:;" id="remove">
                <i class="ace-icon fa fa-cut bigger-120"></i> 删除
            </a>
        </div>
        </div>
    </div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="blue bigger">上传资料</h4>
        </div>


        <form:form class="form-horizontal" role="form" id="formSysRole" enctype="multipart/form-data" >
            <!-- #section:elements.form -->

           <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> 附件名称 </label>

                <div class="col-sm-9">
                    <div class="col-sm-9">
                        <form:input path="name" placeholder="附件标题" class="form-control" />
                    </div>
                </div>
            </div>

          < <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"> 附件描述 </label>

                <div class="col-sm-9">
                    <div class="col-sm-9">
                        <form:textarea path="desc" cols="3"  rows="4" placeholder="附件描述" class="form-control" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label no-padding-right"  > 上传附件 </label>



                <div class="col-sm-9">
                    <div class="col-sm-9">

                        <input type="file" name="fileName" id="file_upload" />
                      <%--  <a href="javascript:;" id="upload_btn">上传文件</a> | <a href="javascript:$('#file_upload').uploadify('stop')">停止上传!</a>--%>
                    </div>
                </div>
                <div id="uploaded_file" style="display:none">
                    <img src="${ctx}/static/img/attachment.png" style="width:15px;height:15px;"/>
                    <a href="javascript:;"></a>
                </div>
            </div>
        </form:form>


        <div class="modal-footer">
            <a class="btn btn-sm clear" onclick="$('#myModal').modal('hide');">
                <i class="ace-icon fa fa-times"></i>
                取消
            </a>
            <a class="btn btn-sm btn-primary btnSave" href="javascript:;" id="sub_btn">
                <i class="ace-icon fa fa-check"></i>
                保存
            </a>
            <a class="btn btn-sm btn-primary btnSave" href="javascript:;" id="sub_btn2">
                <i class="ace-icon fa fa-check"></i>
                更新
            </a>
        </div>
    </div>
</div>
</div>
<script>
    $(function(){
        $(".btnSave").on("click",function(){
            $("#formSysRole").submit();
        });
    });
</script>



</BODY>

</HTML>