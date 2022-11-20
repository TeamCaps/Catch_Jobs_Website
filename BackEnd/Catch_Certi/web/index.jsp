
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
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
  PreparedStatement pstmt1 = conn.prepareStatement("select * from user");
  ResultSet rs1 = pstmt1.executeQuery();
  out.println("연결완료\n");
  out.println("\n");
  %>

  <%
    Map<String,Integer> ranking=new HashMap<>();
    while(rs1.next()) {
    String work1=rs1.getString("work1");
    String work2=rs1.getString("work2");
    ranking.put(work1,ranking.containsKey(work1)?ranking.get(work1)+1:1);
    ranking.put(work2,ranking.containsKey(work2)?ranking.get(work2)+1:1);
  }
    List<Map.Entry<String, Integer>> rank = new ArrayList<>(ranking.entrySet());
    Collections.sort(rank, new Comparator<Map.Entry<String, Integer>>() {
      @Override
      public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
        return o2.getValue().compareTo(o1.getValue());
      }
    });

  %>
    <td><%= rank.get(0).getKey() %></td>
  <td><%= rank.get(1).getKey() %></td>
  <td><%= rank.get(2).getKey() %></td>
  <td><%= rank.get(3).getKey() %></td>
  <td><%= rank.get(4).getKey() %></td>
  <form action="insert_prefer_cp.jsp" method="post">
    <input type="text" name="prefer_cp">
    <input type="submit" submit>
  </form>
  <a href="./login.jsp">login</a>
</body>
</html>
