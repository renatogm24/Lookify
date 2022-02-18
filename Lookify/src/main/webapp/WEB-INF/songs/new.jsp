<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Grace Recipe</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="js/app.js"></script>
</head>
<body>
	<div class="container">
		<div class="row justify-content-evenly">
			<div class="px-5 px-sm-0 col-sm-6 col-md-4 mb-5">
				<h2 class="text-center mb-3">Create a new Language!</h2>
				<a class="btn btn-primary my-3" href="/dashboard">Dashboard</a>
				<div style="width: 50%;" class="mx-auto">
					<form:form
						class="row g-2 justify-content-center bg-dark text-light py-4 px-3 rounded"
						action="/songs" method="post" modelAttribute="song">

						<form:label for="title" path="title" class="form-label">Title:</form:label>
						<form:errors path="title" class="text-danger" />
						<form:input type="text" path="title" class="form-control" id="title" />
						
						<form:label for="artist" path="artist" class="form-label">Artist:</form:label>
						<form:errors path="artist" class="text-danger" />
						<form:input type="text" path="artist" class="form-control"
							id="artist" />
							
						<form:label for="rating" path="rating" class="form-label">Rating(1-10):</form:label>
						<form:errors path="rating" class="text-danger" />
						<form:input type="number" step="0.01" path="rating"
							class="form-control" id="rating" />

						<button class="btn btn-primary mt-4" type="submit">Add Song</button>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>