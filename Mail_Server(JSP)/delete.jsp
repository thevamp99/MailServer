	<%@page import="java.sql.*"%>
	<%@page import="java.lang.*"%>
	<html>
	<head>
	<%
	Connection con;
	ResultSet rs;
	Statement st;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jas","root","");
	st=con.createStatement();
	int i=Integer.parseInt(request.getParameter("h1"));
	for(int j=1;j<=i;j++)	
	{
	String s=request.getParameter("cb"+j);
	if(!s.equals(""))
	{
	String query="Delete from mail where id="+Integer.parseInt(s);
	st.executeUpdate(query);
	}
	}
	response.sendRedirect("inbox.jsp");
	%>

	</head>
	</html>