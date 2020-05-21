	<%@page import="java.sql.*"%>
	<%@page import="java.lang.*"%>
	<html>
	<head>
	</head>
	<body bgColor="black" topmargin=0 leftmargin=0 link='lime' vlink='lime' alink='lime' rlink='lime'>
	<center><img src="banner.jpg">
	<br>
	<%
	Connection con;
	ResultSet rs;
	Statement st;
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jas","root","");
	st=con.createStatement();	
	String oldpass=request.getParameter("p1");
	String newpass=request.getParameter("p2");
	
	
	String query="select userid,password from table1 where userid='"+session.getValue("name")+"' and password='"+oldpass+"'";
	rs=st.executeQuery(query);
	if(rs.next())
	{
	String query2="Update table1 set password='"+newpass+"' where userid='"+session.getValue("name")+"'";
	st.executeUpdate(query2);
	out.print("<font face='comic sans ms' colo'lime'><a href='valid.html'>Password Updated Plz continue.....</a>");

	}
	else
	{
	out.print("<font face='comic sans ms' color'lime'><a href='change.html'>Sorry u r not a valid user plz try again</a>");
	}
	%>
	</body>
	</html>