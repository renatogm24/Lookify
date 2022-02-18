<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
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
	<div class="container justify-center">
		<h1 class="text-danger">All Songs</h1>

		<div class="d-flex justify-content-between">
			<a href="/songs/new">Add new</a> <a href="/songs/top">Top Songs</a>
			
			<form action="/search" method='GET'>
			<div class="input-group mb-3">
				<input type="text" class="form-control" name="artist"
					placeholder="Search by artist" aria-label="Search by artist"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="submit">New
						Search</button>
				</div>
			</div>
			</form>
			
		</div>

		<table class="table">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Rating</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="song" items="${songs}">
					<tr>
						<td><a href="/songs/${song.getId()}"><c:out
									value="${song.getTitle()}" /></a></td>
						<td><c:out value="${song.getRating()}" /></td>
						<td>
							<form class="d-inline" action="/songs/${song.getId()}"
								method="post">
								<input type="hidden" name="_method" value="delete">     <input
									class="btn btn-sm btn-danger" type="submit" value="Delete">
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>