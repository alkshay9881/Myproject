<%@page import="com.servlet.dao.BatchDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="b" class="com.servlet.bean.Batch"></jsp:useBean>
<jsp:setProperty property="*" name="b"/>
<% 
BatchDao batchdao=new BatchDao();
batchdao.deleteBatchbyid(b);
out.print("delete course data ");
response.sendRedirect("batch.jsp");


%>

</body>
</html>