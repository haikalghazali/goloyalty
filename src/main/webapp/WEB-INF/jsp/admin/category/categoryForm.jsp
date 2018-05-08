<%@ include file="/WEB-INF/jsp/taglib/taglibs.jsp" %>

<script type="text/javascript">
	$(function() {
	    $("#categoryForm").submit(function(e) {
	        e.preventDefault();
	        $.ajax({
	            url: '/admin/category/save',
	            type: 'post',
	            data: $("#categoryForm").serialize(),
	            beforeSend: function(xhr){xhr.setRequestHeader(csrfHeader, csrfToken);},
	            success: function(data) {
	            	$('#btnSubmitForm').hide();
	            	$('#categoryForm input').attr('readonly', 'readonly');
	            	$('#categoryForm select').attr('disabled', 'true');
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
        <h1><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> Category</h1>
    </div> 
</div>
<div class="app-heading-container app-heading-bordered bottom">
    <ul class="breadcrumb">
        <li><a href="#">Application</a></li>                                                     
        <li><a href="/admin/dashboard" onclick="fnMenu('.menu-dashboard');">Dashboard</a></li>
        <li><a href="/admin/category/categories" onclick="fnMenu('.menu-categories');">Categories</a></li>
        <li class="active"><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> Category</li>
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
    <form id="categoryForm" class="form-horizontal">
    	<input type="hidden" name="indicator" id="indicator" value="${indicator}" />
    	<input type="hidden" name="category_id" id="category_id" value="${empty category.category_id ? '' : category.category_id}" />
    	<div class="block block-condensed">
    		<div class="app-heading app-heading-small"></div>
        	<div class="block-content">
        		<div class="form-group">
		            <label class="col-md-2 control-label">Category Name</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" data-validation="required" name="category_name" id="category_name" value="${empty category.category_name ? '' : category.category_name}" />
		            </div>
		        </div>
		        <div class="form-group">
	                <label class="col-md-2 control-label">Status</label>
	                <div class="col-md-10">
	                    <select class="form-control" data-validation="required" name="active" id="active">
	                    	<option label="Please select" />
	                    	<c:choose>
                    			<c:when test="${category.active ne null}">
                    				<option value="Y" ${category.active == 'Y' ? 'selected' : ''}>Active</option>
	                        		<option value="N" ${category.active == 'N' ? 'selected' : ''}>Inactive</option>
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
		                <input type="text" class="form-control" name="inst_id" id="inst_id" value="${empty category.inst_id ? '' : category.inst_id}" readonly>
		            </div>
		        </div>
		        <div class="form-group">
		            <label class="col-md-2 control-label">Registered date</label>
		            <div class="col-md-10">
		                <input type="text" class="form-control" name="inst_dtm" id="inst_dtm" value="${empty category.inst_dtm ? '' : category.inst_dtm}" readonly>
		            </div>
		        </div>
		        </c:if>
        	</div>
        	<div class="block-footer">
            	<a href="/admin/category/categories" class="btn btn-default btn-clean">Back</a>
            	<button type="submit" class="btn btn-primary btn-clean" id="btnSubmitForm"><c:choose><c:when test="${indicator == 'save'}">Save</c:when><c:otherwise>Update</c:otherwise></c:choose></button>
            </div>
        </div>
    </form>
</div>