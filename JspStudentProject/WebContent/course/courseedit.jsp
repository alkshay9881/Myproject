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
<%@page import="com.servlet.dao.LoginDao,com.servlet.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h1 style="background-color: gray">Update Course</h1>
	<div class="row">
		<div class="col-sm-4">
			<form method="post" align="left" action="coursedataupdate.jsp">
			
			<% 
			int id=  Integer.parseInt(request.getParameter("id"));
			LoginDao dao=new LoginDao();
			Course c=dao.getCoursebyid(id);
		
			%>
		
			<div>
					    <label class="form-label">Course id</label> 
					    <input type="text"
						id="id" name="id" class="form-control" 
						placeholder="Course id"  value="<%=c.getId()%>" required>
				</div>
			
				<div>
					    <label class="form-label">Course name</label> 
					    <input type="text"
						id="coursename" name="coursename" class="form-control"
						placeholder="Course name" value="<%=c.getCoursename()%>" required>
				</div>
				<div>
					   <label class="form-label">Duration</label>
					   <input type="text"
					   id="duration" name="duration" class="form-control"
					   placeholder="Duration" value="<%=c.getDuration()%>" required>
				</div>
				<div>
					<br>
					    <input type="submit" name="submit" value="submit"
						class="btn btn-success"> <input type="reset" name="reset"
						value="reset" class="btn btn-warning">
				</div>
			</form>
		</div>

		<div class="col-sm-8">
	
			
		</div>
	</div>
</body>
</html>