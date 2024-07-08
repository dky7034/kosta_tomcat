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
        String username = request.getParameter("username");
    %>
반갑습니다. <b><%= username %></b>님!
</body>
</html>
