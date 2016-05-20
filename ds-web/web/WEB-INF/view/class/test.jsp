<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/include/common.jsp"%>
<html>
<head>
    <title></title>
</head>
<body>
<div class="ui-jqgrid ui-widget ui-widget-content ui-corner-all" id="gbox_grid-table" dir="ltr" style="width: 891px;">
    <div class="ui-jqgrid-view" id="gview_grid-table" style="width: 891px;">
        <div class="ui-jqgrid-titlebar ui-widget-header ui-corner-top ui-helper-clearfix">
            <span class="ui-jqgrid-title">jqGrid with inline editing</span>
        </div>
    </div>
    <div id="grid-pager" class="ui-state-default ui-jqgrid-pager ui-corner-bottom" dir="ltr" style="width: 891px;">
        <div id="pg_grid-pager" class="ui-pager-control" role="group"><table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table" style="width:100%;table-layout:fixed;height:100%;" role="row">
            <tbody>
            <tr>
                <td id="grid-pager_left" align="left">
                    <table cellspacing="0" cellpadding="0" border="0" class="ui-pg-table navtable" style="float:left;table-layout:auto;">
                        <tbody>
                        <tr>
                            <td class="ui-pg-button ui-corner-all" title="" id="add_grid-table" data-original-title="Add new row">
                                <div class="ui-pg-div">
                                    <span class="ui-icon icon-plus-sign purple"></span>
                                </div>
                            </td>
                            <td class="ui-pg-button ui-corner-all" title="" id="edit_grid-table" data-original-title="Edit selected row">
                                <div class="ui-pg-div">
                                    <span class="ui-icon icon-pencil blue">

                                    </span>
                                </div>
                            </td>
                            <td class="ui-pg-button ui-corner-all" title="" id="view_grid-table" data-original-title="View selected row">
                                <div class="ui-pg-div">
                                    <span class="ui-icon icon-zoom-in grey"></span>
                                </div>
                            </td>
                            <td class="ui-pg-button ui-corner-all" title="" id="del_grid-table" data-original-title="Delete selected row">
                                <div class="ui-pg-div">
                                    <span class="ui-icon icon-trash red"></span>
                                </div>
                            </td>
                            <td class="ui-pg-button ui-state-disabled" style="width:4px;" data-original-title="" title="">
                                <span class="ui-separator"></span></td>
                            <td class="ui-pg-button ui-corner-all" title="" id="search_grid-table" data-original-title="Find records">
                                <div class="ui-pg-div">
                                    <span class="ui-icon icon-search orange"></span>
                                </div>
                            </td>
                            <td class="ui-pg-button ui-corner-all" title="" id="refresh_grid-table" data-original-title="Reload Grid">
                                <div class="ui-pg-div">
                                    <span class="ui-icon icon-refresh green"></span>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </td>
                <td id="grid-pager_center" align="center" style="white-space: pre; width: 343px;"><table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;" class="ui-pg-table">
                    <tbody><tr><td id="first_grid-pager" class="ui-pg-button ui-corner-all ui-state-disabled" style="cursor: default;"><span class="ui-icon icon-double-angle-left bigger-140"></span></td><td id="prev_grid-pager" class="ui-pg-button ui-corner-all ui-state-disabled"><span class="ui-icon icon-angle-left bigger-140"></span></td><td class="ui-pg-button ui-state-disabled" style="width:4px;"><span class="ui-separator"></span></td><td dir="ltr">Page <input class="ui-pg-input" type="text" size="2" maxlength="7" value="0" role="textbox"> of <span id="sp_1_grid-pager">3</span></td><td class="ui-pg-button ui-state-disabled" style="width:4px;"><span class="ui-separator"></span></td><td id="next_grid-pager" class="ui-pg-button ui-corner-all"><span class="ui-icon icon-angle-right bigger-140"></span></td><td id="last_grid-pager" class="ui-pg-button ui-corner-all" style="cursor: default;"><span class="ui-icon icon-double-angle-right bigger-140"></span></td><td dir="ltr"><select class="ui-pg-selbox" role="listbox"><option role="option" value="10" selected="selected">10</option><option role="option" value="20">20</option><option role="option" value="30">30</option></select></td></tr></tbody></table></td><td id="grid-pager_right" align="right"><div dir="ltr" style="text-align:right" class="ui-paging-info">View 1 - 10 of 23</div></td></tr></tbody></table></div></div></div>
</body>
</html>
