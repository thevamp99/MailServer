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
	String to=request.getParameter("t1");
	String subject=request.getParameter("t2");
	String message=request.getParameter("ta1");
	
	String query="select userid from table1 where userid='"+to+"'";
	rs=st.executeQuery(query);
	if(rs.next())
	{
	String query2="insert into mail (receiver,sender,subject,message) values('"+to+"','"+session.getValue("name")+"','"+subject+"','"+message+"')";
	st.executeUpdate(query2);
	out.print("<font face='comic sans ms' color'lime'><a href='valid.html'>Mail sent go back.....</a>");

	}
	else
	{
	out.print("<font face='comic sans ms' color='lime'><a href='valid.html'>This id not exist plz try again</a>");
	}
	%>
	</body>
	</html>