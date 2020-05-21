	<%@page import="java.sql.*"%>
	<%@page import="java.lang.*"%>
	<html>
	<head>
	</head>
	<body bgColor="black" topmargin=0 leftmargin=0 link="cyan" vlink="yellow">
	<center><img src="banner.jpg"></center>
	<%
	Connection con;
	ResultSet rs;
	Statement st;
	try
	{
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jas","root","");
	st=con.createStatement();
	rs=st.executeQuery("select * from mail where receiver='"+session.getValue("name")+"'");
	out.println("<font color='lime'>");
	
	out.println("<center><table width='50%' border='1'>");
	out.println("<form method='get' action='delete.jsp'>");
	out.println("<td><input type='submit' value='Delete'></td>");
	out.println("<td><font face='comic sans ms' color='white'>Receiver</td>");
	out.println("<td><font face='comic sans ms' color='white'>Sender</td>");
	out.println("<td><font face='comic sans ms' color='white'>Subject</td><tr>");
	int idd=0;
	int i=0;
	while(rs.next())
	{
	idd=rs.getInt("id");
	i++;
	out.println("<td><input type='checkbox' name=cb" +i+ " value=" +idd+" ></td>");

	out.println("<td><font face='comic sans ms' color='lime'>");
	out.println(rs.getString("receiver"));
	out.println("</td>");
	out.println("<td><font face='comic sans ms' color='lime'>");
	out.println(rs.getString("sender"));
	out.println("</td>");
	out.println("<td><font face='comic sans ms' color='lime'>");
	out.println("<a href='show.jsp?val="+idd+"'>" +rs.getString("subject")+"</a>");
	out.println("</td><tr>");


	}	
	out.println("<td><input type='hidden' name='h1' value=" +i + "></td>");
	out.println("</form>");
	out.println("</table></center>");
	}
	catch(Exception e1)
	{
	
	}
	%>
	
	</body>
	</html>