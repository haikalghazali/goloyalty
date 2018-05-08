<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- START PAGE HEADING -->
<div class="app-heading app-heading-bordered app-heading-page">
    <div class="title">
        <h1>Dashboard</h1>
    </div> 
</div>
<div class="app-heading-container app-heading-bordered bottom">
    <ul class="breadcrumb">
        <li><a href="#">Application</a></li>                                                     
        <li class="active">Dashboard</li>
    </ul>
</div>
<!-- END PAGE HEADING -->
<!-- START PAGE CONTAINER -->
<div class="container">                          
    <div class="row">
        <div class="col-md-3">   
            <div class="app-widget-tile app-widget-tile-primary app-widget-gradient">                                                                                    
                <div class="line">
                    <div class="title">Users</div>
                </div>
                <div class="intval intval-lg">${totalUser}</div>
                <div class="line">
                    <div class="subtitle">Active users</div>
                </div>
            </div>
        </div>                            
        <div class="col-md-3">
            <div class="app-widget-tile app-widget-tile-primary app-widget-gradient">                                                                                    
                <div class="line">
                    <div class="title">Merchants</div>
                </div>
                <div class="intval intval-lg">${totalMerchant}</div>
                <div class="line">
                    <div class="subtitle">Active merchants</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="app-widget-tile app-widget-tile-primary app-widget-gradient">                                                                                    
                <div class="line">
                    <div class="title">Deals</div>
                </div>
                <div class="intval intval-lg">${totalDeal}</div>
                <div class="line">
                    <div class="subtitle">Active deals</div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="app-widget-tile app-widget-tile-primary app-widget-gradient">                                                                                    
                <div class="line">
                    <div class="title">Order</div>
                </div>
                <div class="intval intval-lg">$19,223.33</div>
                <div class="line">
                    <div class="subtitle">Total orders</div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="block block-condensed">
                <!-- START HEADING -->
                <div class="app-heading app-heading-small">
                    <div class="title">
                        <h5>Latest Deals</h5>
                        <p>List of approved deals based on latest date created</p>
                    </div>
                </div>
                <!-- END HEADING -->
                <div class="table-responsive">
                    <table class="table table-head-light table-striped">
                        <thead>
		                    <tr>
		                    	<th>Deal image</th>
		                        <th>Deal name</th>
		                        <th>Merchant name</th>
		                        <th>Start date</th>
		                        <th>End date</th>
		                    </tr>
		                </thead>
		                <tbody>
		                	<c:forEach var="deals" items="${dashboardDeals}"  varStatus="loop">
		                    <tr>
		                    	<td><img src="${deals.deal_image}" /></td>
		                        <td>${deals.deal_name}</td>
		                        <td>${deals.merchant_name}</td>
		                        <td>${deals.deal_start_dt}</td>
		                        <td>${deals.deal_end_dt}</td>
		                    </tr>
		                    </c:forEach>                               
		                </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END PAGE CONTAINER -->