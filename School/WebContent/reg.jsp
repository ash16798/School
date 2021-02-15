<%@ page import = "java.sql.*" %>
<%
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String  Address= request.getParameter("Address");
String city = request.getParameter("city");
String fathername = request.getParameter("fathername");






try
{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Abcd", "root", "root");
	 PreparedStatement ps = conn.prepareStatement("insert into  users6 (userid, pass, fname,lname, email,phone,Address,city,fathername) values(?,?,?,?,?,?,?,?,?)" );
	 ps.setString(1, userid);
	 ps.setString(2, pass);
	 ps.setString(3, fname);
	 ps.setString(4, lname);
	 ps.setString(5, email);
	 ps.setString(6, phone);
	 ps.setString(7,Address);
	 ps.setString(8,city);
	 ps.setString(9, fathername);
	 
	 
	
	 
	 int x = ps.executeUpdate();
	 
	 if(x > 0)
	 {
		
		 response.sendRedirect("Login.html");

	 }
	 else
	 {
       System.out.println("Resgistration Failed...");
		 
	 }
	 
}
catch(Exception e)
{
	out.println(e);
}
%>