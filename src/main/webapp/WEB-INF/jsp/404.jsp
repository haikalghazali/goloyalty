<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/taglib/taglibs.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>                        
        <title>Go+ Loyalty</title>            
        
        <!-- META SECTION -->
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <!-- END META SECTION -->
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" href="css/styles.css">
        <!-- EOF CSS INCLUDE -->
    </head>
    <body>
        <!-- APP WRAPPER -->
        <div class="app" style="height: 100%;">
            <!-- START APP CONTAINER -->
            <div class="app-container app-error-container">
                <div class="app-error">
                    <div class="app-error-code">404</div>
                    <div class="app-error-message">Woooops... something has gone terribly wrong here</div>
                    <div class="app-error-button">
                        <a href="/login" class="btn btn-primary btn-lg btn-shadowed btn-rounded">Back to home</a>
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
    </body>
</html>