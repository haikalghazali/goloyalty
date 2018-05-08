<%@ include file="/WEB-INF/jsp/taglib/taglibs.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="${contextPath}/js/vendor/bootstrap-select/bootstrap-select.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/select2/select2.full.min.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/bootstrap-daterange/daterangepicker.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/multiselect/jquery.multi-select.js"></script>
<script type="text/javascript" src="${contextPath}/js/vendor/dropzone/dropzone.js"></script>

<script type="text/javascript">
	$(function() {		
	    $("#dealForm").submit(function(e) {
	        e.preventDefault();
	        var formData = new FormData();
	        formData.append("file", document.dealForm.deal_image.files[0]);
	        formData.append("deal", JSON.stringify({
	        	'indicator': $('#indicator').val(),
                'deal_id': $('#deal_id').val(),
                'deal_name': $('#deal_name').val(),
                'deal_description': $('#deal_description').val(),
                'merchant_id': $('#merchant_id').val(),
                'deal_start_dt': $('#deal_start_dt').val(),
                'deal_end_dt': $('#deal_end_dt').val(),
                'deal_category': $( "#deal_category:checked" ).map(function() {return $(this).val();}).get(),
                'deal_quantity': $('#deal_quantity').val(),
                'deal_quantity_user': $('#deal_quantity_user').val(),
                'deal_location': $( "#deal_location:checked" ).map(function() {return $(this).val();}).get(),
                'deal_approval_status': $('#deal_approval_status').val(),
                'active': $('#active').val()
            }));
	        
	        $.ajax({
	            url: '/admin/deal/save',
	            method: "POST",
	            headers: {"Content-Type": undefined},
	            data: formData,
	            processData: false,
	            contentType: false,
	            beforeSend: function(xhr){xhr.setRequestHeader(csrfHeader, csrfToken);},
	            success: function(data) {
	            	$('#btnSubmitForm').hide();
	            	$('#dealForm input').attr('readonly', 'readonly');
	            	$('#dealForm select').attr('disabled', 'true');
	            	$('#deal_image').prop('disabled', true);
	            	$("#deal_description").attr("disabled","disabled");
	            	$('#msgDiv').removeClass('alert-danger');
	            	$('#msgDiv').addClass('alert-success');
	            	$('#iconSpan').removeClass('icon-menu-circle');
	            	$('#iconSpan').addClass('icon-checkmark-circle');
	            	$('#msgDiv').show();
	            	$('#msg').text(data);
	            },
	            error: function(data) {
	            	$('#msgDiv').removeClass('alert-success');
	            	$('#msgDiv').addClass('alert-danger');
	            	$('#iconSpan').removeClass('icon-checkmark-circle');
	            	$('#iconSpan').addClass('icon-menu-circle');
	            	$('#msgDiv').show();
	            	$('#msg').text(data.responseText);
	            }
	        });
	    });
	});
</script>

<!-- START PAGE HEADING -->
<div class="app-heading app-heading-bordered app-heading-page">
    <div class="title">
        <h1><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> Deal</h1>
    </div> 
</div>
<div class="app-heading-container app-heading-bordered bottom">
    <ul class="breadcrumb">
        <li><a href="#">Application</a></li>                                                     
        <li><a href="/admin/dashboard" onclick="fnMenu('.menu-dashboard');">Dashboard</a></li>
        <li><a href="/admin/deal/deals" onclick="fnMenu('.menu-merchants');">Deals</a></li>
        <li class="active"><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> Deal</li>
    </ul>
</div>
<!-- END PAGE HEADING -->

