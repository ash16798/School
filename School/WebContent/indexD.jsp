<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "Abcd";
String userid = "root";
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
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body style="background-color:grey;">
<h1>Delete Here </h1>
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
<td>delect</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from users6";
resultSet = statement.executeQuery(sql);
int i=0;
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

<td><a href="delete.jsp?userid=<%=resultSet.getString("userid") %>"><button type="button" class="delete">Delete</button></a></td>
</tr>

<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>