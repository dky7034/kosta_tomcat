<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: donggyun
  Date: 2024. 7. 4.
  Time: 12:46
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
    String address = request.getParameter("addr");
    int age = Integer.parseInt(request.getParameter("age"));
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    String[] hobby = request.getParameterValues("hobby");
    String hobby2 = String.join(", ", hobby);
    String gender = request.getParameter("gender");
    String bloodType = request.getParameter("bloodType");
    String job = request.getParameter("job");
    String food = request.getParameter("food");
    String intro = request.getParameter("intro");

    String sql = "INSERT INTO MEMBER(NO, NAME, ADDR, AGE, EMAIL, PWD, HOBBY, GENDER, BLOODTYPE, JOB, FOOD, INFO) \n" +
            "VALUES(SEQ_MEMBER.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) \n";
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:XE";
    String username = "c##kosta1234";
    String password = "kosta1234";
    try {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, username, password);
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, address);
        pstmt.setInt(3, age);
        pstmt.setString(4, email);
        pstmt.setString(5, pwd);
        pstmt.setString(6, hobby2);
        pstmt.setString(7, gender);
        pstmt.setString(8, bloodType);
        pstmt.setString(9, job);
        pstmt.setString(10, food);
        pstmt.setString(11, intro);

        int re = pstmt.executeUpdate();
        if (re > 0) {
%>
고객의 정보를 추가하였습니다.
<%
} else {
%>
고객 정보 추가에 실패했습니다.
<%
    }
%>
<%
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        System.out.println("kosta_tomcat/ex08_inputOK.jsp에서 에러 발생: " + e.getMessage());
    }
%>


</body>
</html>
