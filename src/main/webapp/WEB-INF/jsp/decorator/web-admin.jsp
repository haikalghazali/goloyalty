<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/jsp/taglib/taglibs.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<c:import url="/WEB-INF/jsp/include/init.jsp"/>
	<sitemesh:write property="head" />
</head>
<body>
	<!-- APP WRAPPER -->
	<div class="app">
		<!-- START APP CONTAINER -->
    	<div class="app-container">
    		<c:import url="/WEB-INF/jsp/include/sidebar.jsp"/>
    		<!-- START APP CONTENT -->
        	<div class="app-content app-sidebar-left">
        		<c:import url="/WEB-INF/jsp/include/header.jsp"/>
<!--         		<div class="app-spinner pulse pulse-primary"></div> -->
        		<sitemesh:write property="body" />	
        	</div>
        	<!-- END APP CONTENT -->
		</div>
    	<!-- END APP CONTAINER -->
    	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	</div>        
	<!-- END APP WRAPPER -->  
</body>
</html>