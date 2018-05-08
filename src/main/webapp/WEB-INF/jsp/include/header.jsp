<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script type="text/javascript">
	function fnLogout() {
		// clear session storage for menu
		sessionStorage.clear();
	}
</script>
        
<!-- START APP HEADER -->
<div class="app-header app-header-design-default">
    <ul class="app-header-buttons">
        <li class="visible-mobile"><a href="#" class="btn btn-link btn-icon" data-sidebar-toggle=".app-sidebar.dir-left"><span class="icon-menu"></span></a></li>
        <li class="hidden-mobile"><a href="#" class="btn btn-link btn-icon" data-sidebar-minimize=".app-sidebar.dir-left"><span class="icon-menu"></span></a></li>
    </ul>
    <form class="app-header-search" action="" method="post">        
        <input type="text" name="keyword" placeholder="Search">
    </form>    

    <ul class="app-header-buttons pull-right">        
        <li>
            <div class="contact contact-rounded contact-bordered contact-lg contact-ps-controls hidden-xs">
                <img src="${contextPath}/img/user/no-image.png" alt="No Image">
                <div class="contact-container">
                    <a href="#"><c:out value="${userInfo['username']}"/></a>
                    <span><c:out value="${userInfo['role_name']}"/></span>
                </div>
                <div class="contact-controls">
                   <div class="dropdown">
                       <button type="button" class="btn btn-default btn-icon" data-toggle="dropdown"><span class="icon-layers"></span></button>                        
                       <ul class="dropdown-menu dropdown-left">
                           <li><a href="#"><span class="icon-users"></span> Account</a></li> 
                       </ul>
                   </div>                    
               </div>
            </div>
        </li>
        <li>
            <a href="/logout" class="btn btn-default btn-icon" onclick="fnLogout()"><span class="icon-power-switch"></span></a>
        </li>
    </ul>
</div>
<!-- END APP HEADER  -->