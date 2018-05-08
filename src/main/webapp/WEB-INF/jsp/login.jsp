<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/taglib/taglibs.jsp" %>

<!DOCTYPE html>
<html>
<head>
		<title>Go+ Loyalty</title>            
        
        <!-- META SECTION -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <!-- END META SECTION -->
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" href="css/styles.css">
        <!-- EOF CSS INCLUDE -->
</head>
<body>
	<!-- APP WRAPPER -->
	<div class="app">
	    <!-- START APP CONTAINER -->
	    <div class="app-container">
	        <div class="app-login-box">                                        
	            <div class="app-login-box-user"><img src="img/user/no-image.png" alt="No Image"></div>
	            <div class="app-login-box-title">
	                <div class="title">Already a member?</div>
	                <div class="subtitle">Sign in to your account</div>                        
	            </div>
	            <div class="app-login-box-container">
	            	<form:form method="post" action="/login">
	                    <div class="form-group">
	                    	<input type="text" class="form-control" data-validation="required" id="username" name="username" placeholder="Username">
	                    </div>
	                    <div class="form-group">
	                    	<input type="password" class="form-control" data-validation="required" id="password" name="password" placeholder="Password">
	                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                    </div>
	                    <div class="form-group">
	                        <div class="row">
	                            <div class="col-md-6 col-xs-6">
	                                <div class="app-checkbox">
	                                    <label><input type="checkbox" name="app-checkbox-1" value="0"> Remember me</label>
	                                </div>
	                            </div>
	                            <div class="col-md-6 col-xs-6">
	                                <button type="submit" class="btn btn-success btn-block">Sign In</button>
	                            </div>
	                        </div>
	                    </div>
	                </form:form>
	            </div>
	            <div class="app-login-box-footer">
	                &copy; Go+ Loyalty 2018. All rights reserved.
	            </div>
	        </div>       
	    </div>
	    <!-- END APP CONTAINER -->
	</div>        
	<!-- END APP WRAPPER -->
	
	<!-- IMPORTANT SCRIPTS -->
    <script type="text/javascript" src="js/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="js/vendor/jquery/jquery-migrate.min.js"></script>
    <script type="text/javascript" src="js/vendor/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/vendor/bootstrap/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/vendor/moment/moment.min.js"></script>
    <script type="text/javascript" src="js/vendor/customscrollbar/jquery.mCustomScrollbar.min.js"></script>
    <!-- END IMPORTANT SCRIPTS -->
    <!-- APP SCRIPTS -->
    <script type="text/javascript" src="js/app.js"></script>
    <script type="text/javascript" src="js/app_plugins.js"></script>
    <!-- END APP SCRIPTS -->
    
    <script type="text/javascript" src="js/vendor/form-validator/jquery.form-validator.min.js"></script>
    <script type="text/javascript">
	    $(function(){
	    	$.validate({
	            modules : 'date,file,location',
	            onValidate: function(){
	                delayBeforeFire(function(){                                                
	                    app.spy();
	                },100);             
	            }
	        });
	    });
    </script>
</body>
</html>