<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta charset="utf-8" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
  <%@include file="../include/common.jsp"%>
  <title>
    <sitemesh:write property='title' />
  </title>
  <sitemesh:write property='head' />
</head>
<body class="no-skin">
<!-- naverbar -->
<jsp:include page="../include/navbar.jsp"/>
  <!-- /section:basics/navbar.layout -->
  <div class="main-container" id="main-container">
    <script type="text/javascript">
      try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>

    <!-- #section:basics/sidebar -->
    <jsp:include page="../include/left.jsp"/>

    <!-- /section:basics/sidebar -->
    <div class="main-content">
      <div class="main-content-inner">
        <!-- #section:basics/content.breadcrumbs -->
        <jsp:include page="../include/breadcrumbs.jsp"/>

        <!-- /section:basics/content.breadcrumbs -->
        <div class="page-content">
          <!-- #section:settings.box -->
          <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
              <i class="ace-icon fa fa-cog bigger-130"></i>
            </div>

            <div class="ace-settings-box clearfix" id="ace-settings-box">
              <div class="pull-left width-50">
                <!-- #section:settings.skins -->
                <div class="ace-settings-item">
                  <div class="pull-left">
                    <select id="skin-colorpicker" class="hide">
                      <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                      <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                      <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                      <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                    </select>
                  </div>
                  <span>&nbsp; Choose Skin</span>
                </div>

                <!-- /section:settings.skins -->

                <!-- #section:settings.navbar -->
                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
                  <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                </div>

                <!-- /section:settings.navbar -->

                <!-- #section:settings.sidebar -->
                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
                  <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                </div>

                <!-- /section:settings.sidebar -->

                <!-- #section:settings.breadcrumbs -->
                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
                  <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                </div>

                <!-- /section:settings.breadcrumbs -->

                <!-- #section:settings.rtl -->
                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
                  <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                </div>

                <!-- /section:settings.rtl -->

                <!-- #section:settings.container -->
                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
                  <label class="lbl" for="ace-settings-add-container">
                    Inside
                    <b>.container</b>
                  </label>
                </div>

                <!-- /section:settings.container -->
              </div><!-- /.pull-left -->

              <div class="pull-left width-50">
                <!-- #section:basics/sidebar.options -->
                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
                  <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                </div>

                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
                  <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                </div>

                <div class="ace-settings-item">
                  <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
                  <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                </div>

                <!-- /section:basics/sidebar.options -->
              </div><!-- /.pull-left -->
            </div><!-- /.ace-settings-box -->
          </div><!-- /.ace-settings-container -->

          <!-- /section:settings.box -->
          <div class="row">
            <div class="col-xs-12">
              <sitemesh:write property='body' />
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.page-content -->
      </div>
    </div><!-- /.main-content -->

    <!--footer-->
    <jsp:include page="../include/footer.jsp"/>
    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
      <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
    </a>
  </div><!-- /.main-container -->
<script src="${ctx}/static/js/ace/assets/js/bootstrap.js"></script>

  <!-- page specific plugin scripts -->

  <!-- ace scripts -->
   <script src="${ctx}/static/js/ace/assets/js/ace/elements.scroller.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.colorpicker.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.fileinput.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.typeahead.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.wysiwyg.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.spinner.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.treeview.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.wizard.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.aside.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.ajax-content.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.touch-drag.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.sidebar.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.sidebar-scroll-1.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.submenu-hover.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.widget-box.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.settings.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.settings-rtl.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.settings-skin.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.widget-on-reload.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.searchbox-autocomplete.js"></script>

  <!-- inline scripts related to this page -->

  <!-- the following scripts are used in demo only for onpage help and you don't need them -->
<%--  <link rel="stylesheet" href="${ctx}/static/js/ace/assets/css/ace.onpage-help.css" />
  <link rel="stylesheet" href="${ctx}/static/js/ace/docs/assets/js/themes/sunburst.css" />
  <script type="text/javascript"> ace.vars['base'] = '..'; </script>
  <script src="${ctx}/static/js/ace/assets/js/ace/elements.onpage-help.js"></script>
  <script src="${ctx}/static/js/ace/assets/js/ace/ace.onpage-help.js"></script>
  <script src="${ctx}/static/js/ace/docs/assets/js/rainbow.js"></script>
  <script src="${ctx}/static/js/ace/docs/assets/js/language/generic.js"></script>
  <script src="${ctx}/static/js/ace/docs/assets/js/language/html.js"]></script>
  <script src="${ctx}/static/js/ace/docs/assets/js/language/css.js"></script>
  <script src="${ctx}/static/js/ace/docs/assets/js/language/javascript.js"></script>--%>
  <div id="modal-form" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">

    </div>
  </div>
</div>
<script>
  $('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
    $(this).prev().focus();
  });
</script>

</body>
</html>
