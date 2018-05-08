<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<title>Go+ Loyalty</title>            
        
<!-- META SECTION -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<link rel="shortcut icon" href="${contextPath}/img/favicon.ico" type="image/x-icon">
<link rel="icon" href="${contextPath}/img/favicon.ico" type="image/x-icon">
<!-- END META SECTION -->
<!-- CSS INCLUDE -->        
<link rel="stylesheet" href="${contextPath}/css/styles.css">
<!-- EOF CSS INCLUDE -->

<!-- IMPORTANT SCRIPTS -->
<script type="text/javascript" src="${contextPath}/js/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/jquery/jquery-migrate.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/jquery/jquery-ui.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/moment/moment.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/customscrollbar/jquery.mCustomScrollbar.min.js"></script>
<!-- END IMPORTANT SCRIPTS -->
<!-- DASHBOARD PAGE SCRIPTS -->
<script type="text/javascript" src="${contextPath}/js/vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>

<script type="text/javascript" src="${contextPath}/js/vendor/jvectormap/jquery-jvectormap.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/jvectormap/jquery-jvectormap-us-aea-en.js"></script>

<script type="text/javascript" src="${contextPath}/js/vendor/rickshaw/d3.v3.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/rickshaw/rickshaw.min.js"></script>
<!-- END DASHBOARD PAGE SCRIPTS -->

<script type="text/javascript" src="${contextPath}/js/vendor/form-validator/jquery.form-validator.min.js"></script>

<!-- APP SCRIPTS -->
<script type="text/javascript" src="${contextPath}/js/app.js"></script>
<script type="text/javascript" src="${contextPath}/js/app_plugins.js"></script>
<!-- END APP SCRIPTS -->

<script type="text/javascript">
	var csrfHeader = $("meta[name='_csrf_header']").attr("content");
	var csrfToken = $("meta[name='_csrf']").attr("content");

    $(function(){
    	$.validate({
            modules : 'date,file,location',
            onValidate: function(){
                delayBeforeFire(function(){                                                
                    app.spy();
                },100);           
            }
        });
    	
        $(".block-refresh-example").on("click",function(){
            var block = $(this).data("block");
            app.block.loading.start("#"+block);
            setTimeout(function(){
                app.block.loading.finish("#"+block);
            },3000);
        });
    });
    
    jQuery.ajaxSetup({
   	  beforeSend: function() {
   	     $('#loader').show();
   	  },
   	  complete: function(){
   	     $('#loader').hide();
   	  },
   	  success: function() {}
   	});
</script>