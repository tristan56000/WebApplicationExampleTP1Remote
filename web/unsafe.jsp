<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: trist
  Date: 17/03/2020
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Unsafe page</title>
</head>
<body>
<div class="info">
    <% String id = request.getParameter("user");
        String db = "GUERIN";
        String table = "user";
        String url = "jdbc:mysql://localhost:3306/"+db+"?allowMultiQueries=true&serverTimezone=Europe/Paris";
        String user= "GUERIN";
        String password = "";
        ResultSet resultSet1= null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url,user,password);
            Statement statement = connection.createStatement();
            String sql1 = "select * from user where id =" +id;
            statement.execute(sql1);
            resultSet1 = statement.getResultSet();
            while (resultSet1.next()){
                out.println("<div><a>Details :</a>" +
                        "<div><a>ID :"+resultSet1.getString("id")+"</a></div>" +
                        "<div><a>Name :"+resultSet1.getString("name")+"</a></div>" +
                        "<div><a>Password :"+resultSet1.getString("password")+"</a></div>" +
                        "<div><a>Salary :"+resultSet1.getString("salary")+"</a></div>" +
                        "<div><a>Age :"+resultSet1.getString("age")+"</a></div>" +
                        "</div>");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }%>
</div>
</body>
</html>
