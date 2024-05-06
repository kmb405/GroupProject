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
<link href="https://fonts.googleapis.com/css2?family=Titan+One&display=swap" rel="stylesheet">

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

.titan-one-regular {
  font-family: "Titan One", sans-serif;
  font-weight: 400;
  font-style: normal;
}

#titleName, h1 {
	
	font-family:"Titan One", sans-serif;
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

				</a> <span id="titleName" class="navbar-text text-white fw-bold fs-1 mt-4">Crusty's
					Pizzaria</span>
				<ul class="navbar-nav mt-5 me-3">
					<li class="nav-item"><a class="nav-link btn btn-danger"
						href="/register">Order Now</a></li>

				</ul>
			</div>
		</div>
	</nav>


	<h1 class="custom-heading text-center mt-5">Crusty's Classics</h1>

	<div class="row row-cols-1 row-cols-md-2 g-4 mt-5">
		<div class="col">
			<div class="card">
				<img src="/images/Slice_cheese.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Cheese with Fresh Basil</h5>
					<p class="card-text">Our Classic Cheese Pizza. Subtly flavored
						with fresh Basil leaves.</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<img src="/images/slice_chicken.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Buffalo Chicken</h5>
					<p class="card-text">Our Special Buffalo sauce with just the
						right blend of cheeses.</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<img src="/images/slice_Mushroom.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Mushroom with Roasted Garlic</h5>
					<p class="card-text">Mushrooms with a perfect Sprinkling of
						Roasted Garlic.</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card">
				<img src="/images/slice_plainasspep.png" class="card-img-top"
					alt="...">
				<div class="card-body">
					<h5 class="card-title">Pepperoni Pizza</h5>
					<p class="card-text">One of our Favorites with the perfect
						amount of Pepperoni sprinkled with Parmesan Cheese.</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="bg-dark text-white text-center py-4 mt-5">
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