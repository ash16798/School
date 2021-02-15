<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "java.sql.*" %>
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");

try
{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Abcd", "root", "root");
	 Statement st = conn.createStatement();

	 ResultSet rs = st.executeQuery("select * from users6 where  userid='" +userid+ "' and pass='"+pass+"'");

	 if(rs.next())

	 {

	 response.sendRedirect("welcome.html"); 
	 
	 

	

	 }

	 else
	 {
		 response.sendRedirect("back.html");
	 }

	 rs.close();

	 st.close(); 

	 }

	 catch(SQLException sqe)

	 {

	 out.println(sqe);

	 } 

	 %>


</body>
</html>
