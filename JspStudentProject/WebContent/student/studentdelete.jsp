<%@page import="com.servlet.dao.StudentDao"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="s" class="com.servlet.bean.Student"></jsp:useBean>
<jsp:setProperty property="*" name="s"/>
<% 
StudentDao studentdao=new StudentDao();
studentdao.deleteStudentbyid(s);

out.print("delete course data ");
response.sendRedirect("student.jsp");


%>

</body>
</html>