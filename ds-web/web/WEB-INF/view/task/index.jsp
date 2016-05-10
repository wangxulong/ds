<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div>
    <div class="flag-style">
        <span>布置作业</span>
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
            <th>作业主题</th>
            <th>简单描述</th>
            <th>布置时间</th>
            <th>截止时间</th>
            <th class="hidden-480">操作</th>


        </tr>
        </thead>

        <tbody>

        <c:forEach items="${allhomeWork}" var="homeWork">
            <tr>
                <td class="center">
                    <label class="position-relative">
                        <input type="checkbox" class="ace" />
                        <span class="lbl"></span>
                    </label>
                </td>
                <td>${homeWork.topic}</td>
                <td> ${homeWork.desc}</td>
                <td>${homeWork.createTime}</td>
                <td> ${homeWork.finshTime}</td>
                <td class="hidden-480">
                    <div class="hidden-sm hidden-xs btn-group">
                            <a class="btn btn-xs btn-success " href="${ctx}/task/add" >
                                <i class="ace-icon fa fa-plus bigger-120 "></i>
                            </a>
                            <button class="btn btn-xs btn-info">
                                <i class="ace-icon fa fa-pencil bigger-120"></i>
                            </button>
                            <a class="btn btn-xs btn-danger" href="${ctx}/task/delete?id=${homeWork.id}">
                                <i class="ace-icon fa fa-trash-o bigger-120"></i>
                            </a>
                    </div>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
