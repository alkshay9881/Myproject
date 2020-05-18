<%@page import="com.servlet.bean.Course"%>
<%@page import="com.servlet.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="c" class="com.servlet.bean.Course"></jsp:useBean>
<jsp:setProperty property="*" name="c"/>
<% 

LoginDao dao=new LoginDao();
int update=dao.updateCourseDetails(c);

out.print("course record updated"+update);
response.sendRedirect("course.jsp");
%>


</body>
</html>