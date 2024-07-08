<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: donggyun
  Date: 2024. 7. 4.
  Time: 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>부서목록</h2>
<hr>
<table>
    <thead>
    <%
        try {
            String driver = "oracle.jdbc.drvier.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "c##madang";
            String password = "madang";
            String sql = "SELECT * FROM DEPT";

            // 1. jdbc 드라이버를 메모리로 로드
            Class.forName(driver);
            // 2. DB 서버에 연결
            Connection conn = DriverManager.getConnection(url, username, password);
            // 3. Statement 객체를 생성
            Statement stmt = conn.createStatement();
            // 4. sql 명령을 실행
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
    %>
    <tr>
        <%=
        rs.getInt(1)
        %>
        <%=
        rs.getString(2)
        %>
        <%=
        rs.getString(3)
        %>
    </tr>
    <%
            }
            // 사용했던 자원을 반환
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("kosta_tomcat/day0704/ex04_deptList에서 예외 발생: " + e.getMessage());
        }


    %>
    </thead>
</table>
</body>
</html>
