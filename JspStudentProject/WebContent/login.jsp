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
	 <style>
		body{ background-image:url("images/city2.jpg");
		}
		h2{
		background-color: black;color: white;
		}
		h1{
		color: white;
		background: gray;
		} 
		</style>
</head>
<body bgcolor="color:red">
 
  <h2>Student Management System </h2>
	<h1 >Admin Login</h1>
	<div class="row">
		<div class="col-sm-4">
			<form method="post" action="loginv.jsp">
				<div align="left">
					<label class="form-label" style="color: white">Username</label> <input type="text"
						id="uname" name="uname" class="form-control"
						placeholder="Username" size="30px" required>
				</div>
				<div align="left">
					<label class="form-label" style="color: white;">Password</label> <input type="password"
					id="password" name="password" class="form-control"
						placeholder="Password" size="30px" required>
				</div>
				<br>
				<div align="left">
					<input type="submit" id="submit" name="submit" value="login"class="btn btn-info">
						 <input type="reset" id="reset"name="reset" value="reset" class="btn btn-warning">
				</div>
			</form>
		</div>
	</div>	
	
<div class="container text-right mr-0">
<a href="studentreg/student.jsp" class ="btn btn-info" role="button">Register Student Here</a>
</div>

</body>
</html>

