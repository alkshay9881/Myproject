
<%@page import="com.servlet.dao.BatchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="../coponent/bootstrap-4.4.1-dist/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="../coponent/bootstrap-4.4.1-dist/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
 <style>
		body{ background-image:url("../images/abc.jpg");
		
		} 
		</style>
</head>
<body>
	<%@page
		import="com.servlet.dao.BatchDao,com.servlet.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Student Management System</a>
		</nav>
	<h1 style="color: black;background: gray" >Batch</h1>
	<div class="row">
		<div class="col-sm-4">
			<form method="post" align="left" action="addbatch.jsp">
				<div>
					<label class="form-label" style="color: white;">Batch name</label> <input type="text"
						id="batchname" name="batchname" class="form-control"
						placeholder="Batch name" required>
				</div>
				<div>
					<label class="form-label"style="color: white;">Year</label> <input type="text" id="year"
						name="year" class="form-control" placeholder="year" required>
				</div>
				<div>
					<br> <input type="submit" name="submit" value="submit"
						class="btn btn-success"> <input type="reset" name="reset"
						value="reset" class="btn btn-warning">
				</div>

			</form>
		</div>

		<%
			BatchDao batchdao = new BatchDao();
			List<Batch> list = batchdao.detailsOfBatch();
			request.setAttribute("list", list);
		%>
		
		<div class="col-sm-30">
			<div class="panel-body">
				<table id="tbl-course" class="table table-responsive table-bordered" style="background-color: activecaption ;border-color:green; ;"
					cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>Batch name</th>
							<th>year</th>
							<th>Edit</th>
							<th>Delete</th>

						</tr>

					</thead>
					<tbody>
						<c:forEach items="${list}" var="b">
							<tr>
								<td>${b.getBatchname()}</td>
								<td>${b.getYear()}</td>
								<td><a href="batchedit.jsp?id=${b.getId()}">Edit</a></td>
								<td><a href="batchdelete.jsp?id=${b.getId()}" style="color: red">Delete</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty list}">
							<tr>
								<td colspan="4" align="center">No Rcords Found!</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<footer>
			<p class="text-center bg-dark text-white" style="bottom:0px; position: fixed; width: 100%;" >Copyright &copy;
				 2020 Akshay Mandge</p>
		</footer> 
</body>
</html>