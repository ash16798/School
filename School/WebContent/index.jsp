<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String userid = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "Abcd";
String used = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<body bgcolour ="red">
<h1></h1>
<table border="1">
<tr>
<td>userid</td>
<td>pass</td>
<td>fname</td>
<td>lname</td>
<td>email</td>
<td>phone</td>
<td>Address</td>
<td>city</td>
<td>fathername</td>

<td>update</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, used, password);
statement=connection.createStatement();
String sql ="select * from users6";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("userid") %></td>
<td><%=resultSet.getString("pass") %></td>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("lname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("Address") %></td>
<td><%=resultSet.getString("city") %></td>
<td><%=resultSet.getString("fathername") %></td>

<td><a href="update.jsp?id=<%=resultSet.getString("userid")%>">update</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>