<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("UTF-8");

  String userID = request.getParameter("email");
  String userPassword = request.getParameter("pass");
  String userName = request.getParameter("name");
  String[] work = request.getParameterValues("interest[]");
  int i=4;

  // DB연결에 필요한 변수 선언
  String url = "jdbc:mysql://15.164.192.100:52817/caps";
  String uid = "caps";
  String upw = "1234";
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");
  } catch (ClassNotFoundException e) {
    System.err.println("JDBC 드라이버를 로드하는데에 문제 발생" + e.getMessage());
    e.printStackTrace();
  }

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  String sql = "insert into users values(?, ?, ?, ?, ?)";

  try{
    // conn 생성
    conn = DriverManager.getConnection(url, uid, upw);

    // pstmt 생성
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userID);
    pstmt.setString(2, userPassword);
    pstmt.setString(3, userName);
    for (String val:work){
      pstmt.setString(i,val);
      i++;
    }

    // 4. sql문 실행
    int result = pstmt.executeUpdate();

    if(result == 1){ // 성공
      System.err.println("회원가입 성공!");
      response.sendRedirect("./login.jsp");
    } else{ // 실패
      response.sendRedirect("./index.jsp");
    }
    // sql실행
    rs = pstmt.executeQuery();

  } catch(Exception e){
    e.printStackTrace();
  } finally{
    try{
      if(conn != null) conn.close();
      if(pstmt != null) pstmt.close();
      if(rs != null) rs.close();
    } catch(Exception e){
      e.printStackTrace();
    }
  }
%>