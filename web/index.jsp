<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: trist
  Date: 16/03/2020
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>List of users</title>
</head>
<body>
App Web
<h1>Connection status</h1>
<%
  String db = "GUERIN";
  String table = "user";
  String url = "jdbc:mysql://localhost:3306/"+db;
  String user= "GUERIN";
  String password = "";
  ResultSet resultSet = null;
  Statement statement = null;
  Connection connection = null;
  try{
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(url,user,password);
    if(!connection.isClosed()){
      out.println("Successfully connected to mysql database");
    }

    statement = connection.createStatement();

    String sql1 = "select * from "+table;

    resultSet = statement.executeQuery(sql1);
  } catch (Exception e) {
    e.printStackTrace();
    out.println("Unable to connect to database");
  }
%>
<table border="1" style="width: 100%">
  <tr>
    <td><a style="font-weight: bold;">Site</a></td>
    <td><a style="font-weight: bold;">Unsafe link</a></td>
    <td><a style="font-weight: bold;">Safe link</a></td>

  </tr>
  <%
    if(resultSet!=null){
      try {
        while(resultSet.next()){

  %>
  <tr>
    <td><%out.println(resultSet.getString("name"));%></td>
    <td><%out.println("<a href= unsafe.jsp?user="+ resultSet.getString("id")+">Unsafe details page</a>");%></td>
    <td><%out.println("<a href= safe.jsp?user="+ resultSet.getString("id")+">Safe details page</a>");%></td>
  </tr>
  <%
        }
        statement.close();
        connection.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  %>

</table>
</body>
</html>
