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
   <form:form action="/login" method="post" modelAttribute="newLogin" class="p-5 m-5 bg-primary border rounded-5 shadow">
		<h2>Login</h2>
		<div class="form-group row">
			<form:label path="email" class="col-sm-2 col-form-label">Email: </form:label>
			<form:errors path="email" class="text-danger"></form:errors>
			<form:input	path="email" class="form-control"/>
		</div>
		<div class="form-group row">
			<form:label path="password" class="col-sm-2 col-form-label">Password: </form:label>
			<form:errors path="password" class="text-danger"></form:errors>
			<form:input	path="password" class="form-control"/>
		</div>
		<div class="d-flex justify-content-end">
			<input type=submit class="btn btn-secondary my-3" value="Submit"/>
		</div>
	</form:form>
	<a href="/register"><button>Register</button></a>
</body>
</html>