 <%@page import="com.servlet.dao.StudentDao"%>
<%@page import="com.servlet.dao.BatchDao"%>

 <%
 	

 String studname=request.getParameter("sname");
 String course=request.getParameter("course");
 String batch=request.getParameter("batch");
 String address=request.getParameter("address");
 String phone=request.getParameter("phone");
 
StudentDao studdao=new StudentDao();
int i=studdao.addDataStudent(studname, course, batch, address, phone);
if(i>0)
{
	out.print("record added");
	}

response.sendRedirect("student.jsp");
 %>	