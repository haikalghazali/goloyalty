<%@ include file="/WEB-INF/jsp/taglib/taglibs.jsp" %>

<script type="text/javascript">
	$(function() {
	    $("#merchantForm").submit(function(e) {
	        e.preventDefault();
	        $.ajax({
	            url: '/admin/merchant/save',
	            type: 'post',
	            data: $("#merchantForm").serialize(),
	            beforeSend: function(xhr){xhr.setRequestHeader(csrfHeader, csrfToken);},
	            success: function(data) {
	            	$('#btnSubmitForm').hide();
	            	$('#merchantForm input').attr('readonly', 'readonly');
	            	$('#merchantForm select').attr('disabled', 'true');
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
        <h1><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> Merchant</h1>
    </div> 
</div>
<div class="app-heading-container app-heading-bordered bottom">
    <ul class="breadcrumb">
        <li><a href="#">Application</a></li>                                                     
        <li><a href="/admin/dashboard" onclick="fnMenu('.menu-dashboard');">Dashboard</a></li>
        <li><a href="/admin/merchant/merchants" onclick="fnMenu('.menu-merchants');">Merchants</a></li>
        <li class="active"><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> Merchant</li>
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
    <form id="merchantForm" class="form-horizontal">
    	<input type="hidden" name="indicator" id="indicator" value="${indicator}" />
    	<input type="hidden" name="merchant_id" id="merchant_id" value="${empty merchant.merchant_id ? '' : merchant.merchant_id}" />
    	<div class="block block-condensed">
    		<div class="app-heading app-heading-small"></div>
        	<div class="block-content">
        		<div class="form-group">
		            <label class="col-md-2 control-label">Merchant Name</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="required" name="merchant_name" id="merchant_name" value="${empty merchant.merchant_name ? '' : merchant.merchant_name}" />
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Company No.</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="required" name="company_no" id="company_no" value="${empty merchant.company_no ? '' : merchant.company_no}" />
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Representative name</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="required" name="representative_name" id="representative_name" value="${empty merchant.representative_name ? '' : merchant.representative_name}" /></div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Representative email</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="email,required" name="representative_email" id="representative_email" value="${empty merchant.representative_email ? '' : merchant.representative_email}" />
		                <span class="help-block">Example : youremail@domain.com</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Representative mobile</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="number,length,required" data-validation-length="min10" name="representative_mobile" id="representative_mobile" value="${empty merchant.representative_mobile ? '' : merchant.representative_mobile}" />
		                <span class="help-block">Example : 0123456789</span>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Address</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="required" name="address" id="address" value="${empty merchant.address ? '' : merchant.address}" />
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Postcode</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="number,length,required" data-validation-length="max5" name="postcode" id="postcode" value="${empty merchant.postcode ? '' : merchant.postcode}" />
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">State</label>
		            <div class="col-md-10">
		            	<select class="form-control" data-validation="required" name="state" id="state">
	                    	<option label="Please select" />
	                    	<c:choose>
                    			<c:when test="${merchant.state ne null}">
                    				<option value="01" ${merchant.state == '01' ? 'selected' : ''}>Johor</option>
	                        		<option value="02" ${merchant.state == '02' ? 'selected' : ''}>Kedah</option>
	                        		<option value="03" ${merchant.state == '03' ? 'selected' : ''}>Kelantan</option>
	                        		<option value="04" ${merchant.state == '04' ? 'selected' : ''}>Melaka</option>
	                        		<option value="05" ${merchant.state == '05' ? 'selected' : ''}>Negeri Sembilan</option>
	                        		<option value="06" ${merchant.state == '06' ? 'selected' : ''}>Pahang</option>
	                        		<option value="07" ${merchant.state == '07' ? 'selected' : ''}>Perak</option>
	                        		<option value="08" ${merchant.state == '08' ? 'selected' : ''}>Perlis</option>
	                        		<option value="09" ${merchant.state == '09' ? 'selected' : ''}>Pulau Pinang</option>
	                        		<option value="10" ${merchant.state == '10' ? 'selected' : ''}>Sabah</option>
	                        		<option value="11" ${merchant.state == '11' ? 'selected' : ''}>Sarawak</option>
	                        		<option value="12" ${merchant.state == '12' ? 'selected' : ''}>Selangor</option>
	                        		<option value="13" ${merchant.state == '13' ? 'selected' : ''}>Terengganu</option>
	                        		<option value="14" ${merchant.state == '14' ? 'selected' : ''}>Wilayah Persekutuan Kuala Lumpur</option>
	                        		<option value="15" ${merchant.state == '15' ? 'selected' : ''}>Wilayah Persekutuan Labuan</option>
	                        		<option value="16" ${merchant.state == '16' ? 'selected' : ''}>Wilayah Persekutuan Putrajaya</option>
                    			</c:when>
                    			<c:otherwise>
                    				<option value="01">Johor</option>
	                        		<option value="02">Kedah</option>
	                        		<option value="03">Kelantan</option>
	                        		<option value="04">Melaka</option>
	                        		<option value="05">Negeri Sembilan</option>
	                        		<option value="06">Pahang</option>
	                        		<option value="07">Perak</option>
	                        		<option value="08">Perlis</option>
	                        		<option value="09">Pulau Pinang</option>
	                        		<option value="10">Sabah</option>
	                        		<option value="11">Sarawak</option>
	                        		<option value="12">Selangor</option>
	                        		<option value="13">Terengganu</option>
	                        		<option value="14">Wilayah Persekutuan Kuala Lumpur</option>
	                        		<option value="15">Wilayah Persekutuan Labuan</option>
	                        		<option value="16">Wilayah Persekutuan Putrajaya</option>
                    			</c:otherwise>
                    		</c:choose>
	                    </select>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Country</label>
		            <div class="col-md-10">
		            	<select class="form-control" data-validation="required" name="country" id="country">
	                    	<option label="Please select" />
	                    	<c:choose>
                    			<c:when test="${merchant.country ne null}">
                    				<option value="MY" ${merchant.country == 'MY' ? 'selected' : ''}>Malaysia</option>
	                        		<option value="KR" ${merchant.country == 'KR' ? 'selected' : ''}>Korea</option>
                    			</c:when>
                    			<c:otherwise>
                    				<option value="MY">Malaysia</option>
	                        		<option value="KR">Korea</option>
                    			</c:otherwise>
                    		</c:choose>
	                    </select>
		            </div>
		        </div>
		        <div class="form-group">
	                <label class="col-md-2 control-label">Status</label>
	                <div class="col-md-10">
	                    <select class="form-control" data-validation="required" name="active" id="active">
	                    	<option label="Please select" />
	                    	<c:choose>
                    			<c:when test="${merchant.active ne null}">
                    				<option value="Y" ${merchant.active == 'Y' ? 'selected' : ''}>Active</option>
	                        		<option value="N" ${merchant.active == 'N' ? 'selected' : ''}>Inactive</option>
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
		                <input type="text" class="form-control" name="inst_id" id="inst_id" value="${empty merchant.inst_id ? '' : merchant.inst_id}" readonly>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Registered date</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" name="inst_dtm" id="inst_dtm" value="${empty merchant.inst_dtm ? '' : merchant.inst_dtm}" readonly>
		            </div>
		        </div>
		        </c:if>
        	</div>
        	<div class="block-footer">
            	<a href="/admin/merchant/merchants" class="btn btn-default btn-clean">Back</a>
            	<button type="submit" class="btn btn-primary btn-clean" id="btnSubmitForm"><c:choose><c:when test="${indicator == 'save'}">Save</c:when><c:otherwise>Update</c:otherwise></c:choose></button>
            </div>
        </div>
    </form>
</div>