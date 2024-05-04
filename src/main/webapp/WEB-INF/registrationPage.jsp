<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pizza</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
   <form:form action="/register" method="post" modelAttribute="newUser" class="p-5 m-5 bg-danger border rounded-5 shadow">
		<h2>Register</h2>
		<div class="form-group row">
			<form:label path="firstName" class="col-sm-2 col-form-label">First Name: </form:label>
			<form:errors path="firstName" class="text-danger"></form:errors>
			<form:input	path="firstName" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="lastName" class="col-sm-2 col-form-label">Last Name: </form:label>
			<form:errors path="lastName" class="text-danger"></form:errors>
			<form:input	path="lastName" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="email" class="col-sm-2 col-form-label">Email: </form:label>
			<form:errors path="email" class="text-danger"></form:errors>
			<form:input type="email"	path="email" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="address" class="col-sm-2 col-form-label">Address: </form:label>
			<form:errors path="address" class="text-danger"></form:errors>
			<form:input	path="address" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="city" class="col-sm-2 col-form-label">City: </form:label>
			<form:errors path="city" class="text-danger"></form:errors>
			<form:input	path="city" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="state" class="col-sm-2 col-form-label">State: </form:label>
			<form:errors path="state" class="text-danger"></form:errors>
			<form:input	path="state" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="password" class="col-sm-2 col-form-label">Password: </form:label>
			<form:errors path="password" class="text-danger"></form:errors>
			<form:input	type="password" path="password" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="confirm" class="col-sm-2 col-form-label">Confirm: </form:label>
			<form:errors path="confirm" class="text-danger"></form:errors>
			<form:input type="password" path="confirm" class="form-control"/>
		</div>
		<div class="d-flex justify-content-end">
			<input type=submit class="btn btn-secondary my-3" value="Submit"/>
		</div>
	</form:form>
	<a href="/login"><button>Login</button></a>
</body>
</html>