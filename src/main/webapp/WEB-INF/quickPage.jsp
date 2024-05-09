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
<title>Pizza</title>
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

.card-body {
	background-color: rgba(0, 0, 0, 0.5);
	/* Set a semi-transparent background color for the card body */
	color: white; /* Set text color to white */
	position: absolute; /* Position the card body */
	bottom: 0; /* Align the card body to the bottom */
	left: 0;
	width: 100%; /* Make the card body cover the entire card */
	padding: 1rem;
}

.custom-heading {
	font-size: 7rem; /* Adjust as needed */
	font-weight: 700; /* Adjust as needed */
}

#titleName, h1, h2 {
	font-family: "Titan One", sans-serif;
}

.actionButtons {
	margin-left: 35%;
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

				</a> <span id="titleName"
					class="navbar-text text-white fw-bold fs-1 mt-4">Crusty's
					Pizzaria</span>
				<ul class="navbar-nav mt-4 me-3">
					<li class="nav-item"><a class="m-2 nav-link btn fs-5" href="/">Home</a></li>
					<!-- Needs to show how many items are in order on any page -->
					<li class="nav-item"><a class="m-2 nav-link btn fs-5"
						href="/orderSum/${userId}">Order</a></li>

					<li class="nav-item"><a class="m-2 nav-link btn fs-5"
						href="/account/${userId}">Account</a></li>

					<li class="nav-item"><a class="m-2 nav-link btn fs-5"
						href="/logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<h1 class="custom-heading text-center mt-5">Crusty's Classics</h1>
	<div class="d-flex flex-column align-items-center">
		<h2 class="text-center m-5">Pick from one of our signature Pies
			or create your own!</h2>
		<!-- 		<a class=" btn btn-danger" href="/createPizza">Create Your Own</a> -->
	</div>
	<div class="row row-cols-lg-3 g-4 m-5 pb-5 mb-5">
		<div class="col">
			<div class="card">
				<img src="/images/Slice_cheese.png" class="card-img-top" alt="...">
				<div class="card-body">
					<a href="/createPizza" class="btn btn-danger actionButtons">NEW
						ORDER</a>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<img src="/images/slice_chicken.png" class="card-img-top" alt="...">
				<div class="card-body">
					<a href="/orderSum/${favPizza}"
						class="btn btn-danger actionButtons">RE-ORDER MY FAVE</a>

				</div>
			</div>
		</div>

		<div class="col">
			<div class="card">
				<img src="/images/slice_plainasspep.png" class="card-img-top"
					alt="...">
				<div class="card-body">
					<a href="/orderSum/${randomPizza}"
						class="btn btn-danger actionButtons">SURPRISE ME</a>

				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-4 mt-5 pt-5">
		<div class="container-fluid">
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