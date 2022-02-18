<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show book</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script type="text/javascript" src="js/app.js"></script>
</head>
<body>
	<div class="container justify-content-center mx-auto text-center">
		<a class="btn btn-primary" href="/dashboard">Dashboard</a>
		<ul>
			<li>Title: <c:out value="${song.getTitle()}" />
			</li>
			<li>Artist: <c:out value="${song.getArtist()}" />
			</li>
			<li>Rating(1-10): <c:out value="${song.getRating()}" />
			</li>
		</ul>
		<form class="d-inline my-3" action="/songs/${song.getId()}"
			method="post">
			<input type="hidden" name="_method" value="delete">     <input
				class="btn btn-sm btn-danger" type="submit" value="Delete">
		</form>
	</div>
</body>
</html>