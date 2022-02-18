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
				<h2 class="text-center mb-3">Edit Language!</h2>
				<form:form
					class="row g-2 justify-content-center bg-dark text-light py-4 px-3 rounded"
					action="/languages/${language.id}" method="post" modelAttribute="language">
					<input type="hidden" name="_method" value="put">
					<form:label for="name" path="name" class="form-label">Name:</form:label>
					<form:errors path="name" class="text-danger" />
					<form:input type="text" path="name" class="form-control" id="name" />
					<form:label for="creator" path="creator" class="form-label">Creator:</form:label>
					<form:errors path="creator" class="text-danger" />
					<form:input type="text" path="creator" class="form-control"
						id="creator" />
					<form:label for="version" path="version" class="form-label">Version:</form:label>
					<form:errors path="version" class="text-danger" />
					<form:input type="number" step="0.01" path="version" class="form-control"
						id="version" />

					<button class="btn btn-primary mt-4" type="submit">Submit</button>
				</form:form>
				<a class="btn btn-primary my-3" href="/languages">Go back</a>
			</div>
		</div>
	</div>
</body>
</html>