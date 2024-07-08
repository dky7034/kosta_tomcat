<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
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
<table>
    <thead>
    <tr>
        <th>NO</th>
        <th>이름</th>
        <th>주소</th>
        <th>나이</th>
        <th>이메일</th>
        <th>비밀번호</th>
        <th>취미</th>
        <th>성별</th>
        <th>혈액형</th>
        <th>직업</th>
        <th>좋아하는 음식</th>
        <th>자기소개</th>
    </tr>
    </thead>
    <tbody>
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

        //        String sql = "INSERT INTO MEMBER(NO, NAME, ADDR, AGE, EMAIL, PWD, HOBBY, GENDER, BLOODTYPE, JOB, FOOD, INFO) \n" +
//                "VALUES(SEQ_MEMBER.NEXTVAL, '김예은', '서울', 22, 'kim@naver.com', '1234', '수영, 마라톤', '여', 'O', '학생', '한식', '좋은사람')\n";
        String sql = "INSERT INTO MEMBER(NO, NAME, ADDR, AGE, EMAIL, PWD, HOBBY, GENDER, BLOODTYPE, JOB, FOOD, INFO) \n" +
                "VALUES(SEQ_MEMBER.NEXTVAL, '" + name + "', '" + address + "', '" + age + "', '" + email + "', '" + pwd + "', '" + hobby2 + "', '" + gender + "', '" + bloodType + "', '" + job + "', '" + food + "', '" + intro + "')\n";
        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        String username = "c##kosta1234";
        String password = "kosta1234";
        try {
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
    %>
    <tr>
        <td><%=rs.getInt("NO")%></td>
        <td><%=rs.getString("NAME")%></td>
        <td><%=rs.getString("ADDR")%></td>
        <td><%=rs.getString("AGE")%></td>
        <td><%=rs.getString("EMAIL")%></td>
        <td><%=rs.getString("PWD")%></td>
        <td><%=rs.getString("HOBBY")%></td>
        <td><%=rs.getString("GENDER")%></td>
        <td><%=rs.getString("BLOODTYPE")%></td>
        <td><%=rs.getString("JOB")%></td>
        <td><%=rs.getString("FOOD")%></td>
        <td><%=rs.getString("INTRO")%></td>
    </tr>
    <%
            }
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            System.out.println("kosta_tomcat/ex08_inputOK.jsp에서 에러 발생: " + e.getMessage());
        }
    %>
    </tbody>
</table>


</body>
</html>
