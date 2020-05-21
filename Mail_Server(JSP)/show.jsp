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
	int id=Integer.parseInt(request.getParameter("val"));
	rs=st.executeQuery("select * from mail where id="+id);
	out.println("<center><table width='50%'>");
	if(rs.next())
	{
	out.println("<td><font face='comic sans ms' color='lime'>To :</td>");
	out.println("<td><input type='text' value="+rs.getString("receiver")+ "></td><tr>");
	out.println("<td><font face='comic sans ms' color='lime'>From :</td>");
	out.println("<td><input type='text' value="+rs.getString("sender")+"></td><tr>");
	out.println("<td><font face='comic sans ms' color='lime'>Subject :</td>");
	out.println("<td><input type='text' value="+rs.getString("subject")+"></td><tr>");
	out.println("<td></td>");
	out.println("<td><textarea cols='30' rows='15'>" +rs.getString("message")+" </textarea><tr>");
	out.println("<td><a href='inbox.jsp'><font color='lime' face='comic sans ms'>Go back.....</a></td>");
	}
	out.println("</table></center>");
	}
	catch(Exception e1)
	{	
	}
	%>
	</body>
	</html>