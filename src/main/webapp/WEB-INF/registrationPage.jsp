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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
		<div class="container-fluid">
			<div class="d-flex justify-content-between w-100">
				<a class="navbar-brand" href="/"> <img src="/images/crusty2.PNG"
					alt="CrustyMascot" width="130" height="130"
					class="d-inline-block align-text-top ms-4">

				</a> <span class="navbar-text text-white fw-bold fs-1 mt-4">Crusty's
					Pizzaria</span>
				<ul class="navbar-nav mt-5 me-3">
					<li class="nav-item"><a class="nav-link btn btn-danger px-4"
						href="/login">Login</a></li>

				</ul>
			</div>
		</div>
	</nav>

	<form:form action="/register" method="post" modelAttribute="newUser"
		class="p-5 m-5 ">
		<h2 class="text-dark fs-1 fw-bold">Register</h2>
		<div class="form-group row">
			<form:label path="firstName"
				class="col-sm-2 col-form-label fs-4 fw-bold">First Name: </form:label>
			<form:errors path="firstName" class="text-danger"></form:errors>
			<form:input path="firstName" class="form-control" />
		</div>
		<div class="form-group row">
			<form:label path="lastName"
				class="col-sm-2 col-form-label fs-4 fw-bold">Last Name: </form:label>
			<form:errors path="lastName" class="text-danger"></form:errors>
			<form:input path="lastName" class="form-control" />
		</div>
		<div class="form-group row">
			<form:label path="email" class="col-sm-2 col-form-label fs-4 fw-bold">Email: </form:label>
			<form:errors path="email" class="text-danger"></form:errors>
			<form:input type="email" path="email" class="form-control" />
		</div>
		<div class="form-group row">
			<form:label path="address"
				class="col-sm-2 col-form-label fs-4 fw-bold">Address: </form:label>
			<form:errors path="address" class="text-danger"></form:errors>
			<form:input path="address" class="form-control" />
		</div>
		<div class="form-group row">
			<form:label path="city" class="col-sm-2 col-form-label fs-4 fw-bold">City: </form:label>
			<form:errors path="city" class="text-danger"></form:errors>
			<form:input path="city" class="form-control" />
		</div>
		<div class="form-group row">
			<form:label path="state"
				class="col-sm-2 col-form-label fs-4 fw-bold ms-2 ps-0">State: </form:label>
			<form:errors path="state" class="text-danger"></form:errors>
			<div class="col-sm-10 ps-0">
				<form:select path="state" class="form-control ps-0">
					<form:option value="">Select State</form:option>
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
			<form:input type="password" path="password" class="form-control" />
		</div>
		<div class="form-group row">
			<form:label path="confirm"
				class="col-sm-2 col-form-label fs-4 fw-bold">Confirm: </form:label>
			<form:errors path="confirm" class="text-danger"></form:errors>
			<form:input type="password" path="confirm" class="form-control" />
		</div>
		<div class="form-group text-right">
			<button class="btn btn-danger btn-lg mt-2 mt-4 px-3">Register</button>
		</div>
		<div class="pt-3 ">
			<a href="/login" class="text-danger fs-4 fw-bold">Already
				Registered? Login</a>
		</div>
	</form:form>

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