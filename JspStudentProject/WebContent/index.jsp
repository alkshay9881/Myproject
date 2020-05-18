<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link href="coponent/bootstrap-4.4.1-dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="coponent/bootstrap-4.4.1-dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<!-- <style>
		body{ background-image:url("images/pencil.jpg");
		background-position:1000em;
		} 
		</style> -->
<style>
  .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        </style>
</head>
<body>
	<%
		if (session.getAttribute("uname") == null) {
			response.sendRedirect("login.jsp");

		}
	%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Student Management System</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="course/course.jsp">Course</a></li>
				<li class="nav-item"><a class="nav-link" href="batch/batch.jsp">Batch</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="student/student.jsp">Student </a></li>
					<li class="nav-item"><a class="nav-link"
					href="about.jsp">About Us </a></li>
			</ul>
		</div>
	</nav>
	<!-- navigation end -->
	
		<!-- The slideshow -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/city2.jpg" alt="Los Angeles">
				<div class="carousel-caption d-none d-md-block">
					<h1 style="color: red; font-weight: bold; font-size: 70px;color:white;background-color: black;" >
						welcome</h1>
					<h4 style="color: white;" >${uname}</h4>
					<form action="LogoutServlet" method="get" style='float: right'>
			<input type="submit" value="logout">
		</form>
				</div>
			</div>
		</div>

		<!-- <img src="images/wp1838789-student-wallpapers.jpg" alt="student" /> -->

		


		<footer>
			<p class="text-center bg-dark text-white" style="bottom:0px; position: fixed; width: 100%;" >Copyright &copy;
				 2020 Akshay Mandge</p>
		</footer> 
</body>
</html>