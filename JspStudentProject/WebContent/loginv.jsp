<%@page import="java.io.PrintWriter"%>
<%@page import="com.servlet.dao.LoginDao"%>

<%

 String username=request.getParameter("uname");
 String password=request.getParameter("password");

 PrintWriter pw=response.getWriter();

	LoginDao dao=new LoginDao();

	if (dao.check(username, password)) 
	
	{
		session.setAttribute("uname", username);
		response.sendRedirect("index.jsp");
		
	}
	else
	{
		//response.sendRedirect("login.jsp");
		RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
		 
	   rd.include(request, response);
	   pw.print("<h5 style='color:red'> Invalid Username or Password please try again </h5>");
		
	}


 %>