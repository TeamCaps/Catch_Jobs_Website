<%--
  Created by IntelliJ IDEA.
  User: binwo
  Date: 2022-11-27
  Time: 오후 4:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
  alert("LOGOUT!!");
  location.href="./login.jsp";
</script>
<%
  session.invalidate();
%>

