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

<style>
body {
	background-image: url('/images/pizzaBackground.jpeg');
	/* Adjust background image properties as needed */
	background-size: cover;
	background-repeat: no-repeat;
	/* Other CSS styles */
}
</style>

</head>
<body>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container-fluid">
			<div class="d-flex justify-content-between w-100">
				<a class="navbar-brand" href="/"> <img src="/images/crusty2.PNG"
					alt="CrustyMascot" width="130" height="130"
					class="d-inline-block align-text-top ms-4">

				</a> <span class="navbar-text text-white fw-bold fs-1 mt-4">Crusty's
					Pizzaria</span>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
				</ul>
				<ul class="navbar-nav">
				<!-- Needs to show how many items are in order on any page -->
					<li class="nav-item"><a class="nav-link" href="#">Order</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Account</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<h1>Account Info</h1>

	<!-- Add form that autofills current user information and shows past orders -->


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