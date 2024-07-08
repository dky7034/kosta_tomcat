<%--
  Created by IntelliJ IDEA.
  User: donggyun
  Date: 2024. 7. 5.
  Time: 09:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String content = request.getParameter("content");
        String content1 = request.getParameter("content1");
    %>

    name: <%=name%><br>
    content: [<%=content%>], <%=content.length()%><br>
    content1: [<%=content1%>], <%=content1.length()%><br>
</body>
</html>
