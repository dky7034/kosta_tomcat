<%--
  Created by IntelliJ IDEA.
  User: donggyun
  Date: 2024. 7. 4.
  Time: 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 사용자가 요청한 문자셋은 한글입니다
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
%>
반갑습니다. <b><%= username %></b>님!
</body>
</html>
