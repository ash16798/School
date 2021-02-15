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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, used, password);
statement=connection.createStatement();
String sql ="select * from users6 where userid="+userid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update</h1>
<form action="update-process.jsp"   method="post">
<input type="hidden" name="userid" value="<%=resultSet.getString("userid") %>">
<input type="text" name="userid" value="<%=resultSet.getString("userid") %>">
<br>
pass:<br>
<input type="text" name="pass" value="<%=resultSet.getString("pass") %>">
<br>
 fname:<br>
<input type="text" name="fname" value="<%=resultSet.getString("fname") %>">
<br>
lname:<br>
<input type="text" name="lname" value="<%=resultSet.getString("lname") %>">
<br>
Email Id:<br>
<input type="email" name="email" value="<%=resultSet.getString("email") %>">
<br>
phone:<br>
<input type="phone" name="phone" value="<%=resultSet.getString("phone") %>">
<br>
Address:<br>
<input type="text" name="Address" value="<%=resultSet.getString("Address") %>">
<br>
city:<br>
<input type="city" name="city" value="<%=resultSet.getString("city") %>">
<br>
fathername:<br>
<input type="text" name="fathername" value="<%=resultSet.getString("fathername") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
