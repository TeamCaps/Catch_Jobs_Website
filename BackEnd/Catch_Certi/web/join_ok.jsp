<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>join_ok</title>
</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");


    // 1.변수선언
    String url = "jdbc:mysql://localhost:3306/dbtest";
    String uid = "caps";
    String upw = "1234";
    String user_id,user_pw;
    Connection conn = null;
    PreparedStatement pstmt = null;

    String sql = "";

    try{
        // 1. 드라이버 로드
        Class.forName("com.mysql.jdbc.Driver");

        // 2. conn 생성
        conn = DriverManager.getConnection(url, uid, upw);
        sql="insert into user(user_id,user_pwd) values (?,?)";

        // 3. pstmt 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);

        // 4. sql문 실행
        int result = pstmt.executeUpdate();

        if(result == 1){ // 성공
            response.sendRedirect("index.jsp");

        } else{ // 실패
            response.sendRedirect("login.jsp");
        }

    } catch(Exception e){
        e.printStackTrace();
    } finally{
        try{
            if(conn != null) conn.close();
            if(pstmt != null) pstmt.close();
        } catch(Exception e){
            e.printStackTrace();
        }
    }
%>

</body>
</html>
