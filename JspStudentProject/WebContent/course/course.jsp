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
<title>Insert title here</title>
</head>
<body>
	<%@page
		import="com.servlet.dao.LoginDao,com.servlet.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Student Management System</a>
		</nav>
	<h1 style="color: black;background-color:gray;box-shadow: blue;">Course</h1>
	<div class="row">
		<div class="col-sm-4">
			<form method="post" align="left" action="add.jsp">
				<div>
					<label class="form-label" style="color:white;">Course name</label> <input type="text"
						id="coursename" name="coursename" class="form-control"
						placeholder="Enter Course name" required>
				</div>
				<div>
					<label class="form-label" style="color: white;">Duration</label> <input type="text"
						id="duration" name="duration" class="form-control"
						placeholder="Enter Duration" required>
				</div>
				<div>
					<br> <input type="submit" name="submit" value="submit"
						class="btn btn-success"> <input type="reset" name="reset"
						value="reset" class="btn btn-warning">
				</div>
			</form>
		</div>

		<%
			String pageNoStr = request.getParameter("pageNo");
			int pageSize = 5;
			int pageNo = 1;
			if (pageNoStr != null) {
				pageNo = Integer.parseInt(pageNoStr);
			}

			String direction = request.getParameter("direction");
			LoginDao dao = new LoginDao();
			CourseDetails courseDetails = dao.detailsOfCourse(pageNo, direction, pageSize);
			request.setAttribute("list", courseDetails.getCourse());
			pageNo = courseDetails.getPageNo();
			int noOfPages = courseDetails.getTotal();
		%>
		<div class="col-sm-60">
			<div class="panel-body" >
				<table id="tbl-course" class="table table-responsive table-bordered" 
				style="background-color: activecaption ;border-color:green;
					cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>Course name</th>
							<th>Duration</th>
							<th>Edit</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="u">
							<tr>
								<td>${u.getCoursename()}</td>
								<td>${u.getDuration()}</td>
								<td><a href="courseedit.jsp?id=${u.getId()}">Edit</a></td>
								<td><a href="coursedelete.jsp?id=${u.getId()}" style="color: red">Delete</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty list}">
							<tr>
								<td colspan="4" align="center">No Rcords Found!</td>
							</tr>
						</c:if>
					</tbody>
					<tfoot>
						<c:if test="${!empty list}">
							<tr>
								<td colspan="4" align="right"><a
									href="./course.jsp?direction=prev&pageNo=<%=pageNo%>">Prev</a>&nbsp;&nbsp;|
									&nbsp; <a href="./course.jsp?direction=next&pageNo=<%=pageNo%>">Next</a>
									<c:forEach begin="1" end="${noOfPages}" var="page">
										<td>${page}</td>
									</c:forEach></td>
							</tr>
						</c:if>
					</tfoot>
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