<%@page import="com.servlet.dao.BatchDao"%>
<%@page import="com.servlet.dao.*"%>
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
		import="com.servlet.dao.BatchDao,com.servlet.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<% 
LoginDao dao=new LoginDao();
List<Course> list = dao.getAllCorse();
request.setAttribute("list", list);

BatchDao batchdao = new BatchDao();
List<Batch> list1 = batchdao.detailsOfBatch();
request.setAttribute("list1", list1);					
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Student Management System</a>
		</nav>
	<h1 style="color: black;background-color: gray " >Student Registration</h1>
	<div class="row">
		<div class="col-sm-4">
			<form method="post" align="left" action="addstudent.jsp">
				<div> 
					<label class="form-label" style="color: white;">Student name</label> <input type="text"
						id="sname" name="sname" class="form-control"
						placeholder="Student name" required>
				</div>
				<div>
				
					<label class="form-label" style="color: white;">Course</label>
					<select name="course" id="course" class="form-control">
					
					
					<c:forEach items="${list}" var="courselist">
					<option  value="${courselist.getId()}">${courselist.getCoursename()} </option>
					
					
					</c:forEach>
					
					</select>
				</div>
				<div>
					<label class="form-label" style="color: white;">Batch</label>
					<select name="batch" id="batch" class="form-control">
						
					<c:forEach items="${list1}" var="batchlist">
					<option  value="${batchlist.getId()}">${batchlist.getBatchname()} </option>
					
					
					</c:forEach>
					
					</select>
				
				</div>
				
				<div class="form-group">
                        <label for="textarea" style="color: white;">Address</label>
                        <textarea name="address" id="address" class="form-control"></textarea>
                        </div>
				<div> 
					<label class="form-label"style="color: white;">Phone</label> <input type="text"
						id="phone" name="phone" class="form-control"
						placeholder="Student phone" required>
				</div>
				<div>
					<br> <input type="submit" name="submit" value="submit"
						class="btn btn-success"> <input type="reset" name="reset"
						value="reset" class="btn btn-warning">
				</div>

			</form>
		</div>

		<% 
		
		StudentDao studentdao=new StudentDao();
		List<Student> list3 = studentdao.getAllStudent();
		request.setAttribute("list3", list3);
		
		%>
		
		<div class="col-sm-30">
			<div class="panel-body">
				<table id="tbl-course" class="table table-responsive table-bordered"style="background-color: activecaption ;border-color:green;
					cellpadding="0" width="100%">
					<thead>
						<tr>
							<th>Student name</th>
							<th>Course</th>
							<th>Batch</th>
							<th>Address</th>
                            <th>Phone</th>
                           
                            <th>Delete</th>
						</tr>

					</thead>
					<tbody>
						<c:forEach items="${list3}" var="studentlist">
							<tr>
								<td>${studentlist.getStudname()}</td>
								<td>${studentlist.getCourse()}</td>
								<td>${studentlist.getBatch()}</td>
								<td>${studentlist.getAddress()}</td>
								<td>${studentlist.getPhone()}</td>
								<td><a href="studentdelete.jsp?id=${studentlist.getId()}" style="color: red">Delete</a></td>
							</tr>
						</c:forEach>
						<c:if test="${empty list3}">
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