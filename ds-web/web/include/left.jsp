<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <%@include file="common.jsp"%>
</head>
<body>
<div id="sidebar" class="sidebar  responsive">
    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
    </script>

   <%-- <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <!-- #section:basics/sidebar.layout.shortcuts -->
            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>

            <!-- /section:basics/sidebar.layout.shortcuts -->
        </div>

        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>--%><!-- /.sidebar-shortcuts -->

    <ul class="nav nav-list">


        <c:forEach items="${myMenus}" var="myMenu">
            <c:choose>
                <c:when  test="${empty myMenu.children}">
                    <li class="">
                        <a href="${ctx}${myMenu.parent.url}">
                            <i class="menu-icon fa fa-tachometer"></i>
                            <span class="menu-text"> ${myMenu.parent.name} </span>
                        </a>

                        <b class="arrow"></b>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="active">
                        <a href="#" class="dropdown-toggle">
                            <i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">
                                    ${myMenu.parent.name}
							</span>

                            <b class="arrow fa fa-angle-down"></b>
                        </a>

                        <b class="arrow"></b>

                        <ul class="submenu">
                            <c:forEach items="${myMenu.children}" var="child">
                                <li class="">
                                    <a href="${ctx}${child.url}">
                                        <i class="menu-icon fa fa-caret-right"></i>
                                        ${child.name}
                                    </a>

                                    <b class="arrow"></b>
                                </li>
                            </c:forEach>
                        </ul>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>


    </ul><!-- /.nav-list -->

    <!-- #section:basics/sidebar.layout.minimize -->
    <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>

    <!-- /section:basics/sidebar.layout.minimize -->
    <script type="text/javascript">
        try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
    </script>
</div>
</body>
</html>
