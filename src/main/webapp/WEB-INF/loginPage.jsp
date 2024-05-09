<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Crusty's Pizzaria</title>
<link rel="icon" type="image/crusty2.PNG" href="/images/crusty2.PNG">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/app.js"></script>
<!-- change to match your file/naming structure -->
<!-- Google fonts links -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Titan+One&display=swap"
	rel="stylesheet">

<style>
body {
	background-image: url('/images/pizzaBackground.jpeg');
	/* Adjust background image properties as needed */
	background-size: cover;
	background-repeat: no-repeat;
	/* Other CSS styles */
}

#titleName, h2 {
	font-family: "Titan One", sans-serif;
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container-fluid">
			<div class="d-flex justify-content-between w-100">
				<a class="navbar-brand" href="/"> <img src="/images/crusty2.PNG"
					alt="CrustyMascot" width="130" height="130"
					class="d-inline-block align-text-top ms-4">

				</a> <span id="titleName"
					class="navbar-text text-white fw-bold fs-1 mt-4">Crusty's
					Pizzaria</span>
				<ul class="navbar-nav mt-5 me-3">
					<li class="nav-item"><a class="nav-link btn btn-danger px-4"
						href="#">Login</a></li>
					<!-- 	add in accountPage.jsp route here -->

				</ul>
			</div>
		</div>
	</nav>

	<div class="container-sm">
		<div class="row justify-content-center">
			<div class="col-sm-8">
				<form:form action="/login" method="post" modelAttribute="newLogin"
					class="p-5 m-5">
					<h2 class="text-dark fs-1 fw-bold">Login</h2>
					<div class="form-group row">
						<form:label path="email"
							class="col-sm-2 col-form-label fs-4 fw-bold">Email: </form:label>
						<form:errors path="email" class="text-danger"></form:errors>
						<form:input path="email" class="form-control" />
					</div>
					<div class="form-group row">
						<form:label path="password"
							class="col-sm-2 col-form-label fs-4 fw-bold">Password: </form:label>
						<form:errors path="password" class="text-danger"></form:errors>
						<form:input path="password" class="form-control" type="password" />
					</div>
					<div class="d-flexform-group text-righ">
						<input type=submit
							class="btn btn-danger btn-lg mt-2 mt-4 px-3 mb-3" value="Submit" />
					</div>
					<div class="pt-3 ">
						<a href="/register" class="text-danger fs-4 fw-bold pt-5">Don't
							Have an Account? Register</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-4 mt-5 fixed-bottom">
		<div class="container">
			<p>&copy; 2024 Crusty's Pizzaria. All rights reserved.</p>
			<!-- Facebook and Instagram icons -->
			<div>
				<a href="#" target="_blank" class="text-dark mx-2"> <img
					src="/images/fb.PNG" alt="Facebook" width="30" height="30">
				</a> <a href="#" target="_blank" class="text-dark mx-2"> <img
					src="/images/ig.PNG" alt="Instagram" width="30" height="30">
				</a>
			</div>
		</div>
	</footer>
	<!-- End of Footer -->


</body>
</html>