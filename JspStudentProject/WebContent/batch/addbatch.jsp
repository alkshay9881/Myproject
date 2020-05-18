 <%@page import="com.servlet.dao.BatchDao"%>
<%@page import="com.servlet.dao.LoginDao"%>

 <%
 

 String batchname=request.getParameter("batchname");
 int year=Integer.parseInt(request.getParameter("year"));
 BatchDao batchdao=new BatchDao();
int recordupdate= batchdao.addDataBatch(batchname, year);
out.print("record added");
response.sendRedirect("batch.jsp");

 %>	