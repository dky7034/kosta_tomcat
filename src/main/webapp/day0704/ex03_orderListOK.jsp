<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: donggyun
  Date: 2024. 7. 4.
  Time: 11:14
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
    request.setCharacterEncoding("utf-8");
    // 사용자가 요청한(입력한) 고객의 이름을 받아옵니다.
    String name = request.getParameter("name");
%>
<h2>
     <%= name %> 고객의 주문도서 목록
</h2>
<hr>
<table>
    <thead>
    <tr>
        <th>도서번호</th>
        <th>도서명</th>
        <th>가격</th>
        <th>출판사</th>
    </tr>
    </thead>
    <tbody>
    <%
        String sql = "select bookid, bookname, price, publisher from book\n" +
                "where bookid in (\n" +
                "select bookid from orders \n" +
                "where custid = (select custid from\n" +
                "customer where name = '" + name + "')\n" +
                ")";
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String username = "c##madang";
        String password = "madang";
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getInt("bookid") %>
        </td>
        <td><%= rs.getString("bookname") %>
        </td>
        <td><%= rs.getInt("price") %>
        </td>
        <td><%= rs.getString("publisher") %>
        </td>
    </tr>
    <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("예외 발생: " + e.getMessage());
        }
    %>
    </tbody>
</table>
</body>
</html>