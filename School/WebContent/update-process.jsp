<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/Abcd";%>
<%!String user = "root";%>
<%!String psw = "root";%>
<%
String userid = request.getParameter("userid");
String pass=request.getParameter("pass");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String Address=request.getParameter("Address");
String city=request.getParameter("city");
String fathername=request.getParameter("fathername");
if(userid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(userid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update users6 set userid=?,pass=?,fname=?,lname=?,email=?,phone=?,Address=?,city=?,fathername=? where userid="+userid;
ps = con.prepareStatement(sql);
ps.setString(1,userid);
ps.setString(2, pass);
ps.setString(3, fname);
ps.setString(4, lname);
ps.setString(5, email);
ps.setString(6,phone);
ps.setString(7, Address);
ps.setString(8, city);
ps.setString(9, fathername);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>