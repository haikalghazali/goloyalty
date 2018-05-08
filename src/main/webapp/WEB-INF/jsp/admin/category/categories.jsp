<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- TABLE PAGE SCRIPTS -->
<script type="text/javascript" src="${contextPath}/js/vendor/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/datatables/dataTables.bootstrap.min.js"></script>
<!-- END TABLE PAGE SCRIPTS -->

<!-- START PAGE HEADING -->
<div class="app-heading app-heading-bordered app-heading-page">
    <div class="title">
        <h1>Categories</h1>
    </div> 
</div>
<div class="app-heading-container app-heading-bordered bottom">
    <ul class="breadcrumb">
        <li><a href="#">Application</a></li>                                                     
        <li><a href="/admin/dashboard" onclick="fnMenu('.menu-dashboard');">Dashboard</a></li>
        <li class="active">Categories</li>
    </ul>
</div>
<!-- END PAGE HEADING -->

<!-- START PAGE CONTAINER -->
<div class="container">    
    <div class="block block-condensed">
        <div class="block-heading">
    		<a href="/admin/category/new" class="btn btn-primary btn-clean">Register</a>
    	</div>
        <div class="block-content">
            <table class="table table-striped table-bordered datatable-extended">
                <thead>
                    <tr>
                        <th>Category Name</th>
                        <th>Status</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="categories" items="${listCategories}"  varStatus="loop">
                    <tr>
                        <td>${categories.category_name}</td>
                        <td><c:choose><c:when test="${categories.active == 'Y'}"><span class="label label-success">Active</span></c:when><c:otherwise><span class="label label-danger">Inactive</span></c:otherwise></c:choose></td>
                        <td><a href="/admin/caetgory/id/${categories.category_id}" class="btn btn-primary btn-clean">Edit</a></td>
                    </tr>
                    </c:forEach>                               
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- END PAGE CONTAINER -->