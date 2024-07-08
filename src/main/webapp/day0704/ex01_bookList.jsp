<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: donggyun
  Date: 2024. 7. 4.
  Time: 09:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>도서목록</h2>
    <hr>
    <ul>
    <%
        try {
            String driver = "oracle.jdbc.driver.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "c##madang";
            String password = "madang";
            String sql = "SELECT BOOKNAME FROM BOOK";

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
                <li> <%= rs.getString(1)%> </li>
            <%
            }
            // 사용했던 자원을 반환(close)
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            System.out.println("kosta_tomcat/day0704/ex02_bookList에서 예외 발생: " + e.getMessage());
        }
    %>
    </ul>

</body>
</html>
