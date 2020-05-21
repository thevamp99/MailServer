	<%@page import="java.sql.*"%>
	<%@page import="java.lang.*"%>
	<html>
	<head>
	<title>Using Mail Server</title>
	</head>
	<body bgColor="black" topmargin=0 leftmargin=0>
	<img src="banner.jpg">
	<%
	Connection con;
	ResultSet rs;
	Statement st;
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jas","root","");
	String name=request.getParameter("t1");
	String pass=request.getParameter("p1");
	//out.println("<font color='red'>"+name+" "+pass);
	session.putValue("name",name);
	st=con.createStatement();
	rs=st.executeQuery("select * from table1 where userid='"+name+"' and password='"+pass+"'");
	if(rs.next())
	{
	response.sendRedirect("valid.html");
	}
	else
	{
	response.sendRedirect("invalid.html");
	}
	}
	catch(Exception e1)
	{	
	}
	%>
	</html>