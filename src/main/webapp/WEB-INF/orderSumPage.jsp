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
		
		#titleName, h1 {
	
		font-family:"Titan One", sans-serif;

		}
		
		h4{
		font-weight: bold;
		
		}
		
		.items{
		
		color: red;
		font-family:"Titan one", sans-serif;
		text-transform: uppercase;
		margin-left: 10px;
		
		}
		
		h3{
		text-align: right;
		margin-top: 30px;
		font-family:"Titan one", sans-serif;
		
		}
		
		.buttons {
		
		margin-top: 20px;
		
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
				<ul class="navbar-nav">
					<li class="nav-item"><a class="m-2 nav-link btn" href="/quickPage">Home</a></li>
					<!-- Needs to show how many items are in order on any page -->
					<li class="nav-item"><a class="m-2 nav-link btn" href="/orderSum/${userId}">Order</a></li>
					
					<li class="nav-item"><a class="m-2 nav-link btn" href="/account/${userId}">Account</a></li>
			
					<li class="nav-item"><a class="m-2 nav-link btn" href="/logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
<div class="container"> 

	<h1 style="margin-left: 30%; margin-top: 10%;">Your Order Summary</h1>
	
		<div class="container" style="margin-left: 30%; margin-top:5%;
		width: 40%;">
			
			<h4>METHOD: <span class="items">${pizza.getDeliveryMethod()}</span></h4>
			<h4>QTY: <span class="items">${pizza.getQuantity()}</span></h4>
			<h4>SIZE: <span class="items">${pizza.getSize()}</span> </h4>
			<h4>CRUST: <span class="items">${pizza.getCrust()}</span></h4>
			<h4>TOPPINGS: <span class="items">${pizza.getToppings()}</span></h4>
			<c:set var="tax" value="0.1"/>
			<c:set var="price" value="10.00"/>
			<c:if test="${pizza.size == 'Small'}">
				<h3>PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </h3>
				<p style="width: 100%; font-weight: bold;">______________________________________________________</p>
			
				<h3> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></h3>
			</c:if>
			<c:set var="price" value="12.00"/>
			<c:if test="${pizza.size == 'Medium'}">
				<h3>PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </h3>
				<p style="width: 100%; font-weight: bold;">______________________________________________________</p>
			
				<h3> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></h3>
			</c:if>
			<c:set var="price" value="14.00"/>
			<c:if test="${pizza.size == 'Large'}">
				<h3>PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </h3>
				<p style="width: 100%; font-weight: bold;">______________________________________________________</p>
			
				<h3> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></h3>
			</c:if>
			<c:set var="price" value="16.00"/>
			<c:if test="${pizza.size == 'X-Large'}">
				<h3>PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </h3>
				<p style="width: 100%; font-weight: bold;">______________________________________________________</p>
			
				<h3> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></h3>
			</c:if>
			<p style="width: 100%; font-weight: bold;">______________________________________________________</p>
				
				<div class="container buttons">
				
				<a href="/deletePizza/${pizza.getId()}" class="btn btn-danger" style="margin-right: 40px; width: 200px;
				 box-shadow: 8px 8px black">START OVER</a>
				<a href="/account/${pizza.getUser().getId()}" class="btn btn-success" style="width: 200px; box-shadow: 8px 8px black">PLACE ORDER</a>
				
				
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