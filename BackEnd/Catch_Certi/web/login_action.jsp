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

    String sql = "select * from users where userID = ? and userPassword = ?";

    try{
        // conn 생성
        conn = DriverManager.getConnection(url, uid, upw);

        // pstmt 생성
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userID);
        pstmt.setString(2, userPassword);
        // sql실행
        rs = pstmt.executeQuery();

        if(rs.next()){ // 로그인 성공(인증의 수단 session)
            String id = rs.getString("userID");
            String name = rs.getString("userName");

            session.setAttribute("user_id", id);
            session.setAttribute("user_name", name);

            response.sendRedirect("./home.jsp"); // 페이지이동

        } else{ // 로그인 실패
            response.sendRedirect("./login.jsp"); // 실패 페이지
        }
    } catch(Exception e){
        e.printStackTrace();
        response.sendRedirect("./index.jsp"); // 에러가 난 경우도 리다이렉트
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