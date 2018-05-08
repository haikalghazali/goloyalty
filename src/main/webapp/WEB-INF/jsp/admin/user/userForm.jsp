<%@ include file="/WEB-INF/jsp/taglib/taglibs.jsp" %>

<script type="text/javascript">
	$(function() {
	    $("#userForm").submit(function(e) {
	        e.preventDefault();
	        $.ajax({
                url: '/admin/user/save',
                type: 'post',
                data: $("#userForm").serialize(),
                beforeSend: function(xhr){xhr.setRequestHeader(csrfHeader, csrfToken);},
                success: function(data) {
                	$('#btnSubmitForm').hide();
	            	$('#userForm input').attr('readonly', 'readonly');
	            	$('#userForm select').attr('disabled', 'true');
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
        <h1><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> User</h1>
    </div> 
</div>
<div class="app-heading-container app-heading-bordered bottom">
    <ul class="breadcrumb">
        <li><a href="#">Application</a></li>                                                     
        <li><a href="/admin/dashboard" onclick="fnMenu('.menu-dashboard');">Dashboard</a></li>
        <li><a href="/admin/user/users" onclick="fnMenu('.menu-users');">Users</a></li>
        <li class="active"><c:choose><c:when test="${indicator == 'save'}">Register</c:when><c:otherwise>Update</c:otherwise></c:choose> User</li>
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
    <form id="userForm" class="form-horizontal">
    	<input type="hidden" name="indicator" id="indicator" value="${indicator}" />
    	<input type="hidden" name="user_id" id="user_id" value="${empty user.user_id ? '' : user.user_id}" />
    	<div class="block block-condensed">
    		<div class="app-heading app-heading-small"></div>
        	<div class="block-content">
	            <div class="form-group">
	                <label class="col-md-2 control-label">Username</label>
	                <div class="col-md-10">
	                    <input type="text" class="form-control" data-validation="required" name="username" id="username" value="${empty user.username ? '' : user.username}" ${indicator == 'save' ? '' : 'readonly'}></input>
	                </div>
	            </div>
	            <c:if test="${indicator == 'save'}">
	            <div class="form-group">
	                <label class="col-md-2 control-label">Password</label>
	                <div class="col-md-10">
	                    <input type="password" class="form-control" data-validation="length,required" data-validation-length="min5" name="password" id="password" value="${empty user.password ? '' : user.password}"></input>
	                </div>
	            </div>
	            </c:if>
	            <div class="form-group">
	                <label class="col-md-2 control-label">Firstname</label>
	                <div class="col-md-10">
	                    <input type="text" class="form-control" data-validation="required" name="firstname" id="firstname" value="${empty user.firstname ? '' : user.firstname}"></input>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-md-2 control-label">Lastname</label>
	                <div class="col-md-10">
	                    <input type="text" class="form-control" data-validation="required" name="lastname" id="lastname" value="${empty user.lastname ? '' : user.lastname}"></input>
	                </div>
	            </div>
	            <div class="form-group">
		            <label class="col-md-2 control-label">Date Of Birth</label>
		            <div class="col-md-10">
		            	<div class="input-group bs-datepicker">
                            <input type="text" class="form-control" data-validation="required" name="dob" id="dob" value="${empty user.dob ? '' : user.dob}">
                            <span class="input-group-addon">
                                <span class="icon-calendar-full"></span>
                            </span>
                        </div>
		            </div>
		        </div>
	            <div class="form-group">
	                <label class="col-md-2 control-label">Email</label>
	                <div class="col-md-10">
	                    <input type="text" class="form-control" data-validation="email,required" name="email" id="email" value="${empty user.email ? '' : user.email}"></input>
	                	<span class="help-block">Example : youremail@domain.com</span>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-md-2 control-label">Mobile Number</label>
	                <div class="col-md-10">
	                    <input type="text" class="form-control" data-validation="number,length,required" data-validation-length="min10" name="mobile" id="mobile" value="${empty user.mobile ? '' : user.mobile}"></input>
	                	<span class="help-block">Example : 0123456789</span>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-md-2 control-label">Role</label>
	                <div class="col-md-10">
	                    <select class="form-control" data-validation="required" name="role_id" id="role_id">
	                    	<option label="Please select" />
	                    	<c:forEach var="roles" items="${listRoles}">
	                    		<c:choose>
	                    			<c:when test="${not empty user}">
		                    			<option value="${roles.role_id}" ${roles.role_id == user.role_id ? 'selected' : ''}>${roles.role_name}</option>
	                    			</c:when>
	                    			<c:otherwise>
	                   					<option value="${roles.role_id}">${roles.role_name}</option>
	                    			</c:otherwise>
	                    		</c:choose>
                    		</c:forEach>
	                    </select>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-md-2 control-label">Status</label>
	                <div class="col-md-10">
	                    <select class="form-control" data-validation="required" name="active" id="active">
	                    	<option label="Please select" />
	                    	<c:choose>
                    			<c:when test="${user.active ne null}">
                    				<option value="Y" ${user.active == 'Y' ? 'selected' : ''}>Active</option>
	                        		<option value="N" ${user.active == 'N' ? 'selected' : ''}>Inactive</option>
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
	                    <input type="text" class="form-control" name="inst_id" id="inst_id" value="${empty user.inst_id ? '' : user.inst_id}" readonly></input>
	                </div>
	            </div>
	            <div class="form-group">
	                <label class="col-md-2 control-label">Registered date</label>
	                <div class="col-md-10">
	                    <input type="text" class="form-control" name="inst_dtm" id="inst_dtm" value="${empty user.inst_dtm ? '' : user.inst_dtm}" readonly></input>
	                </div>
	            </div>
	            </c:if>
	        </div>
            <div class="block-footer">
            	<a href="/admin/user/users" class="btn btn-default btn-clean">Back</a>
            	<button type="submit" class="btn btn-primary btn-clean" id="btnSubmitForm"><c:choose><c:when test="${indicator == 'save'}">Save</c:when><c:otherwise>Update</c:otherwise></c:choose></button>
            </div>
    	</div>
    </form>
    <!-- END BASIC INPUTS -->    
</div>