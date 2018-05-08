<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
		// set active on load:
		var activeMenu = sessionStorage.getItem("active-menu");
		if(activeMenu) {
			$(activeMenu).addClass('active');
		} else {
			$('.menu-dashboard').addClass('active');
		}
	});

	function fnMenu(name) {
		// pass value same as class name
		sessionStorage.setItem("active-menu", name);
	}
</script>

<!-- START SIDEBAR -->
<div class="app-sidebar app-navigation app-navigation-fixed scroll app-navigation-style-default app-navigation-open-hover dir-left" data-type="close-other">
	<a href="#" class="app-navigation-logo">Go+ Loyalty</a>
    <nav>
        <ul>
        	<li class="title">HOME</li>
        	<c:choose>
		    	<c:when test="${userInfo['role_name'] eq 'Administrator'}">
		    		<li><a href="/admin/dashboard" class="menu menu-dashboard" onclick="fnMenu('.menu-dashboard');"><span class="fa fa-dashboard"></span> Dashboard</a></li>
		    		<li class="title">BUSINESS</li>
	            	<li><a href="/admin/deal/deals" class="menu menu-deals" onclick="fnMenu('.menu-deals');"><span class="fa fa-tags"></span> Deals</a></li>
		            <li class="title">MANAGEMENT</li>
		            <li><a href="/admin/user/users" class="menu menu-users" onclick="fnMenu('.menu-users');"><span class="fa fa-user"></span> Users</a></li>
		            <li><a href="/admin/merchant/merchants" class="menu menu-merchants" onclick="fnMenu('.menu-merchants');"><span class="fa fa-group"></span> Merchants</a></li>
		            <li><a href="/admin/category/categories" class="menu menu-categories" onclick="fnMenu('.menu-categories');"><span class="fa fa-table"></span> Categories</a></li>
<!-- 		            <li><a href="/admin/location/locations" class="menu menu-locations" onclick="fnMenu('.menu-locations');"><span class="fa fa-map-marker"></span> Locations</a></li> -->
		            <li class="title">REPORT</li>
		            <li><a href="#" class="menu menu-reports" onclick="fnMenu('.menu-reports');"><span class="fa fa-folder-o"></span> Reports</a></li>
		    	</c:when>
		    	<c:when test="${userInfo['role_name'] eq 'Merchant'}">
		    		<li><a href="/merchant/dashboard" class="menu menu-dashboard" onclick="fnMenu('.menu-dashboard');"><span class="fa fa-dashboard"></span> Dashboard</a></li>
		    	</c:when>
		    </c:choose>
        </ul>
    </nav>
</div>
<!-- END SIDEBAR -->