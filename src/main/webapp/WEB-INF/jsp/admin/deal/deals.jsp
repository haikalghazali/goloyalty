<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- TABLE PAGE SCRIPTS -->
<script type="text/javascript" src="${contextPath}/js/vendor/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/datatables/dataTables.bootstrap.min.js"></script>
<!-- END TABLE PAGE SCRIPTS -->

<!-- START PAGE HEADING -->
<div class="app-heading app-heading-bordered app-heading-page">
    <div class="title">
        <h1>Deals</h1>
    </div> 
</div>
<div class="app-heading-container app-heading-bordered bottom">
    <ul class="breadcrumb">
        <li><a href="#">Application</a></li>                                                     
        <li><a href="/admin/dashboard" onclick="fnMenu('.menu-dashboard');">Dashboard</a></li>
        <li class="active">Deals</li>
    </ul>
</div>
<!-- END PAGE HEADING -->

<!-- START PAGE CONTAINER -->
<div class="container">    
    <div class="block block-condensed">
        <div class="block-heading">
    		<a href="/admin/deal/new" class="btn btn-primary btn-clean">Register</a>
    	</div>
        <div class="block-content">
            <table class="table table-striped table-bordered datatable-extended">
                <thead>
                    <tr>
                        <th>Deal name</th>
                        <th>Merchant name</th>
                        <th>Start date</th>
                        <th>End date</th>
                        <th>Approval Status</th>
                        <th>Usage Status</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="deals" items="${listDeals}"  varStatus="loop">
                    <tr>
                        <td>${deals.deal_name}</td>
                        <td>${deals.merchant_id}</td>
                        <td>${deals.deal_start_dt}</td>
                        <td>${deals.deal_end_dt}</td>
                        <td><c:choose><c:when test="${deals.deal_approval_status == 'Y'}"><span class="label label-success">Approved</span></c:when><c:otherwise><span class="label label-danger">Rejected</span></c:otherwise></c:choose></td>
                        <td><c:choose><c:when test="${deals.active == 'Y'}"><span class="label label-success">Active</span></c:when><c:otherwise><span class="label label-danger">Inactive</span></c:otherwise></c:choose></td>
                        <td><a href="/admin/deal/id/${deals.deal_id}" class="btn btn-primary btn-clean">Edit</a></td>
                    </tr>
                    </c:forEach>                               
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- END PAGE CONTAINER -->