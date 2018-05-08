<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>GoLoyalty</title>
	
	<!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/css/form-validation.css" rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container">
      	<div class="py-5 text-center">
        	<img class="d-block mx-auto mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
        	<h2>Registration form</h2>
        	<p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>
      	</div>
      	<div class="row">
        	<div class="col-md-4 order-md-2 mb-4">
          		
        	</div>
        	<div class="col-md-8 order-md-1">
          		<h4 class="mb-3">User Detail</h4>
          		<form:form method="post" modelAttribute="registerForm" class="needs-validation" novalidate="novalidate">
            		<div class="row">
              			<div class="col-md-6 mb-3">
                			<label for="firstname">First name</label>
                				<form:input type="text" class="form-control" path="firstname" placeholder="" value="" required="required"></form:input>
                			<div class="invalid-feedback">Valid first name is required.</div>
              			</div>
              			<div class="col-md-6 mb-3">
                			<label for="lastname">Last name</label>
                			<form:input type="text" class="form-control" path="lastname" placeholder="" value="" required="required"></form:input>
               				<div class="invalid-feedback">Valid last name is required.</div>
              			</div>
            		</div>
		            <div class="mb-3">
		              	<label for="username">Username</label>
		              	<div class="input-group">
		                	<div class="input-group-prepend">
		                  		<span class="input-group-text">@</span>
		                	</div>
		                	<form:input type="text" class="form-control" path="username" placeholder="Username" required="required"></form:input>
		                	<div class="invalid-feedback" style="width: 100%;">Your username is required.</div>
		              	</div>
		            </div>
		            <div class="mb-3">
		              	<label for="password">Password</label>
		              	<div class="input-group">
		                	<form:input type="password" class="form-control" path="password" placeholder="" required="required"></form:input>
		                	<div class="invalid-feedback" style="width: 100%;">Your password is required.</div>
		              	</div>
		            </div>
		            <div class="row">
	            		<div class="col-md-6 mb-3">
	              			<label for="email">Email <span class="text-muted">(Optional)</span></label>
	              			<form:input type="email" class="form-control" path="email" placeholder="you@example.com"></form:input>
	              			<div class="invalid-feedback">Valid email address is required.</div>
	            		</div>
	            		<div class="col-md-6 mb-3">
	              			<label for="mobile">Mobile <span class="text-muted">(Optional)</span></label>
	              			<form:input type="text" class="form-control" path="mobile" placeholder="0122065971"></form:input>
	              			<div class="invalid-feedback">Valid mobile is required.</div>
	            		</div>
		            </div>
		            <hr class="mb-4">
		            <button class="btn btn-primary btn-lg btn-block" type="submit">Register</button>
	          	</form:form>
	        </div>
      	</div>
      	<footer class="my-5 pt-5 text-muted text-center text-small">
        	<p class="mb-1">&copy; 2017-2018 Company Name</p>
        	<ul class="list-inline">
	          	<li class="list-inline-item"><a href="#">Privacy</a></li>
	          	<li class="list-inline-item"><a href="#">Terms</a></li>
	          	<li class="list-inline-item"><a href="#">Support</a></li>
        	</ul>
      	</footer>
   	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../../../assets/js/vendor/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="../../../../assets/js/vendor/holder.min.js"></script>
    <script>
     	// Example starter JavaScript for disabling form submissions if there are invalid fields
      	(function() {
        	'use strict';
        	window.addEventListener('load', function() {
          		// Fetch all the forms we want to apply custom Bootstrap validation styles to
          		var forms = document.getElementsByClassName('needs-validation');

          		// Loop over them and prevent submission
          		var validation = Array.prototype.filter.call(forms, function(form) {
            		form.addEventListener('submit', function(event) {
              			if (form.checkValidity() === false) {
                			event.preventDefault();
                			event.stopPropagation();
              			}
              			form.classList.add('was-validated');
            		}, false);
          		});
        	}, false);
      	})();
    </script>
</body>
</html>