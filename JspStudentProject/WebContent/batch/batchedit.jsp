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
<%@page import="com.servlet.dao.BatchDao,com.servlet.bean.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<h1 style="color:white;background: gray">Update Batch</h1>
	<div class="row">
		<div class="col-sm-4">
			<form method="post" align="left" action="batchdataupdate.jsp">
			
			<% 
			int id=  Integer.parseInt(request.getParameter("id"));
			BatchDao batchdao=new BatchDao();
			Batch b=batchdao.getBatchbyid(id);
		
			%>
		
			<div>
					    <label class="form-label">Batch id</label> 
					    <input type="text"
						id="id" name="id" class="form-control" 
						placeholder="batch id"  value="<%=b.getId()%>" required>
				</div>
			
				<div>
					    <label class="form-label">Batch name</label> 
					    <input type="text"
						id="batchname" name="batchname" class="form-control"
						placeholder="Batch name" value="<%=b.getBatchname()%>" required>
				</div>
				<div>
					   <label class="form-label">Year</label>
					   <input type="text"
					   id="year" name="year" class="form-control"
					   placeholder="Duration" value="<%=b.getYear()%>" required>
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