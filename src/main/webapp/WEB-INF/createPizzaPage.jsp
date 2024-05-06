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
		
		
		label{
		
		font-weight: bold;
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

	<!-- Add form that Fills requirements for a pizza -->
	<div class="container" style="width: 35%; margin-top: 10%">
	
		<h1 style="text-align: center"> CRAFT - A - PIZZA</h1>
				<div class="container" style="border: solid black 8px; width: 100%; border-radius: 15px; padding: 20px;" >
				
				<form:form action="/newPizza" method="POST" modelAttribute="newPizza">
				<form:input type="hidden" path="user" value="${user.getId()}"></form:input>
				
				<div class="container" id="topForm" style="display: flex;" >
				
					<form:label path="deliveryMethod" style="margin-right: 10px">METHOD: </form:label>
					<form:select path="deliveryMethod" class="form-select" style="border: black solid 2px;">
					
						<form:option value="Carry Out" path="deliveryMethod"></form:option>
						
						<form:option value="Delivery" path="deliveryMethod"></form:option>
					
					</form:select>
					
				</div>
				
				
				<div class="container" id="topFormTwo" style="display: flex; justify-content: space-between; 
				width: 100%; margin-top: 10px; ">
				
					<form:label path="size">SIZE: </form:label>
					<form:select path="size" class="form-select" style="width: 200px; border: black solid 2px;">
					
						<form:option value="X-Large" path="size"></form:option>
						
						<form:option value="Large" path="size"></form:option>
						
						<form:option value="Medium" path="size"></form:option>
						
						<form:option value="Small" path="size"></form:option>
					
					</form:select>	
					
					
					
					<form:label path="crust">CRUST: </form:label>
					<form:select path="crust" class="form-select" style="width: 200px; border: black solid 2px;">
					
						<form:option value="Thin crust" path="crust"></form:option>
						
						<form:option value="Regular crust" path="crust"></form:option>
						
						<form:option value="Deep Dish" path="crust"></form:option>
						
						<form:option value="Stuffed Crust" path="crust"></form:option>
					
					</form:select>	
					
					
					<form:label path="quantity">QTY: </form:label>
						<form:input type="number" min="1" max="100" path="quantity" style="border: black solid 2px;"></form:input>
					
				
				
				</div>
				
				<label style="margin-left: 10px;"> TOPPINGS:</label>
					
				<div class="container" style="border: solid black 5px; height: 150px; width: 80%; 
				flex-wrap: wrap; flex-direction: column; overflow-y:auto; align-content: flex-start; 
				column-count: 4; margin-left: 15%; padding: 10px; border-radius: 5px;">
				
						
							<div class="container" id="toppingsBoxes" >
							
						
									
									<c:forEach var="top" items="${pizzaTops}">
								
										
										
											
											<input type="checkbox" name="toppings" value="${top}" path="toppings">
											  <label for="toppings" path="toppings" > <c:out value="${top}"></c:out></label><br>
											
											
									
									</c:forEach>
								
							
							
							
							</div>
					
					
					
				</div>
				
				<button class="btn btn-danger" style="width: 100%; margin-top: 10px; border: black inset 5px; 
				box-shadow: 8px 8px black">ADD TO ORDER</button>
									
											
										
					</form:form>
		
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
