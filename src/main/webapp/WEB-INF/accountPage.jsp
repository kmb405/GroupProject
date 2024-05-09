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

#titleName, h1, h2 {
	font-family: "Titan One", sans-serif;
}

h4, h5 {
	font-family: "Titan One", sans-serif;
	color: red;
}

h5 {
	border-bottom: 3px solid black;
}

.prices {
	font-weight: bold;
	font-size: 20px;
	margin-bottom: 5px;
	text-align: right;
}


.footer-container {
    width: 100%;
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
				<ul class="navbar-nav mt-4">
					<li class="nav-item"><a class="m-2 nav-link btn fs-5"
						href="/quickPage">Home</a></li>
					<!-- Needs to show how many items are in order on any page -->

					<li class="nav-item"><a class="m-2 nav-link btn fs-5"
						href="/orderSum/${userId}">Order</a></li>

					<!-- 	<li class="nav-item"><a class="m-2 nav-link btn"
						href="/createPizza">Order</a></li> -->


					<li class="nav-item"><a class="m-2 nav-link btn fs-5"
						href="/account/${userId}">Account</a></li>

					<li class="nav-item"><a class="m-2 nav-link btn fs-5"
						href="/logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>



	<!-- Add form that autofills current user information and shows past orders -->
	<div class="row">
		<div class="col m-5">
			<h1>Account Info</h1>
			<form:form action="/editUser" method="post" modelAttribute="editUser"
				class="col p-5 m-2 ">
				<input type="hidden" name="_method" value="put">
				<form:input path="id" hidden="hidden" value="${user.id}" />
				<div class="form-group row">
					<form:label path="firstName" class=" col-form-label fs-4 fw-bold">First Name: </form:label>
					<form:errors path="firstName" class="text-danger"></form:errors>
					<form:input path="firstName" class="form-control"
						value="${user.firstName}" />
				</div>
				<div class="form-group row">
					<form:label path="lastName" class="col-form-label fs-4 fw-bold">Last Name: </form:label>
					<form:errors path="lastName" class="text-danger"></form:errors>
					<form:input path="lastName" class="form-control"
						value="${user.lastName}" />
				</div>
				<div class="form-group row">
					<form:label path="email" class="col-form-label fs-4 fw-bold">Email: </form:label>
					<form:errors path="email" class="text-danger"></form:errors>
					<form:input type="email" path="email" class="form-control"
						value="${user.email}" />
				</div>
				<div class="form-group row">
					<form:label path="address" class="col-form-label fs-4 fw-bold">Address: </form:label>
					<form:errors path="address" class="text-danger"></form:errors>
					<form:input path="address" class="form-control"
						value="${user.address}" />
				</div>
				<div class="form-group row">
					<form:label path="city" class="col-form-label fs-4 fw-bold">City: </form:label>
					<form:errors path="city" class="text-danger"></form:errors>
					<form:input path="city" class="form-control" value="${user.city}" />
				</div>
				<div class="form-group row">
					<form:label path="state"
						class="col-sm-2 col-form-label fs-4 fw-bold ms-2 ps-0">State: </form:label>
					<form:errors path="state" class="text-danger"></form:errors>
					<div class="col-sm-10 ps-0">
						<form:select path="state" class="form-control ps-0"
							value="${user.state}">
							<form:option value="">${user.state}</form:option>
							<form:option value="AL">Alabama</form:option>
							<form:option value="AK">Alaska</form:option>
							<form:option value="AZ">Arizona</form:option>
							<form:option value="AR">Arkansas</form:option>
							<form:option value="CA">California</form:option>
							<form:option value="CO">Colorado</form:option>
							<form:option value="CT">Connecticut</form:option>
							<form:option value="DE">Delaware</form:option>
							<form:option value="DC">District Of Columbia</form:option>
							<form:option value="FL">Florida</form:option>
							<form:option value="GA">Georgia</form:option>
							<form:option value="HI">Hawaii</form:option>
							<form:option value="ID">Idaho</form:option>
							<form:option value="IL">Illinois</form:option>
							<form:option value="IN">Indiana</form:option>
							<form:option value="IA">Iowa</form:option>
							<form:option value="KS">Kansas</form:option>
							<form:option value="KY">Kentucky</form:option>
							<form:option value="LA">Louisiana</form:option>
							<form:option value="ME">Maine</form:option>
							<form:option value="MD">Maryland</form:option>
							<form:option value="MA">Massachusetts</form:option>
							<form:option value="MI">Michigan</form:option>
							<form:option value="MN">Minnesota</form:option>
							<form:option value="MS">Mississippi</form:option>
							<form:option value="MO">Missouri</form:option>
							<form:option value="MT">Montana</form:option>
							<form:option value="NE">Nebraska</form:option>
							<form:option value="NV">Nevada</form:option>
							<form:option value="NH">New Hampshire</form:option>
							<form:option value="NJ">New Jersey</form:option>
							<form:option value="NM">New Mexico</form:option>
							<form:option value="NY">New York</form:option>
							<form:option value="NC">North Carolina</form:option>
							<form:option value="ND">North Dakota</form:option>
							<form:option value="OH">Ohio</form:option>
							<form:option value="OK">Oklahoma</form:option>
							<form:option value="OR">Oregon</form:option>
							<form:option value="PA">Pennsylvania</form:option>
							<form:option value="RI">Rhode Island</form:option>
							<form:option value="SC">South Carolina</form:option>
							<form:option value="SD">South Dakota</form:option>
							<form:option value="TN">Tennessee</form:option>
							<form:option value="TX">Texas</form:option>
							<form:option value="UT">Utah</form:option>
							<form:option value="VT">Vermont</form:option>
							<form:option value="VA">Virginia</form:option>
							<form:option value="WA">Washington</form:option>
							<form:option value="WV">West Virginia</form:option>
							<form:option value="WI">Wisconsin</form:option>
							<form:option value="WY">Wyoming</form:option>
						</form:select>



			<form:form action="/editUser" method="post" modelAttribute="editUser" class="col p-5 m-2 ">
			<input type="hidden" name="_method" value="put">
				<form:input path="id" hidden="hidden" value="${user.id}"/>
					<div class="form-group row">
						<form:label path="firstName" class=" col-form-label fs-4 fw-bold">First Name: </form:label>
						<form:errors path="firstName" class="text-danger"></form:errors>
						<form:input path="firstName" class="form-control" value="${user.firstName}"/>
					</div>
					<div class="form-group row">
						<form:label path="lastName"	class="col-form-label fs-4 fw-bold">Last Name: </form:label>
						<form:errors path="lastName" class="text-danger"></form:errors>
						<form:input path="lastName" class="form-control" value="${user.lastName}"/>
					</div>
					<div class="form-group row">
						<form:label path="email" class="col-form-label fs-4 fw-bold">Email: </form:label>
						<form:errors path="email" class="text-danger"></form:errors>
						<form:input type="email" path="email" class="form-control" value="${user.email}"/>
					</div>
					<div class="form-group row">
						<form:label path="address" class="col-form-label fs-4 fw-bold">Address: </form:label>
						<form:errors path="address" class="text-danger"></form:errors>
						<form:input path="address" class="form-control" value="${user.address}"/>
					</div>
					<div class="form-group row">
						<form:label path="city" class="col-form-label fs-4 fw-bold">City: </form:label>
						<form:errors path="city" class="text-danger"></form:errors>
						<form:input path="city" class="form-control" value="${user.city}"/>
					</div>
					<div class="form-group row">
						<form:label path="state"
							class="col-sm-2 col-form-label fs-4 fw-bold ms-2 ps-0">State: </form:label>
						<form:errors path="state" class="text-danger"></form:errors>
						<div class="col-sm-10 ps-0">
							<form:select path="state" class="form-control ps-0">
								<form:option value=""><c:out value="${user.state }"></c:out></form:option> 
								<form:option value="AL">Alabama</form:option>
								<form:option value="AK">Alaska</form:option>
								<form:option value="AZ">Arizona</form:option>
								<form:option value="AR">Arkansas</form:option>
								<form:option value="CA">California</form:option>
								<form:option value="CO">Colorado</form:option>
								<form:option value="CT">Connecticut</form:option>
								<form:option value="DE">Delaware</form:option>
								<form:option value="DC">District Of Columbia</form:option>
								<form:option value="FL">Florida</form:option>
								<form:option value="GA">Georgia</form:option>
								<form:option value="HI">Hawaii</form:option>
								<form:option value="ID">Idaho</form:option>
								<form:option value="IL">Illinois</form:option>
								<form:option value="IN">Indiana</form:option>
								<form:option value="IA">Iowa</form:option>
								<form:option value="KS">Kansas</form:option>
								<form:option value="KY">Kentucky</form:option>
								<form:option value="LA">Louisiana</form:option>
								<form:option value="ME">Maine</form:option>
								<form:option value="MD">Maryland</form:option>
								<form:option value="MA">Massachusetts</form:option>
								<form:option value="MI">Michigan</form:option>
								<form:option value="MN">Minnesota</form:option>
								<form:option value="MS">Mississippi</form:option>
								<form:option value="MO">Missouri</form:option>
								<form:option value="MT">Montana</form:option>
								<form:option value="NE">Nebraska</form:option>
								<form:option value="NV">Nevada</form:option>
								<form:option value="NH">New Hampshire</form:option>
								<form:option value="NJ">New Jersey</form:option>
								<form:option value="NM">New Mexico</form:option>
								<form:option value="NY">New York</form:option>
								<form:option value="NC">North Carolina</form:option>
								<form:option value="ND">North Dakota</form:option>
								<form:option value="OH">Ohio</form:option>
								<form:option value="OK">Oklahoma</form:option>
								<form:option value="OR">Oregon</form:option>
								<form:option value="PA">Pennsylvania</form:option>
								<form:option value="RI">Rhode Island</form:option>
								<form:option value="SC">South Carolina</form:option>
								<form:option value="SD">South Dakota</form:option>
								<form:option value="TN">Tennessee</form:option>
								<form:option value="TX">Texas</form:option>
								<form:option value="UT">Utah</form:option>
								<form:option value="VT">Vermont</form:option>
								<form:option value="VA">Virginia</form:option>
								<form:option value="WA">Washington</form:option>
								<form:option value="WV">West Virginia</form:option>
								<form:option value="WI">Wisconsin</form:option>
								<form:option value="WY">Wyoming</form:option>
							</form:select>
						</div>
					</div>
					<div class="form-group row">
						<form:label path="password"
							class="col-sm-2 col-form-label fs-4 fw-bold">Password: </form:label>
						<form:errors path="password" class="text-danger"></form:errors>
						<form:input type="password" path="password" class="form-control" value="${user.password}"/>
					</div>
					<div class="form-group row">
						<form:label path="confirm"
							class="col-sm-2 col-form-label fs-4 fw-bold">Confirm: </form:label>
						<form:errors path="confirm" class="text-danger"></form:errors>
						<form:input type="password" path="confirm" class="form-control" value="${user.password}"/>
					</div>
					<div class="form-group text-right">
						<button class="btn btn-danger btn-lg mt-2 mt-4 px-3">Update</button>
					</div>
				</form:form>
			</div>
			
			<div class="col m-5 d-flex flex-column">
			
			
			
				<h1 style="color: red" >* FAVE PIZZA * </h1>
		<div class="m-5 p-3 border border-danger rounded bg-light">
				
				<h2 style="color:red" > ${favPizza.getCreatedAt()}</h2>
				<h2 style="border-bottom: 3px solid black; color: red"> ${favPizza.getSize()}</h2>
				
			<c:forEach var="toppings" items="${favPizza.getToppings()}">		
				<h2 style="border-bottom: 3px solid black; color: red"><c:out value="${toppings}"></c:out></h2>				 	
						 	
					<c:set var="tax" value="0.1"/>
					<c:set var="price" value="10.00"/>
					<c:if test="${favPizza.size == 'Small'}">
						<p class="prices">PRICE: <span><fmt:formatNumber value="${favPizza.getQuantity() * price}" type="currency"/></span> </p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
		
					
						<p class="prices"> TOTAL: <span><fmt:formatNumber value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}" type="currency"/></span></p>
					</c:if>
					<c:set var="price" value="12.00"/>
					<c:if test="${favPizza.size == 'Medium'}">
						<p class="prices">PRICE: <span><fmt:formatNumber value="${favPizza.getQuantity() * price}" type="currency"/></span> </p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
					
						<p class="prices"> TOTAL: <span><fmt:formatNumber value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}" type="currency"/></span></p>
					</c:if>
					<c:set var="price" value="14.00"/>
					<c:if test="${favPizza.size == 'Large'}">
						<p class="prices">PRICE: <span><fmt:formatNumber value="${favPizza.getQuantity() * price}" type="currency"/></span> </p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
					
						<p class="prices"> TOTAL: <span><fmt:formatNumber value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}" type="currency"/></span></p>
					</c:if>
					<c:set var="price" value="16.00"/>
					<c:if test="${favPizza.size == 'X-Large'}">
						<p class="prices">PRICE: <span><fmt:formatNumber value="${favPizza.getQuantity() * price}" type="currency"/></span> </p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
					
						<p class="prices"> TOTAL: <span><fmt:formatNumber value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}" type="currency"/></span></p>
					</c:if>
					<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
								 	
				
			</c:forEach>
				
		</div>			
			
			
				<h2>Past Orders</h2>
				<c:forEach var="pizza" items="${pizzas}">
					<div class="m-5 p-3 border border-danger rounded bg-light">
						<h4><c:out value="${pizza.createdAt}"/></h4>
						<!-- add a checkbox for favorite pizza feature -->
						<label style="margin-left: 10px; margin-top: 10px;">Favorite</label>
						<input type="checkbox" name=favoritePizzas value="${pizza.id}">
						<h5><c:out value="${pizza.size}"/> - </h5>
						
							<c:forEach var="topping" items="${pizza.toppings}">
						
								<h5 style="display: inline-block"><c:out value="${topping} "/></h5>
						 
						 	</c:forEach>
						 	
						<c:set var="tax" value="0.1"/>
						<c:set var="price" value="10.00"/>
						<c:if test="${pizza.size == 'Small'}">
							<p class="prices">PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </p>
							<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
			
						
							<p class="prices"> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></p>
						</c:if>
						<c:set var="price" value="12.00"/>
						<c:if test="${pizza.size == 'Medium'}">
							<p class="prices">PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </p>
							<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
						
							<p class="prices"> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></p>
						</c:if>
						<c:set var="price" value="14.00"/>
						<c:if test="${pizza.size == 'Large'}">
							<p class="prices">PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </p>
							<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
						
							<p class="prices"> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></p>
						</c:if>
						<c:set var="price" value="16.00"/>
						<c:if test="${pizza.size == 'X-Large'}">
							<p class="prices">PRICE: <span><fmt:formatNumber value="${pizza.getQuantity() * price}" type="currency"/></span> </p>
							<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
						
							<p class="prices"> TOTAL: <span><fmt:formatNumber value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}" type="currency"/></span></p>
						</c:if>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
									 	
						 </div>
					</c:forEach>
						 


					</div>
				</div>
				<div class="form-group row">
					<form:label path="password"
						class="col-sm-2 col-form-label fs-4 fw-bold">Password: </form:label>
					<form:errors path="password" class="text-danger"></form:errors>
					<form:input type="password" path="password" class="form-control"
						value="${user.password}" />
				</div>
				<div class="form-group row">
					<form:label path="confirm"
						class="col-sm-2 col-form-label fs-4 fw-bold">Confirm: </form:label>
					<form:errors path="confirm" class="text-danger"></form:errors>
					<form:input type="password" path="confirm" class="form-control"
						value="${user.password}" />
				</div>
				<div class="form-group text-right">
					<button class="btn btn-danger btn-lg mt-2 mt-4 px-3">Update</button>
				</div>
			</form:form>
		</div>

		<div class="col m-5 d-flex flex-column">



			<h1 style="color: red">* FAVE PIZZA *</h1>
			<div class="m-5 p-3 border border-danger rounded bg-light">

				<h2 style="color: red">
					<fmt:formatDate value="${favPizza.getCreatedAt()}"
						pattern="MM-dd-yyyy" />
				</h2>
				<h2 style="border-bottom: 3px solid black; color: red">
					${favPizza.getSize()}</h2>

				<c:forEach var="toppings" items="${favPizza.getToppings()}">
					<h2 style="border-bottom: 3px solid black; color: red">
						<c:out value="${toppings}"></c:out>
					</h2>

					<c:set var="tax" value="0.1" />
					<c:set var="price" value="10.00" />
					<c:if test="${favPizza.size == 'Small'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>


						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<c:set var="price" value="12.00" />
					<c:if test="${favPizza.size == 'Medium'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>

						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<c:set var="price" value="14.00" />
					<c:if test="${favPizza.size == 'Large'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>

						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<c:set var="price" value="16.00" />
					<c:if test="${favPizza.size == 'X-Large'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>

						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${favPizza.getQuantity() * price + favPizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>


				</c:forEach>

			</div>


			<h2>Past Orders</h2>
			<c:forEach var="pizza" items="${pizzas}">
				<div class="col m-5 d-flex flex-column">
					<h4>
						<fmt:formatDate value="${pizza.createdAt}" pattern="MM-dd-yyyy" />
					</h4>
					<!-- add a checkbox for favorite pizza feature -->
					<label style="margin-left: 1px; margin-top: 1px;">Favorite</label>
					<input type="checkbox" name=favoritePizzas value="${pizza.id}">
					<h5>
						<c:out value="${pizza.size}" />
						-
					</h5>

					<c:forEach var="topping" items="${pizza.toppings}">

						<h5 style="display: inline-block">
							<c:out value="${topping} " />
						</h5>

					</c:forEach>

					<c:set var="tax" value="0.1" />
					<c:set var="price" value="10.00" />
					<c:if test="${pizza.size == 'Small'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>


						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<c:set var="price" value="12.00" />
					<c:if test="${pizza.size == 'Medium'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>

						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<c:set var="price" value="14.00" />
					<c:if test="${pizza.size == 'Large'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>

						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<c:set var="price" value="16.00" />
					<c:if test="${pizza.size == 'X-Large'}">
						<p class="prices">
							PRICE: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price}" type="currency" /></span>
						</p>
						<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>

						<p class="prices">
							TOTAL: <span><fmt:formatNumber
									value="${pizza.getQuantity() * price + pizza.getQuantity() * price * tax}"
									type="currency" /></span>
						</p>
					</c:if>
					<p class="prices" style="width: 100%; font-weight: bold;">______________________________________________________</p>
				</div>
			</c:forEach>




		









<!-- 	<footer class="bg-dark text-white text-center py-4 mt-5 pt-5">
		<div class="container-fluid">
			<p>&copy; 2024 Crusty's Pizzaria. All rights reserved.</p>
			Facebook and Instagram icons
			<div>
				<a href="#" target="_blank" class="text-dark mx-2"> <img
					src="/images/fb.PNG" alt="Facebook" width="30" height="30">
				</a> <a href="#" target="_blank" class="text-dark mx-2"> <img
					src="/images/ig.PNG" alt="Instagram" width="30" height="30">
				</a>
			</div>
		</div>
	</footer> -->
	
</body>
</html>