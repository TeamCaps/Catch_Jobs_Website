
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%
  request.setCharacterEncoding("utf-8");
  Connection conn = null;
  String jdbcUrl = "jdbc:mysql://192.168.0.188:3306/caps";
  String dbId = "caps";
  String dbPass = "1234";
  Class.forName("com.mysql.jdbc.Driver");
  conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
  PreparedStatement pstmt = conn.prepareStatement("select * from jobs");
  ResultSet rs = pstmt.executeQuery();
  out.println("연결완료");
  out.println("\n");
  %>

  <% while(rs.next()) {
  %>
<%--  db에 있는 값 가져오기--%>
  <tr>
    <td><%= rs.getInt("id")%></td>
    <td><%= rs.getString("cp_name")%></td>
    <td><%= rs.getString("work_name")%></td>
    <td><%= rs.getString("cp_logo")%></td>
    <td><%= rs.getString("work_link")%></td>
  </tr>
  <br>
  <% }%>
  <form action="insert_prefer_cp.jsp" method="post">
    <input type="text" name="prefer_cp">
    <input type="submit" submit>
  </form>
  <a href="./login.jsp">login</a>
</body>
</html>