<!-- START PAGE CONTAINER -->                    
<div class="container">
	<div class="alert alert-icon-block alert-dismissible" id="msgDiv" role="alert" style="display: none;">
        <div class="alert-icon">
            <span id="iconSpan"></span> 
        </div>
        <div id="msg"></div>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span class="fa fa-times"></span></button>
    </div>
    <!-- BASIC INPUTS -->
    <form name="dealForm" id="dealForm" class="form-horizontal" enctype="multipart/form-data">
    	<input type="hidden" name="indicator" id="indicator" value="${indicator}" />
    	<input type="hidden" name="deal_id" id="deal_id" value="${empty deal.deal_id ? '' : deal.deal_id}" />
    	<div class="block block-condensed">
    		<div class="app-heading app-heading-small"></div>
        	<div class="block-content">
        		<div class="form-group">
		            <label class="col-md-2 control-label">Name</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="required" name="deal_name" id="deal_name" value="${empty deal.deal_name ? '' : deal.deal_name}" />
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Description</label>
		            <div class="col-md-10">
		                <textarea class="form-control" name="deal_description" id="deal_description" rows="10">${empty deal.deal_description ? '' : deal.deal_description}</textarea>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Merchant</label>
 		            <div class="col-md-10">
		            	<select class="form-control" data-validation="required" name="merchant_id" id="merchant_id">
	                    	<option label="Please select" />
	                    	<c:forEach var="merchants" items="${listMerchants}">
	                    		<c:choose>
	                    			<c:when test="${not empty deal}">
		                    			<option value="${merchants.merchant_id}" ${merchants.merchant_id == deal.merchant_id ? 'selected' : ''}>${merchants.merchant_name}</option>
	                    			</c:when>
	                    			<c:otherwise>
	                   					<option value="${merchants.merchant_id}">${merchants.merchant_name}</option>
	                    			</c:otherwise>
	                    		</c:choose>
                    		</c:forEach>
	                    </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Start Date</label>
		            <div class="col-md-10">
		            	<div class="input-group bs-datepicker">
                            <input type="text" class="form-control" data-validation="required" name="deal_start_dt" id="deal_start_dt" value="${empty deal.deal_start_dt ? '' : deal.deal_start_dt}">
                            <span class="input-group-addon">
                                <span class="icon-calendar-full"></span>
                            </span>
                        </div>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">End Date</label>
		            <div class="col-md-10">
		            	<div class="input-group bs-datepicker">
                            <input type="text" class="form-control" data-validation="required" name="deal_end_dt" id="deal_end_dt" value="${empty deal.deal_end_dt ? '' : deal.deal_end_dt}">
                            <span class="input-group-addon">
                                <span class="icon-calendar-full"></span>
                            </span>
                        </div>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Category</label>
		            <div class="col-md-10">
		            	<c:forEach var="categories" items="${listCategories}" varStatus="loop">
	            			<c:choose>
                    			<c:when test="${not empty deal}">
	                    			<div class="app-checkbox"><label><input type="checkbox" class="form-control" name="deal_category" id="deal_category" value="${categories.category_id}" ${categories.category_id == category[loop.index].category_id ? 'checked' : ''} />${categories.category_name}</label></div>
                    			</c:when>
                    			<c:otherwise>
                   					<div class="app-checkbox"><label><input type="checkbox" class="form-control" name="deal_category" id="deal_category" value="${categories.category_id}" />${categories.category_name}</label></div>
                    			</c:otherwise>
                    		</c:choose>
			            </c:forEach>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Quantity (x)</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="number,required" name="deal_quantity" id="deal_quantity" value="${empty deal.deal_quantity ? 0 : deal.deal_quantity}" />
		            	<span class="help-block">Limit to <b>x</b> / no-limit</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Quantity per user</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="number,length,required" data-validation-length="max5" name="deal_quantity_user" id="deal_quantity_user" value="${empty deal.deal_quantity_user ? 0 : deal.deal_quantity_user}" />
		            	<span class="help-block">Single redemption / multiple redemption</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Location</label>
		            <div class="col-md-10">
		            	<input type="text" class="form-control" data-validation="required" name="deal_location" id="deal_location" value="${empty deal.deal_location ? '' : deal.deal_location}" />
		            	<span class="help-block">Example : Bukit Jalil, MidValley, One Utama</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Image</label>
		            <div class="col-md-10">
		            	<input type="file" class="form-control" name="deal_image" id="deal_image">   
		            </div>
		        </div>
		        <div class="form-group">
	                <label class="col-md-2 control-label">Approval Status</label>
	                <div class="col-md-10">
	                    <select class="form-control" data-validation="required" name="deal_approval_status" id="deal_approval_status">
	                    	<option label="Please select" />
	                    	<c:choose>
                    			<c:when test="${deal.deal_approval_status ne null}">
                    				<option value="Y" ${deal.deal_approval_status == 'Y' ? 'selected' : ''}>Approve</option>
	                        		<option value="N" ${deal.deal_approval_status == 'N' ? 'selected' : ''}>Reject</option>
                    			</c:when>
                    			<c:otherwise>
                    				<option value="Y">Approve</option>
	                        		<option value="N">Reject</option>
                    			</c:otherwise>
                    		</c:choose>
	                    </select>
	                </div>
	            </div>
		        <div class="form-group">
	                <label class="col-md-2 control-label">Usage Status</label>
	                <div class="col-md-10">
	                    <select class="form-control" data-validation="required" name="active" id="active">
	                    	<option label="Please select" />
	                    	<c:choose>
                    			<c:when test="${deal.active ne null}">
                    				<option value="Y" ${deal.active == 'Y' ? 'selected' : ''}>Active</option>
	                        		<option value="N" ${deal.active == 'N' ? 'selected' : ''}>Inactive</option>
                    			</c:when>
                    			<c:otherwise>
                    				<option value="Y">Active</option>
	                        		<option value="N">Inactive</option>
                    			</c:otherwise>
                    		</c:choose>
	                    </select>
	                </div>
	            </div>
		        <c:if test="${indicator == 'update'}">
		        <div class="form-group">
		            <label class="col-md-2 control-label">Registered by</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" name="inst_id" id="inst_id" value="${empty deal.inst_id ? '' : deal.inst_id}" readonly>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Registered date</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" name="inst_dtm" id="inst_dtm" value="${empty deal.inst_dtm ? '' : deal.inst_dtm}" readonly>
		            </div>
		        </div>
		        </c:if>
        	</div>
        	<div class="block-footer">
            	<a href="/admin/deal/deals" class="btn btn-default btn-clean">Back</a>
            	<button type="submit" class="btn btn-primary btn-clean" id="btnSubmitForm"><c:choose><c:when test="${indicator == 'save'}">Save</c:when><c:otherwise>Update</c:otherwise></c:choose></button>
            </div>
        </div>
    </form>
</div>