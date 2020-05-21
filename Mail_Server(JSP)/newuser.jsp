	<%@page import="java.sql.*"%>
	<%@page import="java.lang.*"%>
	
	<html>
	<head>
	<title>Using Mail Server</title>
	</head>
	<body bgColor="black" topmargin=0 leftmargin=0 link='lime' vlink='lime' alink='lime' rlink='lime'>
	<center><img src="banner.jpg">
	<%	
	String name=request.getParameter("t1");
	String pass=request.getParameter("p1");
	String hq=request.getParameter("s1");
	String ha=request.getParameter("p2");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jas","root","");
	Statement st=con.createStatement();

	String query="select userid from table1 where userid='"+name+"'";
	ResultSet rs=st.executeQuery(query);
		
	if(rs.next())
	{
	out.println("<a href='newuser.html'><font face='comic sans ms' color='lime'>This id allready exist plz try again....</a>");
	}
	else
	{
	String query2="insert into table1 (userid,password,HintQuestion,HintAnswer) values('"+name+"','"+pass+"','"+hq+"','"+ha+"')";
	st.executeUpdate(query2);
	out.println("<a href='login.html'><font face='comic sans ms' color='lime'>Your id created sucessfully plz login....</a>");

	}
	%>
	</body>
	</html>