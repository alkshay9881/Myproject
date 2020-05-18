 <%@page import="com.servlet.dao.LoginDao"%>

 <%
 

 String courseName=request.getParameter("coursename");
 String duration=request.getParameter("duration");
 LoginDao dao=new LoginDao();
int recordupdate= dao.addDataCourse(courseName,duration);
out.print("record added");
response.sendRedirect("course.jsp");

 %>